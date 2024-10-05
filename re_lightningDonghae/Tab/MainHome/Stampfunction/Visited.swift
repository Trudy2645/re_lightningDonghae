//
//  Visited.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/4/24.
//

import SwiftUI

struct VisitedView: View {
    @State private var visitedSpots: [TouristSpot] = [] // 방문한 관광지 배열

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    ForEach(visitedSpots, id: \.name) { spot in
                        ZStack{
                            TouristSpotCard(spot: spot) // TouristSpotCard를 사용하여 관광지 정보 표시
                            Image("도장")
                                .resizable()
                                .frame(width: 86, height: 86)
                                .rotationEffect(.degrees(-45)) // 45도 회전 적용
                                .padding(.leading, 200)
                                .opacity(0.3)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("방문한 관광지")
            .onAppear {
                loadVisitedSpots() // 뷰가 나타날 때 방문한 관광지 로드
            }
        }
    }

    // UserDefaults에서 방문한 관광지를 로드하고 TouristSpot과 매칭
    private func loadVisitedSpots() {
        let savedSpotNames = UserDefaults.standard.stringArray(forKey: "visitedSpots") ?? []

        // 이름이 저장된 관광지와 매칭
        visitedSpots = touristSpots.filter { spot in
            savedSpotNames.contains(spot.name)
        }
    }
}
