//import SwiftUI
//
//// 역 리스트
//let stations = [
//    "부전역", "거제해맞이역", "거제역", "부산교대역", "동래역", "안락역", "부산원동역",
//    "재송역", "센텀역", "벡스코역", "신해운대역", "송정역", "오시리아역", "기장역", "일광역",
//    "좌천역", "월내역", "서생역", "남창역", "망양역", "덕하역", "개운포역", "태화강역"
//]
//
//// 메인 화면: 역 리스트
//struct SelectArrivalStation: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                Text("도착역 선택하기")
//                    .font(.title)
//                    .bold()
//                    .padding(.trailing, 190)
//                    .padding(.top)
//                ForEach(Array(stations.enumerated()), id: \.offset) { index, station in
//                    VStack {
//                        HStack{
//                            if index != 0 {
//                                DottedLine() // 원으로 된 두 개의 점선
//                                    .frame(width: 4, height: 10)
//                                    .foregroundColor(Color.my58A2F9)
//                                    .padding(.leading, 30)
//                            }
//                            Spacer()
//                        }
//                        NavigationLink(destination: ResultOfStationSelection(station: station)) {
//                            HStack {
//                                Circle()
//                                    .fill(Color.my4195F9)
//                                    .frame(width: 30, height: 30)
//                                    .overlay(Text("\(index + 1)").foregroundColor(.white))
//                                
//                                Text("\(station)")
//                                    .font(.system(size: 17))
//                                    .padding(.leading, 10)
//                                    .foregroundStyle(Color.black)
//                                
//                                Spacer()
//                            }
//                            .padding()
//                            .background(Color.myDEE9F5)
//                            .cornerRadius(10)
//                            .frame(width: 353, height: 60)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }
//}
//
//// 두 개의 원을 표시하는 점선 그리기 컴포넌트
//struct DottedLine: View {
//    var body: some View {
//        VStack(spacing: 5) { // 원 사이의 간격을 조정
//            Circle()
//                .frame(width: 4, height: 4)
//            Circle()
//                .frame(width: 4, height: 4)
//        }
//    }
//}
//
import SwiftUI



// ViewModel: Google Places API 호출 및 데이터 처리
class Places1ViewModel: ObservableObject {
    
    @Published var touristSpots: [TouristSpot] = []
    
    // Google Places API 호출
    func fetchNearbyPlaces(for station: String) {
        let subwayStations = [
            SubwayStation(name: "부전역 동해선", latitude: 35.164668, longitude: 129.06011),
            SubwayStation(name: "거제해맞이역 동해선", latitude: 35.182197, longitude:129.069315),
            SubwayStation(name: "거제역 동해선", latitude: 35.188587, longitude:129.073904),
            SubwayStation(name: "부산 교대역 동해선", latitude: 35.19396, longitude:129.0798),
            SubwayStation(name: "동래역 동해선", latitude: 35.205614, longitude:129.078502),
            SubwayStation(name: "안락역 동해선", latitude: 35.195907, longitude:129.101062),
            SubwayStation(name: "부산원동 동해선", latitude: 35.362703, longitude:128.920499),
            SubwayStation(name: "재송역 동해선", latitude: 35.189, longitude:129.120919),
            SubwayStation(name: "센텀역 동해선", latitude: 35.168921, longitude:129.131659),
            SubwayStation(name: "벡스코역 동해선", latitude: 35.16899, longitude:129.13868),
            SubwayStation(name: "신해운대역 동해선", latitude: 35.181832, longitude:129.176696),
            SubwayStation(name: "송정역 동해선", latitude: 35.137559, longitude:126.791535),
            SubwayStation(name: "오시리아역 동해선", latitude: 35.196256, longitude:129.208291),
            SubwayStation(name: "기장역 동해선", latitude: 35.243027, longitude:129.218551),
            SubwayStation(name: "일광역 동해선", latitude: 35.265565, longitude:129.233307),
            SubwayStation(name: "좌천역 동해선", latitude: 35.311838, longitude:129.241097),
            SubwayStation(name: "월내역 동해선", latitude: 35.328177, longitude:129.272625),
            SubwayStation(name: "서생역 동해선", latitude: 35.345121, longitude:129.28904),
            SubwayStation(name: "남창역 동해선", latitude: 35.419713, longitude:129.278077),
            SubwayStation(name: "양양역 동해선", latitude: 35.456519, longitude:129.283667),
            SubwayStation(name: "덕하역 동해선", latitude: 35.494007, longitude:129.29894),
            SubwayStation(name: "개운포역 동해선", latitude: 35.507884, longitude:129.31697),
            SubwayStation(name: "태화강역 동해선", latitude: 35.538669, longitude:129.349169),
        ]
        
        let apiKey = "YOUR_GOOGLE_PLACES_API_KEY" // 여기에 Google Places API 키를 입력
        
        // 선택된 지하철역 찾기
        guard let stationData = subwayStations.first(where: { $0.name.contains(station) }) else { return }
        
        touristSpots = []
        let location = "\(stationData.latitude),\(stationData.longitude)"
        let radius = 1000 // 검색 반경 1km
        
        // Fetch places to visit
        fetchPlaces(keyword: "가볼만한곳", location: location, radius: radius, stationData: stationData)
        // Fetch restaurants
        fetchPlaces(keyword: "명소", location: location, radius: radius, stationData: stationData)
        fetchPlaces(keyword: "명물", location: location, radius: radius, stationData: stationData)
    }
    
