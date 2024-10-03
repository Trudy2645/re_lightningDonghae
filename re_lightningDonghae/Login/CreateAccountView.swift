//
//  CreateAccountView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
import SwiftUI

struct CreateAccountView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("회원가입")
                .font(.title3)
                .fontWeight(.heavy)
            Text("이름")
                .font(.system(size: 17))
                .padding(.trailing, 234)
                .padding(.top, 20)
            // 아이디 입력 필드
            TextField("이름을 입력하세요.", text: $name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.my84B9F7, lineWidth: 1))
                .padding(.horizontal, 56)
//                .padding(.bottom, 10)
            Text("아이디")
                .font(.system(size: 17))
                .padding(.trailing, 234)
                .padding(.top, 10)
            // 아이디 입력 필드
            TextField("아이디를 입력하세요.", text: $username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.my84B9F7, lineWidth: 1))
                .padding(.horizontal, 56)
                .padding(.bottom, 10)
            
            Text("비밀번호")
                .font(.system(size: 17))
                .padding(.trailing, 218)
            
            // 비밀번호 입력 필드
            SecureField("비밀번호를 입력하세요.", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.my84B9F7, lineWidth: 1))
                .padding(.horizontal, 56)
            
            Text("비밀번호 확인")
                .font(.system(size: 17))
                .padding(.trailing, 180)
                .padding(.top)
            
            // 비밀번호 입력 필드
            SecureField("비밀번호를 입력하세요.", text: $confirmPassword)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.my84B9F7, lineWidth: 1))
                .padding(.horizontal, 56)
            
            // 로그인 버튼
            NavigationLink(destination: LoginView()) {
                Text("회원가입")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: 240, minHeight: 60)
                    .background(Color.my147DFA)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
    }
}

#Preview {
    CreateAccountView()
}
