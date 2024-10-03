import SwiftUI
import CoreLocation

struct Directions1View: View {
    let spot: TourlistSpot
    @State private var directions: DirectionsResponse?
    @State private var apiKey = "AIzaSyDppGeK7XZRzImgjF4olNW7Nmh5HPQ3xRc" // 구글 API 키를 여기에 입력하세요
    @State private var currentLocation: CLLocationCoordinate2D?
    @State private var loading = false

    var body: some View {
        VStack {
            if loading {
                ProgressView("경로를 가져오는 중...")
            } else if let directions = directions {
                List(directions.routes.first?.legs ?? []) { leg in
                    VStack(alignment: .leading) {
                        Text("소요 시간: \(leg.duration.text)")
                            .fontWeight(.bold)
                        ForEach(leg.steps, id: \.instructions) { step in
                            Text(step.instructions)
                                .padding(.vertical, 2)
                        }
                    }
                }
                // 지도에서 보기 버튼 추가
                              Button(action: {
                                  openGoogleMaps()
                              }) {
                                  Text("지도에서 보기")
                                      .font(.headline)
                                      .foregroundColor(.white)
                                      .padding()
                                      .background(Color.blue)
                                      .cornerRadius(10)
                              }
                              .padding(.top)
                
            } else {
                Text("경로를 찾을 수 없습니다.")
            }
        }
        .onAppear {
            fetchCurrentLocation()
        }
    }

    private func fetchCurrentLocation() {
        // CLLocationManager를 사용하여 현재 위치를 가져오는 코드
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let location = locationManager.location?.coordinate {
            self.currentLocation = location
            fetchDirections()
        }
    }

    private func fetchDirections() {
        guard let currentLocation = currentLocation else { return }

        let origin = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let destination = "\(spot.latitude),\(spot.longitude)"
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=transit&key=\(apiKey)"

        guard let url = URL(string: urlString) else { return }
        
        loading = true

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            loading = false
            
            if let error = error {
                print("Error fetching directions: \(error)")
                return
            }

            guard let data = data else { return }
            
            do {
                let directionsResponse = try JSONDecoder().decode(DirectionsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.directions = directionsResponse
                }
            } catch {
                print("Error decoding directions: \(error)")
            }
        }
        task.resume()
    }
    
    private func openGoogleMaps() {
          guard let currentLocation = currentLocation else { return }
          
          // Google Maps URL 생성
          let origin = "\(currentLocation.latitude),\(currentLocation.longitude)"
          let destination = "\(spot.latitude),\(spot.longitude)"
          let urlString = "https://www.google.com/maps/dir/?api=1&origin=\(origin)&destination=\(destination)&travelmode=transit"
          
          // Safari에서 열기
          if let url = URL(string: urlString) {
              UIApplication.shared.open(url)
          }
      }
  
}

struct DirectionsResponse: Codable {
    let routes: [Route]
}

struct Route: Codable {
    let legs: [Leg]
}

struct Leg: Codable, Identifiable { // Identifiable 프로토콜을 준수
    let id = UUID() // 각 Leg에 대한 고유 ID
    let distance: TextValue
    let duration: TextValue
    let steps: [Step]
}

struct TextValue: Codable {
    let text: String
}

struct Step: Codable {
    let instructions: String
    
    enum CodingKeys: String, CodingKey {
        case instructions = "html_instructions"
    }
}