    private func fetchPlaces(keyword: String, location: String, radius: Int, stationData: SubwayStation) {
        let apiKey = "AIzaSyDppGeK7XZRzImgjF4olNW7Nmh5HPQ3xRc" // 여기에 Google Places API 키를 입력
        
        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location)&radius=\(radius)&keyword=\(keyword)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(PlaceResponse.self, from: data)
                    
                    // 관광지 정보를 TouristSpot으로 변환
                    let newSpots = result.results.map { place -> TouristSpot in
                        let imageURL: String
                        if let photoReference = place.photos?.first?.photo_reference {
                            imageURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(apiKey)"
                        } else {
                            imageURL = ""
                        }
                        
                        return TouristSpot(
                            name: place.name,
                            latitude: place.geometry.location.lat,
                            longitude: place.geometry.location.lng,
                            category: stationData.name, // 여기에서 stationData.name을 사용하여 카테고리를 설정
                            address: place.vicinity,
                            nearestSubway: stationData.name,
                            description: "추천된 장소입니다.",
                            imageURL: imageURL
                        )
                    }
                    
                    DispatchQueue.main.async {
                        self.touristSpots.append(contentsOf: newSpots) // 결과를 touristSpots에 추가
                    }
                } catch {
                    print("Error decoding: \(error)")
                }
            }
        }.resume()
    }
}
// 메인 화면: 역 리스트
struct SelectArrivalStation: View {
    @StateObject private var placesViewModel = Places1ViewModel() // ViewModel을 StateObject로 선언
    
    let subwayStations = [
        "부전역 동해선",
        "거제해맞이역 동해선",
        "거제역 동해선",
        "부산 교대역 동해선",
        "동래역 동해선",
        "안락역 동해선",
        "부산원동 동해선",
        "재송역 동해선",
        "센텀역 동해선",
        "벡스코역 동해선",
        "신해운대역 동해선",
        "송정역 동해선",
        "오시리아역 동해선",
        "기장역 동해선",
        "일광역 동해선",
        "좌천역 동해선",
        "월내역 동해선",
        "서생역 동해선",
        "남창역 동해선",
        "양양역 동해선",
        "덕하역 동해선",
        "개운포역 동해선",
        "태화강역 동해선"
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                Text("도착역 선택하기")
                    .font(.title)
                    .bold()
                    .padding(.trailing, 190)
                    .padding(.top)
                
                ForEach(Array(subwayStations.enumerated()), id: \.offset) { index, station in
                    VStack {
                        HStack {
                            if index != 0 {
                                DottedLine() // 원으로 된 두 개의 점선
                                    .frame(width: 4, height: 10)
                                    .foregroundColor(Color.my58A2F9)
                                    .padding(.leading, 30)
                            }
                            Spacer()
                        }
                        NavigationLink(
                            destination: ResultOfStationSelection(
                                station: station,
                                placesViewModel: placesViewModel // ViewModel을 전달
                            )
                            .onAppear {
                                // 선택된 역 주위의 관광지 검색
                                placesViewModel.fetchNearbyPlaces(for: station)
                            }
                        ) {
                            HStack {
                                Circle()
                                    .fill(Color.my4195F9)
                                    .frame(width: 30, height: 30)
                                    .overlay(Text("\(index + 1)").foregroundColor(.white))
                                
                                Text("\(station)")
                                    .font(.system(size: 17))
                                    .padding(.leading, 10)
                                    .foregroundStyle(Color.black)
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.myDEE9F5)
                            .cornerRadius(10)
                            .frame(width: 353, height: 60)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// 두 개의 원을 표시하는 점선 그리기 컴포넌트
struct DottedLine: View {
    var body: some View {
        VStack(spacing: 5) { // 원 사이의 간격을 조정
            Circle()
                .frame(width: 4, height: 4)
            Circle()
                .frame(width: 4, height: 4)
        }
    }
}
