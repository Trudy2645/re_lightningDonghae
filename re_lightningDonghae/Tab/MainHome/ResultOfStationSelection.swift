//
//  ResultOfStationSelection.swift
//  re_lightningDonghae
//
//  Created by 트루디 on 10/3/24.
//

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
                // ForEach를 사용하여 클릭 효과 없는 커스텀 리스트 생성
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(filteredTouristSpots) { spot in
                            TouristSpotCard(spot: spot)
                        }
                    }
                    .padding()
                }
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
