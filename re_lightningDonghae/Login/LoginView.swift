//
//  LoginView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("testingLogo")
                .resizable()
                .frame(width: 90, height: 24)
                .padding(.trailing, 230)
                .padding(.bottom, 100)
                .padding(.top)
            Text("로그인")
                .font(.title3)
                .fontWeight(.heavy)
            Text("아이디")
                .font(.system(size: 17))
                .padding(.trailing, 234)
                .padding(.top, 20)
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
            
            // 로그인 버튼
            NavigationLink(destination: MainView()) {
                Text("로그인")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: 240, minHeight: 60)
                    .background(Color.my147DFA)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                    .fontWeight(.black)
            }
            
            NavigationLink(destination: CreateAccountView(), label: {
                Text("회원가입")
                    .foregroundStyle(Color.my626671)
                    .padding(.top, 10)
            })
            
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
