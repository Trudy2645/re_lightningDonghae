//
//  Popup.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/4/24.
//
import SwiftUI

struct StampPopupView: View {
    let spot: TouristSpot
    @Binding var isPresented: Bool // 팝업 표시 여부 바인딩

    var body: some View {
        VStack(spacing: 20) {
            Text("스탬프 찍기")
                .font(.headline)
            
            // 관광지 이미지 표시
            AsyncImage(url: URL(string: spot.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200) // 이미지 크기 조정
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView() // 이미지를 로드하는 동안 표시할 로딩 표시
            }

            Text("\(spot.name)에 방문 완료하셨나요?")
                .multilineTextAlignment(.center)
                .padding()

            HStack {
                Button("확인") {
                    saveToVisitedSpots()
                    isPresented = false // 팝업 닫기
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("취소") {
                    isPresented = false // 팝업 닫기
                }
                .padding()
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }

    // 방문한 관광지 이름 저장
    private func saveToVisitedSpots() {
        var visitedSpots = UserDefaults.standard.stringArray(forKey: "visitedSpots") ?? []
        if !visitedSpots.contains(spot.name) {
            visitedSpots.append(spot.name)
            UserDefaults.standard.set(visitedSpots, forKey: "visitedSpots")
        }
    }
}
