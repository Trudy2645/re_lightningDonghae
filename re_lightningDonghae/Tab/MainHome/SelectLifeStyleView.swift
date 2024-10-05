//
//  SelectLifeStyleView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//


import Foundation
import SwiftUI
import Combine

// AIRequest 구조체 정의
struct AIRequest: Codable {
    let prompt: String
}

// AIResponse 구조체 정의
struct AIResponse: Codable {
    let response: String
}

// Place 모델 구조체
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

//

// PlaceResponse 구조체
struct PlaceResponse: Codable {
    let results: [Place]
}

// ViewModel: Google Places API 호출 및 데이터 처리
class PlacesViewModel: ObservableObject {
    @Published var touristSpots: [TouristSpot] = []
    
    // Google Places API 호출 (AI 추천을 받아 검색)
    func fetchNearbyPlaces(for category: String) {
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
        
        let apiKey = "AIzaSyDppGeK7XZRzImgjF4olNW7Nmh5HPQ3xRc" // 여기에 Google Places API 키를 입력
        
        for station in subwayStations {
            let location = "\(station.latitude),\(station.longitude)"
            let radius = 1000 // 검색 반경 1km
            
            let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location)&radius=\(radius)&keyword=\(category)&key=\(apiKey)"
            
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(PlaceResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.touristSpots.append(contentsOf: result.results.map { place in
                                let imageURL = place.photos?.first.map { photo in
                                    "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photo.photo_reference)&key=\(apiKey)"
                                } ?? ""
                                
                                return TouristSpot(
                                    name: place.name,
                                    latitude: place.geometry.location.lat,
                                    longitude: place.geometry.location.lng,
                                    category: category,
                                    address: place.vicinity,
                                    nearestSubway: station.name, // 지하철역 이름 추가
                                    description: "추천된 장소입니다.", // 임시 설명
                                    imageURL: imageURL
                                )
                            })
                        }
                    } catch {
                        print("Error decoding: \(error)")
                    }
                }
            }.resume()
        }
    }
}
// 메인 View
struct SelectLifeStyleView: View {
    @State private var searchText: String = "" // 사용자 입력
    @State private var responseOptions: [String] = [] // AI 응답 목록
    @State private var selectedOption: String? = nil // 선택된 제안
    @State private var isShowingAnswerView = false // 장소 추천 뷰로 이동 여부
    @State private var response: String? = nil // API 응답 저장
    @State private var isButtonHidden = false // 버튼 숨김 상태
    @StateObject var viewModel = PlacesViewModel() // ViewModel 연결
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("오늘은")
                    .font(.title)
                
                HStack(spacing: 0) {
                    Text("어떤 ")
                    Text("하루")
                        .foregroundStyle(Color.blue)
                        .bold()
                    Text("를 보내고 싶나요?")
                }
                .font(.title)

                // 텍스트 입력 필드
                if responseOptions.isEmpty {
                    TextField("예: 우울해", text: $searchText)
                        .padding(.vertical, 10)
                        .font(.body)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.trailing, 50)
                        .padding(.vertical, 10)
                }

                // AI 제안 받기 버튼
                if !isButtonHidden {
                    Button(action: {
                        fetchAIResponseForSuggestions() // 첫 번째 API 호출
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // 키보드 숨기기
                        isButtonHidden = true // 버튼 숨기기
                    }) {
                        Text("AI 제안 받기")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                } else {
                    // 버튼 숨김 상태에서 사용자 입력 표시
                    Text(searchText)
                        .font(.headline)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                }

                // AI 추천 목록 표시
                if !responseOptions.isEmpty {
                    Text("다음 중 선택해보세요:")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    ForEach(responseOptions, id: \.self) { option in
                        Button(action: {
                            selectedOption = option
                            fetchAIResponseForDetails(prompt: option) // 선택된 제안에 대한 두 번째 API 호출
                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .padding(.vertical, 5)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $isShowingAnswerView) {
                if let selectedOption = selectedOption {
                    // 장소 추천 목록 View로 전환
                    AnswerView(category: selectedOption, touristSpots: viewModel.touristSpots)
                }
            }
        }
    }
    
    // 첫 번째 AI API 호출: 제안 받기
    private func fetchAIResponseForSuggestions() {
        guard let url = URL(string: "http://34.22.84.70:8000/api/query/") else { return }
        
        let prompt = "\(searchText) 사용자가 이런 상황이래. 이 상황을 어떤 방식으로 해결하면 좋을지 3가지만 추천해줘. 카페,체험,공원,맛집,스포츠,체육관,디저트,거리,산책,백화점등 사용자의 상황에 맞는 제안 최소 1가지 최대 4가지만 추천하는 질문으로 콤마로 구분해서 말해줘. 관련있는 것만 골라줘.존댓말로 말해줘. 예시답변은 배고플 때라고 말했을때 '근처 맛집에서 맛있는 음식을 먹어보는 건 어떠신가요?'& 디저트 카페에서 달콤한 간식을 즐겨보는 건 어떠신가요?& 백화점 푸드코트에서 다양한 음식을 골라 먹는 것도 좋은 방법입니다!우울할때는 놀이동산에 가는건 어때요? 맛난거 먹는거어때요 이런식으로 창의적으로 해.이거야 &로 정확하게 구분해줘. 5문장정도"
        let request = AIRequest(prompt: prompt)
        
        guard let jsonData = try? JSONEncoder().encode(request) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
                DispatchQueue.main.async {
                    // AI 응답을 콤마로 구분해 배열로 변환
                    self.responseOptions = aiResponse.response.split(separator: "&").map { $0.trimmingCharacters(in: .whitespaces) }
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    // 두 번째 AI API 호출: 선택된 제안에 맞는 장소 추천받기
    private func fetchAIResponseForDetails(prompt: String) {
        print(prompt)
        guard let url = URL(string: "http://34.22.84.70:8000/api/query/") else { return }
        
        let request = AIRequest(prompt: "다음 제안에 맞는 장소를 추천해줘: \(prompt)지금 이런 상황인데. 구글에 특정한 단어로 검색할거야. 어떤 단어가 좋을지 하나만 말해. 단답으로 답해")
              
        guard let jsonData = try? JSONEncoder().encode(request) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
                DispatchQueue.main.async {
                    if let category = aiResponse.response.components(separatedBy: ",").first {
                        viewModel.fetchNearbyPlaces(for: category) // AI 추천 카테고리로 장소 검색
                    }
                    self.isShowingAnswerView = true
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}

// 장소 추천 결과를 보여주는 AnswerView

struct AnswerView: View {
    let category: String // 사용자가 선택한 카테고리
    let touristSpots: [TouristSpot] // 추천된 관광지 목록
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // ForEach를 사용하여 관광지 목록을 반복 출력
                ForEach(touristSpots, id: \.id) { spot in
                    TouristSpotCard(spot: spot)
                        .padding(.horizontal) // 카드 간 간격을 위해 padding 추가
                }
            }
        }
        .navigationTitle("추천 장소")
        .padding(.vertical, 10)
    }
}
