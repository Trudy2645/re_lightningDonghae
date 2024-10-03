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
    @Published var nearbySpot: TourlistSpot?
    
    @Published var visitedSpots: Set<UUID> = [] // 관리할 방문한 장소 목록
    
    private let locationManager = CLLocationManager()
    private let proximityThreshold: Double = 10 // 10 meters
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // CLLocationManagerDelegate method to update user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocation = location
        checkProximity()
    }
    
    // Check if user is within proximity of any tourist spots
    private func checkProximity() {
        guard let userLocation = userLocation else { return }
        
        for spot in touristSpots {
            if visitedSpots.contains(spot.id) {
                continue
            }
            
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
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
            }
            
            // Show a modal when user is near a tourist spot
            if locationManager.isNearbyTouristSpot, let spot = locationManager.nearbySpot {
                if stampCompleted {
                    ZStack{
                        whatever()
                        Image("Stamp")
                            .resizable()
                            .frame(width: 260, height: 260)
                            .padding(.top, -150)
                    }
                } else { whatever() }
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
                VStack(alignment: .leading) {
                    HStack{
                        Spacer()
                        Text("스탬프 발견!")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 22))
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    AsyncImage(url: URL(string: spot.imageURL))
                        .frame(width: 350, height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    HStack{
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
                            locationManager.isNearbyTouristSpot = false
                            if let spot = locationManager.nearbySpot {
                                locationManager.visitedSpots.insert(spot.id) // 방문한 장소 추가
                            }
                        } else {
                            // 스탬프 찍기 버튼을 눌렀을 때
                            stampCompleted = true
                        }
                    }) {
                        Text(stampCompleted ? "닫기" :"스탬프 찍기")
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
