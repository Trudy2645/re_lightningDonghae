//// 전철역 정보를 담을 구조체
//import SwiftUI
//
//struct SubwayStation: Identifiable {
//    let id: UUID = UUID()
//    let name: String
//}
//
//// 샘플 전철역 리스트
//let subwayStations = [
//    SubwayStation(name: "경복궁역"),
//    SubwayStation(name: "명동역"),
//    SubwayStation(name: "잠실역"),
//    SubwayStation(name: "서울역")
//]
//
//struct StationView: View {
//    var body: some View {
//        NavigationView {
//            SubwayStationListView()  // 전철역 리스트 뷰로 이동
//                .navigationTitle("전철역 리스트")
//        }
//    }
//}
//
//// 전철역 리스트 뷰
//struct SubwayStationListView: View {
//    var body: some View {
//        List(subwayStations) { station in
//            NavigationLink(destination: TouristSpotListView(station: station)) {
//                Text(station.name)  // 전철역 이름
//                    .padding()
//            }
//        }
//    }
//}
//
//// 선택한 전철역에 가까운 관광지 리스트 뷰
//struct TouristSpotListView: View {
//    let station: SubwayStation  // 선택된 전철역
//    
//    var body: some View {
//        List(filteredTouristSpots) { spot in
//            TouristSpotCard(spot: spot)  // 각 관광지 정보를 카드 형식으로 표현
//        }
//        .navigationTitle("\(station.name) 주변 관광지")  // 선택된 전철역 제목
//    }
//    
//    // 선택한 전철역에 해당하는 관광지 필터링
//    var filteredTouristSpots: [TouristSpot] {
//        touristSpots.filter { $0.nearestSubway == station.name }  // 전철역에 맞는 관광지 필터링
//    }
//}
//
//#Preview {
//    StationView()
//}
