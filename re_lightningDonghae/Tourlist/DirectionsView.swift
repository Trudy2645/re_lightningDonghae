import SwiftUI
import CoreLocation

struct DirectionsResponse: Codable {
    let routes: [Route]
}

struct Route: Codable, Hashable {
    let legs: [Leg]
}

struct Leg: Codable, Identifiable, Hashable {
    let id = UUID()
    let distance: TextValue
    let duration: TextValue
    let steps: [Step]
}

struct TextValue: Codable, Hashable {
    let text: String
}

struct Step: Codable, Hashable {
    let instructions: String

    enum CodingKeys: String, CodingKey {
        case instructions = "html_instructions"
    }
}

struct Directions1View: View {
    let spot: TouristSpot
    @State private var currentLocation: CLLocationCoordinate2D?
    @State private var closestStation: SubwayStation?
    @State private var directionsToStation: DirectionsResponse?
    @State private var directionsToSpot: DirectionsResponse?
    @State private var loading = false

    var body: some View {
        VStack {
            VStack {
                // 출발지와 도착지 텍스트필드
                Text("출발지: 내 위치")
                    .frame(width: 300, height: 15, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("도착지: \(spot.name)")
                    .frame(width: 300, height: 15, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            if loading {
                ProgressView("경로를 가져오는 중...")
            } else {
                // 1. 현재 위치에서 가장 가까운 동해선 역까지의 경로 표시
                if let directionsToStation = directionsToStation, let closestStation = closestStation {
                    List(directionsToStation.routes.first?.legs ?? [], id: \.id) { leg in
                        VStack(alignment: .leading) {
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.red)
                                Text("출발지: 내 위치")
                                Text("(소요 시간: \(leg.duration.text))")
                                    .fontWeight(.bold)
                            }
                            ForEach(leg.steps, id: \.instructions) { step in
                                Text(step.instructions)
                                    .padding(.vertical, 2)
                            }
                            // 구글 지도에서 경로 보기 버튼
                            Button(action: {
                                openGoogleMapsForStation()
                            }) {
                                Text("구글 지도에서 보기")
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    
                    HStack {
                        Image(systemName: "tram.fill")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text("\(closestStation.name)승차")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("\(spot.nearestSubway)하차")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .background()
                    .padding(.horizontal)
                }
                
                
                // 2. TouristSpot의 nearestSubway에서 TouristSpot까지의 경로 표시
                if let directionsToSpot = directionsToSpot {
                    List(directionsToSpot.routes.first?.legs ?? [], id: \.id) { leg in
                        VStack(alignment: .leading) {
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.red)
                                Text("출발지: \(spot.nearestSubway)")
                                Text("(소요 시간: \(leg.duration.text))")
                                    .fontWeight(.bold)
                            }
                            ForEach(leg.steps, id: \.instructions) { step in
                                Text(step.instructions)
                                    .padding(.vertical, 2)
                            }
                            // 구글 지도에서 경로 보기 버튼
                            Button(action: {
                                openGoogleMapsForSpot()
                            }) {
                                Text("구글 지도에서 보기")
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchCurrentLocation()
        }
    }

    private func fetchCurrentLocation() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let location = locationManager.location?.coordinate {
            self.currentLocation = location
            findClosestStation()
        }
    }

    private func findClosestStation() {
        // 동해선 역 정보를 배열로 선언 (예시)
        let subwayStations = [
            SubwayStation(name: "부전역 동해선", latitude: 35.164668, longitude: 129.06011),
            SubwayStation(name: "거제해맞이역 동해선", latitude: 35.182197, longitude:129.069315),
            SubwayStation(name: "거제역 동해선", latitude: 35.188587, longitude:129.073904),
            SubwayStation(name: "부산 교대역 동해선", latitude: 37.492975, longitude:127.013814),
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
            
            
            
            
            // 추가 동해선 역 추가
        ]

        // 현재 위치에서 가장 가까운 역 찾기
        if let currentLocation = currentLocation {
            closestStation = subwayStations.min(by: {
                distance(from: currentLocation, to: $0) < distance(from: currentLocation, to: $1)
            })

            if let station = closestStation {
                fetchDirections(from: station, to: spot)
            }
        }
    }

    private func distance(from: CLLocationCoordinate2D, to: SubwayStation) -> Double {
        let stationLocation = CLLocation(latitude: to.latitude, longitude: to.longitude)
        let currentLocation = CLLocation(latitude: from.latitude, longitude: from.longitude)
        return currentLocation.distance(from: stationLocation)
    }

    // API로 현재 위치 -> 가장 가까운 동해선 역 경로 불러오기
    private func fetchDirections(from station: SubwayStation, to spot: TouristSpot) {
        let origin = "\(currentLocation?.latitude ?? 0),\(currentLocation?.longitude ?? 0)"
        let stationDestination = "\(station.latitude),\(station.longitude)"
        let spotDestination = "\(spot.latitude),\(spot.longitude)"
        let apiKey = "api키" // Google API 키 입력

        loading = true
        
        // 현재 위치 -> 가까운 역
        let urlStringToStation = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(stationDestination)&mode=transit&key=\(apiKey)"
        fetchDirection(from: urlStringToStation) { response in
            self.directionsToStation = response
            self.loading = false
        }

        // TouristSpot의 nearestSubway -> TouristSpot
        let urlStringToSpot = "https://maps.googleapis.com/maps/api/directions/json?origin=\(spot.nearestSubway)&destination=\(spotDestination)&mode=transit&key=\(apiKey)"
        fetchDirection(from: urlStringToSpot) { response in
            self.directionsToSpot = response
        }
    }

    private func fetchDirection(from urlString: String, completion: @escaping (DirectionsResponse?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let directionsResponse = try JSONDecoder().decode(DirectionsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(directionsResponse)
                }
            } catch {
                print("Error decoding directions: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }

    private func openGoogleMapsForStation() {
        guard let currentLocation = currentLocation, let station = closestStation else { return }
        let origin = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let destination = "\(station.latitude),\(station.longitude)"
        let urlString = "https://www.google.com/maps/dir/?api=1&origin=\(origin)&destination=\(destination)&travelmode=transit"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }

    private func openGoogleMapsForSpot() {
        let origin = "\(spot.nearestSubway)"
        let destination = "\(spot.latitude),\(spot.longitude)"
        let urlString = "https://www.google.com/maps/dir/?api=1&origin=\(origin)&destination=\(destination)&travelmode=transit"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

struct SubwayStation {
    let name: String
    let latitude: Double
    let longitude: Double
}

