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
//import SwiftUI
//
//struct AnswerView: View {
//    let answer: String
//
//    // 주어진 이름을 기준으로 필터링된 관광지 리스트
//    var filteredSpots: [TouristSpot] {
//        let names = answer.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
//        return touristSpots.filter { spot in
//            names.contains(spot.name)
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            List(filteredSpots) { spot in
//                TouristSpotCard(spot: spot)  // 필터링된 관광지 카드를 표시
//            }
//            .navigationTitle("AI 응답")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//import SwiftUI
//
//struct AnswerView: View {
//    let answer: String
//
//    // 주어진 카테고리를 기준으로 필터링된 관광지 리스트
//    var filteredSpots: [TouristSpot] {
//        // AI 응답에서 콤마로 구분된 여러 카테고리를 추출하고, 공백 제거
//        let categories = answer.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
//        
//        return touristSpots.filter { spot in
//            categories.contains(spot.category) // 관광지의 카테고리가 AI 응답 카테고리 중 하나와 일치하는지 확인
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            if filteredSpots.isEmpty {
//                Text("해당 카테고리와 일치하는 관광지가 없습니다.")
//                    .font(.headline)
//                    .padding()
//            } else {
//                List(filteredSpots) { spot in
//                    TouristSpotCard(spot: spot)  // 필터링된 관광지 카드를 표시
//                }
//            }
//        }
//        .navigationTitle("AI 응답")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
