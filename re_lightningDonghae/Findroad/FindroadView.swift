//
//  FindroadView.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/3/24.
//
import SwiftUI
import MapKit

// CLLocationCoordinate2D를 감싸는 Identifiable 구조체 정의
struct Location: Identifiable, Equatable {
    let id = UUID() // 고유 식별자
    let coordinate: CLLocationCoordinate2D

    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}

// 출발지 및 도착지를 선택하는 첫 번째 뷰
struct SelectLocationsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // 샌프란시스코 예시
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var origin: Location? = nil
    @State private var destination: Location? = nil
    @State private var showDirectionsView = false

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [origin, destination].compactMap { $0 }) { location in
                MapPin(coordinate: location.coordinate, tint: location == origin ? .green : .red)
            }
            .onTapGesture(coordinateSpace: .global) { location in
                if origin == nil {
                    origin = Location(coordinate: region.center)
                } else if destination == nil {
                    destination = Location(coordinate: region.center)
                }
            }
            .frame(height: 300)
            .padding()

            if origin == nil {
                Text("출발지를 선택하세요.")
                    .padding()
            } else if destination == nil {
                Text("도착지를 선택하세요.")
                    .padding()
            } else {
                Button("경로 보기") {
                    showDirectionsView = true
                }
                .padding()
                .sheet(isPresented: $showDirectionsView) {
                    DirectionsView(origin: origin!, destination: destination!)
                }
            }
        }
    }
}

// 경로를 보여주는 두 번째 뷰
struct DirectionsView: View {
    let origin: Location
    let destination: Location
    @State private var directions: [String] = []
    @State private var showAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            if directions.isEmpty {
                Text("경로를 불러오는 중...")
                    .padding()
            } else {
                List(directions, id: \.self) {
                    Text($0)
                }
            }
        }
        .onAppear {
            getDirections(from: "\(origin.coordinate.latitude),\(origin.coordinate.longitude)", to: "\(destination.coordinate.latitude),\(destination.coordinate.longitude)")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Google Maps Directions API 호출
    func getDirections(from origin: String, to destination: String) {
        let apiKey = "api키"  // 여기에 Google Maps API 키를 입력하세요.
        let urlStr = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=transit&key=\(apiKey)"
        
        guard let url = URL(string: urlStr) else {
            self.errorMessage = "Invalid URL"
            self.showAlert = true
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.errorMessage = "Error: \(error.localizedDescription)"
                self.showAlert = true
                return
            }
            
            guard let data = data else {
                self.errorMessage = "No data received"
                self.showAlert = true
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let routes = json?["routes"] as? [[String: Any]] {
                    if let legs = routes.first?["legs"] as? [[String: Any]] {
                        if let steps = legs.first?["steps"] as? [[String: Any]] {
                            DispatchQueue.main.async {
                                self.directions = steps.compactMap { step in
                                    return (step["html_instructions"] as? String)?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                                }
                            }
                        }
                    }
                }
            } catch {
                self.errorMessage = "Failed to parse JSON"
                self.showAlert = true
            }
        }.resume()
    }
}

#Preview {
    SelectLocationsView()
}
