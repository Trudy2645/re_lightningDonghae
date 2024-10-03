//
//  MyPageView.swift
//  lightningdonghae
//
//  Created by 문재윤 on 9/24/24.
//

import SwiftUI

struct MyPageView: View {
    @State private var favoriteSpots: [String] = [] // 좋아요 한 관광지 리스트
    
    
    var body: some View {
        VStack {
            Text("마이페이지")
                .font(.largeTitle)
                .padding()
            
            if favoriteSpots.isEmpty {
                Text("저장된 관광지가 없습니다.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(favoriteSpots, id: \.self) { spot in
                    Text(spot)
                }
            }
        }
        .padding()
    }
}
