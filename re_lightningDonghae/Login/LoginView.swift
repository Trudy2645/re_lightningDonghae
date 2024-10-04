//
//  LoginView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//


import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import AuthenticationServices
import CryptoKit

struct LoginView: View {
    @State private var currentNonce: String?
    
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                let nonce = randomNonceString()
                currentNonce = nonce
                request.requestedScopes = [.fullName, .email]
                request.nonce = sha256(nonce)
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    guard let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                        print("Apple ID Credential not found.")
                        return
                    }
                    signInWithFirebase(credential: appleIDCredential)
                    
                case .failure(let error):
                    print("Apple Sign In failed: \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
        .frame(width: 280, height: 60)
    }
    
    private func signInWithFirebase(credential: ASAuthorizationAppleIDCredential) {
        guard let token = credential.identityToken else {
            print("Identity token is missing.")
            return
        }
        
        guard let idTokenString = String(data: token, encoding: .utf8) else {
            print("Unable to serialize token string from data: \(token.debugDescription)")
            return
        }

        // currentNonce를 안전하게 언랩합니다.
        guard let nonce = currentNonce else {
            print("Current nonce is missing.")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
        
        Auth.auth().signIn(with: firebaseCredential) { authResult, error in
            if let error = error {
                print("Firebase Sign In failed: \(error.localizedDescription)")
                return
            }
            
            // Firebase 로그인 성공 후 사용자 저장
            if let user = authResult?.user {
                let nickname = createMaskedNickname(from: user.email ?? "unknown")
                saveUserToFirestore(user: user, nickname: nickname)
            }
        }
    }
    
    // Firestore에 사용자 저장
    private func saveUserToFirestore(user: User, nickname: String) {
        let db = Firestore.firestore()

        let userDoc = db.collection("users").document(user.uid)

        userDoc.setData([
            "uid": user.uid,
            "email": user.email ?? "",
            "nickname": nickname,
            "displayName": user.displayName ?? "No Name"
        ]) { error in
            if let error = error {
                print("Error saving user to Firestore: \(error.localizedDescription)")
            } else {
                print("User successfully saved to Firestore with nickname \(nickname)")
            }
        }
    }

    // 이메일에서 닉네임 마스킹
    private func createMaskedNickname(from email: String) -> String {
        let parts = email.split(separator: "@")
        guard let namePart = parts.first else {
            return "Unknown"
        }
        
        let name = String(namePart) // Substring을 String으로 변환
        if name.count <= 2 {
            return name  // 이름이 너무 짧으면 마스킹하지 않음
        }
        
        // 이름의 앞 2글자와 뒤 2글자를 유지하고 중간을 *로 마스킹
        let startIndex = name.index(name.startIndex, offsetBy: 2)
        let endIndex = name.index(name.endIndex, offsetBy: -2)
        let maskedPart = String(repeating: "*", count: name.distance(from: startIndex, to: endIndex))
        
        return String(name.prefix(2)) + maskedPart + String(name.suffix(2)) // Substring을 String으로 변환 후 사용
    }

    // 랜덤 Nonce 생성 함수
    private func randomNonceString(length: Int = 32) -> String {
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0..<16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }

    // SHA256 해시 함수
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}
