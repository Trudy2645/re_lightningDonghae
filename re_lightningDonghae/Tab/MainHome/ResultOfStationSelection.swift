//
//  ResultOfStationSelection.swift
//  re_lightningDonghae
//
//  Created by 트루디 on 10/3/24.
//

import Foundation
import SwiftUI

import SwiftUI

// 엠프티 뷰: 선택한 역 이름을 표시하고 일치하는 관광지 정보를 필터링하여 표시
struct ResultOfStationSelection: View {
    var station: String

    // 선택한 역과 일치하는 관광지 필터링
    var filteredTouristSpots: [TouristSpot] {
        return touristSpots.filter { spot in
            spot.nearestSubway == station
        }
    }

    var body: some View {
        VStack {
            if filteredTouristSpots.isEmpty {
                // 선택한 역과 일치하는 관광지가 없을 때 표시
                Text("\(station)역 정보가 없습니다.")
                    .font(.title)
                    .padding()
            } else {
                // 일치하는 관광지가 있을 때 해당 관광지 정보를 표시
                List(filteredTouristSpots) { spot in
                    TouristSpotCard(spot: spot)
                }
                .listStyle(PlainListStyle())  // 리스트 스타일 변경 (선택 사항)
            }
            Spacer()
        }
        .navigationBarTitle("검색결과", displayMode: .inline)
        .toolbar(content: {
            NavigationLink(destination: MainView(), label: {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundStyle(Color.my147DFA)
            })
        })
    }
}
