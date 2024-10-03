//
//  ContentView.swift
//  lightningdonghae
//
//  Created by 문재윤 on 9/24/24.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        TabView{
            SubwayMapView() // 첫 번째 탭: 동해선 지하철 노선도
                .tabItem {
                    Image(systemName: "tram.fill")
                    Text("지하철 노선도")
                }
            
            MainView() // 두 번째 탭: 라이프스타일 및 도착역 선택
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("라이프스타일 선택")
                }
            
            MyPageView() // 세 번째 탭: 마이페이지
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("마이페이지")
                }
        }
    }
}
