//
//  LocationModel.swift
//  re_lightningDonghae
//
//  Created by 트루디 on 10/5/24.
//
import Foundation
import SwiftUI
import Combine

struct Place: Codable {
    let name: String
    let vicinity: String
    let geometry: Geometry
    let icon: String
    let photos: [Photo]?

    struct Geometry: Codable {
        let location: Location
    }

    struct Location: Codable {
        let lat: Double
        let lng: Double
    }

    struct Photo: Codable {
        let photo_reference: String
        let width: Int
    }
}

class PlacesViewModel: ObservableObject {
    @Published var touristSpots: [TouristSpot] = []
    
    func fetchNearbyPlaces() {
        let apiKey = "AIzaSyDppGeK7XZRzImgjF4olNW7Nmh5HPQ3xRc" // 여기에 API 키를 입력하세요.
        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=35.164071,129.060462&radius=500&keyword=카페&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(PlaceResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.touristSpots = result.results.map { place in
                            let imageURL = place.photos?.first.map { photo in
                                "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photo.photo_reference)&key=\(apiKey)"
                            } ?? place.icon // 포토가 없으면 아이콘 사용
                            
                            return TouristSpot(
                                name: place.name,
                                latitude: place.geometry.location.lat,
                                longitude: place.geometry.location.lng, 
                                category: "부전역",
                                address: place.vicinity,
                                nearestSubway: "부전역", // 이 부분은 추가적인 로직으로 변경 가능
                                description: "설명입니다.", // 여기에 적절한 설명 추가
                                imageURL: imageURL // 생성된 이미지 URL 사용
                            )
                        }
                    }
                } catch {
                    print("Error decoding: \(error)")
                }
            }
        }.resume()
    }
}

struct PlaceResponse: Codable {
    let results: [Place]
}

struct RealCardView: View {
    @StateObject var viewModel = PlacesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.touristSpots) { spot in
                TouristSpotCard(spot: spot) // TouristSpotCard 사용
            }
            .onAppear {
                viewModel.fetchNearbyPlaces()
            }
            .navigationTitle("관광지 목록") // 네비게이션 타이틀 설정
        }
    }
}

//class PlacesViewModel: ObservableObject {
//    @Published var places: [Place] = []
//    let subwayStations = [
//        SubwayStation(name: "부전역", latitude: 35.164668, longitude: 129.06011),
//        SubwayStation(name: "거제해맞이역", latitude: 35.182197, longitude:129.069315),
//        SubwayStation(name: "거제역", latitude: 35.188587, longitude:129.073904),
//        SubwayStation(name: "교대역", latitude: 37.492975, longitude:127.013814),
//        SubwayStation(name: "동래역", latitude: 35.205614, longitude:129.078502),
//        SubwayStation(name: "안락역", latitude: 35.195907, longitude:129.101062),
//        SubwayStation(name: "부산원동역", latitude: 35.362703, longitude:128.920499),
//        SubwayStation(name: "재송역", latitude: 35.189, longitude:129.120919),
//        SubwayStation(name: "센텀역", latitude: 35.168921, longitude:129.131659),
//        SubwayStation(name: "벡스코역", latitude: 35.16899, longitude:129.13868),
//        SubwayStation(name: "신해운대역", latitude: 35.181832, longitude:129.176696),
//        SubwayStation(name: "송정역", latitude: 35.137559, longitude:126.791535),
//        SubwayStation(name: "오시리아역", latitude: 35.196256, longitude:129.208291),
//        SubwayStation(name: "기장역", latitude: 35.243027, longitude:129.218551),
//        SubwayStation(name: "일광역", latitude: 35.265565, longitude:129.233307),
//        SubwayStation(name: "좌천역", latitude: 35.311838, longitude:129.241097),
//        SubwayStation(name: "월내역", latitude: 35.328177, longitude:129.272625),
//        SubwayStation(name: "서생역", latitude: 35.345121, longitude:129.28904),
//        SubwayStation(name: "남창역", latitude: 35.419713, longitude:129.278077),
//        SubwayStation(name: "양양역", latitude: 35.456519, longitude:129.283667),
//        SubwayStation(name: "덕하역", latitude: 35.494007, longitude:129.29894),
//        SubwayStation(name: "개운포역", latitude: 35.507884, longitude:129.31697),
//        SubwayStation(name: "태화강역", latitude: 35.538669, longitude:129.349169),
//        
//        
//        
//        
//        // 추가 동해선 역 추가
//    ]
