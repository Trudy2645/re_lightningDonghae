////
////  SignupView.swift
////  re_lightningDonghae
////
////  Created by 문재윤 on 10/3/24.
////
//
//import SwiftUI
//import Firebase
//import AuthenticationServices
//import CryptoKit
//import FirebaseAuth
//
//struct SignUpView: View {
//    @State private var currentNonce: String? // Unhashed nonce
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Sign Up with Apple")
//                .font(.largeTitle)
//                .padding()
//            
//            // Apple 로그인 버튼
//            SignInWithAppleButton(
//                .signUp,
//                onRequest: { request in
//                    let nonce = randomNonceString()
//                    currentNonce = nonce
//                    request.requestedScopes = [.fullName, .email]
//                    request.nonce = sha256(nonce)
//                },
//                onCompletion: handleAuthorization
//            )
//            .signInWithAppleButtonStyle(.black)
//            .frame(height: 50)
//            .cornerRadius(10)
//            .padding()
//        }
//        .padding()
//    }
//
//    // Apple 로그인 성공 후 처리
//    private func handleAuthorization(_ result: Result<ASAuthorization, Error>) {
//        switch result {
//        case .success(let authorization):
//            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//                guard let nonce = currentNonce else {
//                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
//                }
//                guard let appleIDToken = appleIDCredential.identityToken else {
//                    print("Unable to fetch identity token")
//                    return
//                }
//                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//                    return
//                }
//
//                // Firebase 인증 자격 증명 생성
//                let credential = OAuthProvider.appleCredential(
//                    withIDToken: idTokenString,
//                    rawNonce: nonce,
//                    fullName: appleIDCredential.fullName
//                )
//
//                // Firebase를 통한 회원가입/로그인 처리
//                Auth.auth().signIn(with: credential) { authResult, error in
//                    if let error = error {
//                        print("Error Apple sign in: \(error.localizedDescription)")
//                        return
//                    }
//                    // 로그인 성공 시 처리할 내용
//                    print("User signed in with Apple: \(authResult?.user.uid ?? "")")
//                }
//            }
//        case .failure(let error):
//            // 에러 처리
//            print("Authorization failed: \(error.localizedDescription)")
//        }
//    }
//
//    // 임의의 nonce 생성
//    private func randomNonceString(length: Int = 32) -> String {
//        precondition(length > 0)
//        var randomBytes = [UInt8](repeating: 0, count: length)
//        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
//        if errorCode != errSecSuccess {
//            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
//        }
//        let charset: [Character] =
//            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
//        let nonce = randomBytes.map { byte in
//            charset[Int(byte) % charset.count]
//        }
//        return String(nonce)
//    }
//
//    // SHA256 해시 함수
//    private func sha256(_ input: String) -> String {
//        let inputData = Data(input.utf8)
//        let hashedData = SHA256.hash(data: inputData)
//        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
//    }
//}
//
//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
