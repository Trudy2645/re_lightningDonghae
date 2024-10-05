//
//  AIRequest.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/6/24.
//


//import Foundation
//import SwiftUI
//import Combine
//
//// AIRequest 구조체 정의
//struct AIRequest: Codable {
//    let prompt: String
//}
//
//// AIResponse 구조체 정의
//struct AIResponse: Codable {
//    let response: String
//}
//
//// Place 모델 구조체
//struct Place: Codable {
//    let name: String
//    let vicinity: String
//    let geometry: Geometry
//    let icon: String
//    let photos: [Photo]?
//
//    struct Geometry: Codable {
//        let location: Location
//    }
//
//    struct Location: Codable {
//        let lat: Double
//        let lng: Double
//    }
//
//    struct Photo: Codable {
//        let photo_reference: String
//        let width: Int
//    }
//}
//
//// TouristSpot 모델 정의
//struct TouristSpot: Identifiable, Hashable {
//    let id = UUID()
//    let name: String
//    let latitude: Double
//    let longitude: Double
//    let category: String
//    let address: String
//    let nearestSubway: String
//    let description: String
//    let imageURL: String
//
//    static func == (lhs: TouristSpot, rhs: TouristSpot) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}
//
//// ViewModel: Google Places API 호출 및 데이터 처리
//class PlacesViewModel: ObservableObject {
//    @Published var touristSpots: [TouristSpot] = []
//
//    // Google Places API 호출 (AI 추천을 받아 검색)
//    func fetchNearbyPlaces(for category: String) {
//        let apiKey = "YOUR_GOOGLE_API_KEY" // 여기에 Google Places API 키를 입력
//        let location = "35.164071,129.060462" // 예시 위치 (부산 좌표)
//        let radius = 5000 // 검색 반경 (단위: 미터)
//
//        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location)&radius=\(radius)&keyword=\(category)&key=\(apiKey)"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let result = try decoder.decode(PlaceResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.touristSpots = result.results.map { place in
//                            let imageURL = place.photos?.first.map { photo in
//                                "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photo.photo_reference)&key=\(apiKey)"
//                            } ?? place.icon
//
//                            return TouristSpot(
//                                name: place.name,
//                                latitude: place.geometry.location.lat,
//                                longitude: place.geometry.location.lng,
//                                category: category,
//                                address: place.vicinity,
//                                nearestSubway: "부전역", // 임시 데이터
//                                description: "추천된 장소입니다.", // 임시 설명
//                                imageURL: imageURL
//                            )
//                        }
//                    }
//                } catch {
//                    print("Error decoding: \(error)")
//                }
//            }
//        }.resume()
//    }
//}
//
//// PlaceResponse 구조체
//struct PlaceResponse: Codable {
//    let results: [Place]
//}
//
//// 메인 View
//struct SelectLifeStyleView: View {
//    @State private var searchText: String = "" // 사용자 입력
//    @State private var responseOptions: [String] = [] // AI 응답 목록
//    @State private var selectedOption: String? = nil // 선택된 제안
//    @State private var isShowingAnswerView = false // 장소 추천 뷰로 이동 여부
//    @State private var response: String? = nil // API 응답 저장
//    @State private var isButtonHidden = false // 버튼 숨김 상태
//    @StateObject var viewModel = PlacesViewModel() // ViewModel 연결
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                Text("오늘은")
//                    .font(.title)
//
//                HStack(spacing: 0) {
//                    Text("어떤 ")
//                    Text("하루")
//                        .foregroundStyle(Color.blue)
//                        .bold()
//                    Text("를 보내고 싶나요?")
//                }
//                .font(.title)
//
//                // 텍스트 입력 필드
//                if responseOptions.isEmpty {
//                    TextField("예: 우울해", text: $searchText)
//                        .padding(.vertical, 10)
//                        .font(.body)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                        .padding(.trailing, 50)
//                        .padding(.vertical, 10)
//                }
//
//                // AI 제안 받기 버튼
//                if !isButtonHidden {
//                    Button(action: {
//                        fetchAIResponseForSuggestions() // 첫 번째 API 호출
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // 키보드 숨기기
//                        isButtonHidden = true // 버튼 숨기기
//                    }) {
//                        Text("AI 제안 받기")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                } else {
//                    // 버튼 숨김 상태에서 사용자 입력 표시
//                    Text(searchText)
//                        .font(.headline)
//                        .padding()
//                        .background(Color.blue.opacity(0.1))
//                        .cornerRadius(10)
//                        .padding(.vertical, 5)
//                }
//
//                // AI 추천 목록 표시
//                if !responseOptions.isEmpty {
//                    Text("다음 중 선택해보세요:")
//                        .font(.headline)
//                        .padding(.top, 20)
//
//                    ForEach(responseOptions, id: \.self) { option in
//                        Button(action: {
//                            selectedOption = option
//                            fetchAIResponseForDetails(prompt: option) // 선택된 제안에 대한 두 번째 API 호출
//                        }) {
//                            Text(option)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(Color.blue.opacity(0.1))
//                                .cornerRadius(10)
//                                .padding(.vertical, 5)
//                        }
//                    }
//                }
//
//                Spacer()
//            }
//            .padding()
//            .navigationDestination(isPresented: $isShowingAnswerView) {
//                if let selectedOption = selectedOption {
//                    // 장소 추천 목록 View로 전환
//                    AnswerView(category: selectedOption, touristSpots: viewModel.touristSpots)
//                }
//            }
//        }
//    }
//
//    // 첫 번째 AI API 호출: 제안 받기
//    private func fetchAIResponseForSuggestions() {
//        guard let url = URL(string: "http://34.22.84.70:8000/api/query/") else { return }
//
//        let prompt = "\(searchText) 사용자가 이런 상황이래. 이 상황을 어떤 방식으로 해결하면 좋을지 3가지만 추천해줘. 카페,체험,공원,맛집,스포츠,체육관,디저트,거리,산책,백화점등 사용자의 상황에 맞는 제안 최소 1가지 최대 4가지만 추천하는 질문으로 콤마로 구분해서 말해줘. 관련있는 것만 골라줘. 존댓말로 말해줘."
//        let request = AIRequest(prompt: prompt)
//
//        guard let jsonData = try? JSONEncoder().encode(request) else { return }
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            do {
//                let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
//                DispatchQueue.main.async {
//                    // AI 응답을 콤마로 구분해 배열로 변환
//                    self.responseOptions = aiResponse.response.split(separator: "&").map { $0.trimmingCharacters(in: .whitespaces) }
//                }
//            } catch {
//                print("Decoding error: \(error)")
//            }
//        }.resume()
//    }
//
//    // 두 번째 AI API 호출: 선택된 제안에 맞는 장소 추천받기
//    private func fetchAIResponseForDetails(prompt: String) {
//        guard let url = URL(string: "http://34.22.84.70:8000/api/query/") else { return }
//
//        let request = AIRequest(prompt: "다음 제안에 맞는 장소를 추천해줘: \(prompt) 쇼핑, 체험, 스포츠, 바다, 온천, 액티비티, 힐링, 맛집, 카페, 키즈카페,경치,전시,사진, 영화,체육관 중에서 추천해줘.")
//
//        guard let jsonData = try? JSONEncoder().encode(request) else { return }
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            do {
//                let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
//                DispatchQueue.main.async {
//                    // AI 응답을 사용하여 장소 검색
//                    self.isShowingAnswerView = true
//                    self.viewModel.fetchNearbyPlaces(for: aiResponse.response) // 장소 검색 요청
//                }
//            } catch {
//                print("Decoding error: \(error)")
//            }
//        }.resume()
//    }
//}
//
//// 추천 장소 목록을 보여주는 View
//struct AnswerView: View {
//    let category: String
//    let touristSpots: [TouristSpot]
//
//    var body: some View {
//        List(touristSpots) { spot in
//            VStack(alignment: .leading) {
//                Text(spot.name)
//                    .font(.headline)
//                Text(spot.address)
//                    .font(.subheadline)
//                // 장소 이미지
//                AsyncImage(url: URL(string: spot.imageURL)) { image in
//                    image.resizable()
//                         .scaledToFit()
//                         .frame(height: 200)
//                         .cornerRadius(8)
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("\(category) 추천 장소")
//    }
//}
