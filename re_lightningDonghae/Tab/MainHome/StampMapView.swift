import SwiftUI
import MapKit

struct StampMapView: View {
    var body: some View {
         NavigationView {
             MapView()
                 .navigationTitle("관광지 지도")
         }
     }
}


struct MapView: View {
    @State private var selectedSpot: TouristSpot?  // 선택된 관광지 정보 저장
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // 서울 중심 좌표
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        ZStack {
            // 지도 뷰에 핀과 제스처 추가
            Map(coordinateRegion: $region, annotationItems: touristSpots) { spot in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: spot.latitude, longitude: spot.longitude)) {
                    Button(action: {
                        selectedSpot = spot  // 핀 클릭 시 해당 관광지 선택
                    }) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)

            // 선택된 관광지 카드 표시
            if let selectedSpot = selectedSpot {
                VStack {
                    Spacer()
                    TouristSpotCard(spot: selectedSpot)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .transition(.move(edge: .bottom))  // 애니메이션 효과 추가
                }
                .padding()
            }
        }
    }
}

struct StampMapView_Previews: PreviewProvider {
    static var previews: some View {
        StampMapView()
    }
}
