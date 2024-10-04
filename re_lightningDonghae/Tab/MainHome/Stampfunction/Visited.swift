//
//  Visited.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/4/24.
//

import SwiftUI

struct VisitedView: View {
    @State private var visitedSpots: [String] = [] // 방문한 관광지 배열

    var body: some View {
        NavigationView {
            List(visitedSpots, id: \.self) { spotName in
                Text(spotName) // 방문한 관광지 이름 표시
            }
            .navigationTitle("방문한 관광지")
            .onAppear {
                loadVisitedSpots() // 뷰가 나타날 때 방문한 관광지 로드
            }
        }
    }

    // UserDefaults에서 방문한 관광지 로드
    private func loadVisitedSpots() {
        visitedSpots = UserDefaults.standard.stringArray(forKey: "visitedSpots") ?? []
    }
}
