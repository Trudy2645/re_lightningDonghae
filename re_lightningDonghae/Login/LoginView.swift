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
    @State private var isLoggedIn = false // 로그인 상태 관리

    var body: some View {
        NavigationStack {
            VStack {
                if isLoggedIn {
                    // 로그인 완료 시 MainView로 자동 이동
                    MainView()
                } else {
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
            }
        }
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
                
                // 로그인 성공 후 상태를 true로 설정 -> MainView로 이동
                isLoggedIn = true
            }
        }
    }

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

    private func createMaskedNickname(from email: String) -> String {
        let parts = email.split(separator: "@")
        guard let namePart = parts.first else {
            return "Unknown"
        }
        
        let name = String(namePart)
        if name.count <= 2 {
            return name
        }
        
        let startIndex = name.index(name.startIndex, offsetBy: 2)
        let endIndex = name.index(name.endIndex, offsetBy: -2)
        let maskedPart = String(repeating: "*", count: name.distance(from: startIndex, to: endIndex))
        
        return String(name.prefix(2)) + maskedPart + String(name.suffix(2))
    }

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

    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

#Preview {
    LoginView()
}
