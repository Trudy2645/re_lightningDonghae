import SwiftUI
import CoreLocation

// Haversine formula to calculate distance between two coordinates
func haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let R = 6371000.0 // Radius of Earth in meters
    let dLat = (lat2 - lat1) * .pi / 180
    let dLon = (lon2 - lon1) * .pi / 180
    let a = sin(dLat / 2) * sin(dLat / 2) +
    cos(lat1 * .pi / 180) * cos(lat2 * .pi / 180) *
    sin(dLon / 2) * sin(dLon / 2)
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c // Distance in meters
}

// ViewModel to manage location and proximity checks
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation?
    @Published var isNearbyTouristSpot: Bool = false
    @Published var nearbySpot: TouristSpot?
    
    @Published var nearbySpots: Set<String> = [] // Set<UUID> 대신 Set<String>으로 변경
    @Published var visitedSpots: Set<String> = UserDefaults.standard.visitedSpots {  // UserDefaults에서 불러오기
        didSet {
            saveVisitedSpots()  // 저장된 장소가 변경되면 UserDefaults에 저장
        }
    }
    
    private let locationManager = CLLocationManager()
    private let proximityThreshold: Double = 1000 // meters
    
    override init() {
        super.init()
        loadVisitedSpots()  // 앱 시작 시 방문한 장소 불러오기
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // Save visited spots to UserDefaults
    func saveVisitedSpots() {
        let encodedData = try? JSONEncoder().encode(visitedSpots)
        UserDefaults.standard.set(encodedData, forKey: "visitedSpots")
    }
    
    // Load visited spots from UserDefaults
    func loadVisitedSpots() {
        visitedSpots = UserDefaults.standard.visitedSpots // 이름으로 불러오기
    }

    // CLLocationManagerDelegate method to update user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocation = location
    }
    
    // Check if user is within proximity of any tourist spots
    func checkProximity(stampCompleted: Bool) {
        guard let userLocation = userLocation else { return }
        
        for spot in touristSpots {
            if visitedSpots.contains(spot.name) { // ID 대신 name으로 비교
                nearbySpots.insert(spot.name)  // Spot already visited
                continue
            }
            
            guard !stampCompleted else { return }  // Skip proximity check if the stamp is already completed
            
            let distance = haversine(
                lat1: userLocation.coordinate.latitude,
                lon1: userLocation.coordinate.longitude,
                lat2: spot.latitude,
                lon2: spot.longitude
            )
            
            if distance <= proximityThreshold {
                self.isNearbyTouristSpot = true
                self.nearbySpot = spot
                return
            }
        }
        
        self.isNearbyTouristSpot = false
        self.nearbySpot = nil
    }
}

// Main View
struct StampView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var stampCompleted: Bool = false
    @State private var showStampView: Bool = false // 추가된 상태 변수

    var body: some View {
        ZStack {
            VStack {
                if let spot = locationManager.nearbySpot, !locationManager.visitedSpots.contains(spot.name) {
                    if locationManager.isNearbyTouristSpot, let spot = locationManager.nearbySpot {
                        // Stamp status will determine whether to show the stamp view
                        if showStampView {
                            whatever() // 언제나 whatever()를 보여줌
                        }
                    }
                } else if let spot = locationManager.nearbySpot, locationManager.visitedSpots.contains(spot.name) {
                    TouristSpotCard(spot: spot)
                }
                Spacer()
            }
        }
        .onAppear {
            // Load visited spots when the view appears
            locationManager.loadVisitedSpots()
            
            // Debugging: Print loaded visited spots
            print("Loaded visited spots: \(locationManager.visitedSpots)")
            
            // Check proximity and update the stamp status
            locationManager.checkProximity(stampCompleted: stampCompleted)
        }
        
        .onChange(of: stampCompleted) { old, newone in
            if newone, let spot = locationManager.nearbySpot {
                // 스탬프가 찍힌 장소의 이름을 방문한 장소로 추가
                locationManager.visitedSpots.insert(spot.name)
                locationManager.saveVisitedSpots() // UserDefaults에 저장
                
                // 디버깅 출력
                print("Visited spots after stamping: \(locationManager.visitedSpots)")
            }
        }
    }
}

// Preview
struct dPreviews: PreviewProvider {
    static var previews: some View {
        StampView()
    }
}

extension StampView {
    @ViewBuilder
    func whatever() -> some View {
        if locationManager.isNearbyTouristSpot, let spot = locationManager.nearbySpot {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Text("스탬프 발견!")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 22))
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    AsyncImage(url: URL(string: spot.imageURL))  // 옵셔널 체이닝이 필요하지 않음
                        .frame(width: 350, height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    HStack {
                        Text(spot.nearestSubway)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                    }.padding(.leading)
                    
                    Text(spot.name)
                        .font(.system(size: 22))
                        .foregroundStyle(Color.black)
                        .bold()
                        .padding()
                    
                    Text(spot.address)
                        .foregroundStyle(Color.black)
                        .padding()
                    
                    Button(action: {
                        if stampCompleted {
                            // 닫기 버튼을 눌렀을 때
                            showStampView = false // 스탬프 뷰 숨기기
                            locationManager.isNearbyTouristSpot = false
                        } else {
                            // 스탬프 찍기 버튼을 눌렀을 때
                            stampCompleted = true
                            showStampView = true // 스탬프 뷰 보이기
                        }
                    }) {
                        Text(stampCompleted ? "닫기" : "스탬프 찍기")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding()
            }
            .transition(.move(edge: .bottom))
        }
    }
}
