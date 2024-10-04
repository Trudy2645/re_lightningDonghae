import SwiftUI

import SwiftUI

struct SubwayMapView: View {
    @State private var selectedStation: String?
    @State private var isSheetPresented = false
    
    // 영어 역 이름과 한국어 역 이름 매핑
    let stationNameMapping: [String: String] = [
        "Bujeon": "부전역",
        "Geojehaemaji": "거제해맞이역",
        "Geoje": "거제역",
        "Busan Nat'l Univ. of Edu.": "교대역",
        "Dongnae": "동래역",
        "Allak": "안락역",
        "Songjeong": "송정역",
        "Sinhaeundae": "신해운대역",
        "BEXCO": "벡스코역",
        "Centum": "센텀역",
        "Jaesong": "재송역",
        "Busanwondong": "원동역",
        "OSIRIA": "오시리아역",
        "Gijang": "기장역",
        "Ilgwang": "일광역",
        "Jwacheon": "좌천역",
        "Wollae": "월내역",
        "Seosaeng": "서생역",
        "Taehwagang": "태화강역",
        "Gaeunpo": "개운포역",
        "Deokha": "덕하역",
        "Mangyang": "망양역",
        "Namchang": "남창역"
    ]

    let stations = [
        ["Bujeon", "Geojehaemaji", "Geoje", "Busan Nat'l Univ. of Edu.", "Dongnae", "Allak"],
        ["Songjeong", "Sinhaeundae", "BEXCO", "Centum", "Jaesong", "Busanwondong"],
        ["OSIRIA", "Gijang", "Ilgwang", "Jwacheon", "Wollae", "Seosaeng"],
        ["Taehwagang", "Gaeunpo", "Deokha", "Mangyang", "Namchang"]
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("동해선 노선표")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                ZStack {
                    SubwayLines()
                    VStack(alignment: .leading, spacing: 40) {
                        ForEach(0..<4) { index in
                            HStack(spacing: 0) {
                                ForEach(stations[index], id: \.self) { station in
                                    // 한국어 이름으로 버튼을 만듭니다.
                                    StationButton(
                                        station: station,
                                        koreanName: stationNameMapping[station] ?? station, // 한국어 이름 사용
                                        selectedStation: $selectedStation,
                                        isSheetPresented: $isSheetPresented
                                    )
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    // 초기 값 설정
                    if selectedStation == nil {
                        selectedStation = stations.first?.first // 첫 번째 역을 선택
                    }
                }
                
                Spacer()
            }
            .sheet(isPresented: Binding(
                get: { isSheetPresented && selectedStation != nil },
                set: { isSheetPresented = $0 }
            )) {
                if let station = selectedStation {
                    StationDetailView(station: station, stationNameMapping: stationNameMapping)
                        .presentationDetents([.height(200)])
                }
            }
        }.preferredColorScheme(.light)
    }
}

struct SubwayLines: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let lineSpacing = height / 4.5 // 라인 간의 간격 조정
                let space: CGFloat = 20
                let cornerRadius: CGFloat = 20 // 둥글게 할 반지름

                // 첫 번째 수평선
                path.move(to: CGPoint(x: space, y: 58)) // 시작점
                path.addLine(to: CGPoint(x: width - space - cornerRadius, y: 58)) // 첫 수평선

                // 첫 번째 라운드 코너 (오른쪽 위)
                path.addArc(center: CGPoint(x: width - space - cornerRadius, y: 58 + cornerRadius),
                            radius: cornerRadius,
                            startAngle: .degrees(270),
                            endAngle: .degrees(0),
                            clockwise: false)

                // 첫 번째 수직선
                path.addLine(to: CGPoint(x: width - space, y: 58 + lineSpacing - cornerRadius))

                // 두 번째 라운드 코너 (오른쪽 아래)
                path.addArc(center: CGPoint(x: width - space - cornerRadius, y: 58 + lineSpacing - cornerRadius),
                            radius: cornerRadius,
                            startAngle: .degrees(0),
                            endAngle: .degrees(90),
                            clockwise: false)

                // 두 번째 수평선
                path.addLine(to: CGPoint(x: space + cornerRadius - 10, y: 58 + lineSpacing))

//                // 세 번째 라운드 코너 (왼쪽 위)
//                path.addArc(center: CGPoint(x: space + cornerRadius, y: 58 + lineSpacing + cornerRadius),
//                            radius: cornerRadius,
//                            startAngle: .degrees(-180),
//                            endAngle: .degrees(-90),
//                            clockwise: false)

//                 두 번째 수직선
                path.addLine(to: CGPoint(x: space + cornerRadius - 10, y: 55 + 2 * lineSpacing ))

//                // 네 번째 라운드 코너 (왼쪽 아래)
//                path.addArc(center: CGPoint(x: space + cornerRadius, y: 55 + 2 * lineSpacing - cornerRadius),
//                            radius: cornerRadius,
//                            startAngle: .degrees(90),
//                            endAngle: .degrees(180),
//                            clockwise: false)

                // 세 번째 수평선
                path.addLine(to: CGPoint(x: width - space - cornerRadius, y: 55 + 2 * lineSpacing ))

                // 다섯 번째 라운드 코너 (오른쪽 위)
                path.addArc(center: CGPoint(x: width - space - cornerRadius, y: 55 + 2 * lineSpacing + cornerRadius),
                            radius: cornerRadius,
                            startAngle: .degrees(270),
                            endAngle: .degrees(0),
                            clockwise: false)

                // 세 번째 수직선
                path.addLine(to: CGPoint(x: width - space, y: 55 + 3 * lineSpacing - cornerRadius))

                // 여섯 번째 라운드 코너 (오른쪽 아래)
                path.addArc(center: CGPoint(x: width - space - cornerRadius, y: 55 + 3 * lineSpacing - cornerRadius),
                            radius: cornerRadius,
                            startAngle: .degrees(0),
                            endAngle: .degrees(90),
                            clockwise: false)

                // 네 번째 수평선
                path.addLine(to: CGPoint(x: space + cornerRadius, y: 55 + 3 * lineSpacing))

            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)) // 선 끝 및 모서리 둥글게
        }
    }
}





struct StationButton: View {
    let station: String
    let koreanName: String // 추가된 부분
    @Binding var selectedStation: String?
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        Button(action: {
            selectedStation = station
            if selectedStation != nil {
                isSheetPresented = true
            }
        }) {
            VStack(spacing: 0) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 3)
                    )
                
                Text(koreanName) // 한국어 이름 표시
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .rotationEffect(.degrees(60))
                    .frame(width: 60, height: 100)
                    .offset(y: -10)
            }
        }
        .frame(width: 60, height: 100)
    }
}

struct SubwayMapView_Previews: PreviewProvider {
    static var previews: some View {
        SubwayMapView()
    }
}
