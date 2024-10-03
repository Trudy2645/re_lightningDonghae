//
//  AnswerView.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/3/24.
//
//import SwiftUI
//
//struct AnswerView: View {
//    let answer: String
//    
//    var body: some View {
//        VStack {
//            Text(answer)
//                .padding()
//                .navigationTitle("AI 응답")
//                .navigationBarTitleDisplayMode(.inline)
//            Spacer()
//        }
//    }
//}
import SwiftUI

struct AnswerView: View {
    let answer: String

    // 주어진 이름을 기준으로 필터링된 관광지 리스트
    var filteredSpots: [TourlistSpot] {
        let names = answer.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        return touristSpots.filter { spot in
            names.contains(spot.name)
        }
    }
    
    var body: some View {
        VStack {
            List(filteredSpots) { spot in
                TouristSpotCard(spot: spot)  // 필터링된 관광지 카드를 표시
            }
            .navigationTitle("AI 응답")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
