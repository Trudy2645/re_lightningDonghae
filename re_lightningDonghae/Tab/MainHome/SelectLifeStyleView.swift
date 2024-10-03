//
//  SelectLifeStyleView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
import SwiftUI


import SwiftUI

struct SelectLifeStyleView: View {
    @State private var searchText: String = "" // 입력 텍스트
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("오늘은")
                    .font(.title)
//                    .fontWeight(.bold)
                
                HStack(spacing: 0) {
                    Text("어떤 ")
                    Text("하루")
                        .foregroundStyle(Color.my147DFA)
                        .bold()
                    
                    Text("를 보내고 싶나요?")
                }
                .font(.title)
//                .fontWeight(.bold)
                
                Text("적어주신 내용을 바탕으로 AI가 장소를 추천해드립니다.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // 텍스트 필드와 플레이스홀더
                ZStack {
                    if searchText.isEmpty {
                        Text("시원한 바람을 맞으며 산책하고 싶어.")
                            .foregroundStyle(Color.myB0B2B8)
                            .padding(.trailing, 108)
                    }
                    
                    TextField("", text: $searchText)
                        .padding(.vertical, 10)
                        .font(.body)
                    // 밑줄
                    Rectangle()
                        .frame(width: 353, height: 1) // 밑줄 두께
                        .foregroundStyle(Color.myB0B2B8) // 밑줄 색상
                        .padding(.top, 30)
                    NavigationLink(destination: AILottiView(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .padding(.leading, 320)
                    })
                }
                .padding(.vertical, 10)
                
                Text("추천 검색어")
                    .font(.headline)
                    .padding(.top, 20)
                    .bold()
                
                // 첫 번째 줄 추천 검색어 버튼들
                HStack {
                    ForEach(["러닝", "여행", "이색체험", "맛집"], id: \.self) { keyword in
                        NavigationLink(destination: Text(keyword)) {
                            Text(keyword)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.myDEE9F5)
                                .cornerRadius(10)
                                .foregroundStyle(Color.my4195F9)
                                .bold()
                        }
                    }
                }
                .padding(.vertical, 10)
                
                // 두 번째 줄 추천 검색어 버튼들
                HStack {
                    ForEach(["힐링", "카페", "쇼핑"], id: \.self) { keyword in
                        NavigationLink(destination: Text(keyword)) {
                            Text(keyword)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.vertical, 5)
                
                Spacer()
            }
            .padding()
            .padding(.top, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLifeStyleView()
    }
}
