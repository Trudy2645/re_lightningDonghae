//
//  ContentView.swift
//  lightningdonghae
//
//  Created by 문재윤 on 9/24/24.
//

import SwiftUI
import Combine
import CoreLocation

struct TabBarView: View {
    @StateObject private var locationManager = LocationManager() // 위치 관리
    @State private var showStampPopup = false // 스탬프 팝업 표시 여부
    @State private var touristSpotToStamp: TouristSpot? // 스탬프를 찍을 관광지

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
                .onAppear {
                    checkProximityToTouristSpots()
                }
                
            SubwayMapView()
                .tabItem {
                    Image(systemName: "tram.fill")
                    Text("동해선 노선표")
                }
                .onAppear {
                    checkProximityToTouristSpots()
                }
                
            VisitedView()
                .tabItem {
                    Image(systemName: "person")
                    Text("스탬프")
                }
                .onAppear {
                    checkProximityToTouristSpots()
                }
        }
        .sheet(isPresented: $showStampPopup) {
            if let spot = touristSpotToStamp {
                StampPopupView(spot: spot, isPresented: $showStampPopup)
            }
        }
    }

    private func checkProximityToTouristSpots() {
        // 현재 위치에서 가까운 관광지 확인
        guard let currentLocation = locationManager.location else { return }
        
        if let closestSpot = touristSpots.first(where: { spot in
            let spotLocation = CLLocation(latitude: spot.latitude, longitude: spot.longitude)
            return currentLocation.distance(from: spotLocation) < 1000 // 1km 이내
        }) {
            // 가까운 관광지가 있으면 팝업을 표시하기 위한 관광지 설정
            touristSpotToStamp = closestSpot
            showStampPopup = true // 팝업 열기
        } else {
            // 가까운 관광지가 없으면 팝업을 숨김
            touristSpotToStamp = nil
            showStampPopup = false
        }
    }
}
