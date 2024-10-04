import SwiftUI

struct SubwayMapView: View {
    @State private var selectedStation: String?
    @State private var isSheetPresented = false
    
    let stations = [
        ["Bujeon", "Geojehaemaji", "Geoje", "Busan Nat'l Univ. of Edu.", "Dongnae", "Allak"],
        ["Songjeong", "Sinhaeundae", "BEXCO", "Centum","Jaesong","Busanwondong"],
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
                                    StationButton(station: station, selectedStation: $selectedStation, isSheetPresented: $isSheetPresented)
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    // 초기 값 설정, 예를 들어 첫 번째 역을 기본으로 선택
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
                    StationDetailView(station: station)
                        .presentationDetents([.height(200)])
                }
            }       }.preferredColorScheme(.light)
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
    @Binding var selectedStation: String?
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        Button(action: {
            // 역이 선택되면 먼저 `selectedStation`을 설정
            selectedStation = station
            
            // 선택된 역이 있는지 확인한 후 시트를 열기
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
                            .stroke(Color.my3356B4, lineWidth: 3)
                    )
                
                Text(station)
                    .font(.system(size: 17))
                    .foregroundStyle(Color.black)
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
