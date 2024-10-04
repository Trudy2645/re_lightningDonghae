//
//  Corelocation.swift
//  re_lightningDonghae
//
//  Created by 문재윤 on 10/4/24.
//

import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var isWithinProximity: Bool = false

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        self.location = newLocation
        checkProximity()
    }

    func checkProximity() {
        // 관광지와의 거리를 체크하여 1km 이내일 경우 true로 설정
        for spot in touristSpots {
            let spotLocation = CLLocation(latitude: spot.latitude, longitude: spot.longitude)
            if let userLocation = location {
                let distance = userLocation.distance(from: spotLocation)
                if distance < 1000 { // 1km 이내
                    isWithinProximity = true
                    break
                }
            }
        }
    }
}
