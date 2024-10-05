import SwiftUI
import CoreLocation

// 관광지 정보를 담을 구조체
struct TouristSpot: Identifiable {
    let id: UUID = UUID()  // 각 관광지 정보의 고유 ID
    let name: String
    let latitude: Double
    let longitude: Double
    let category: String
    let address: String
    let nearestSubway: String
    let description: String
    var imageURL: String  // 사진 URL 추가
    //    let category: String
    // 주소에서 두 번째 공백 이전까지만 가져오는 계산 프로퍼티
        var truncatedAddress: String {
            let components = address.split(separator: " ") // 공백을 기준으로 나누기
            if components.count > 2 {
                return components[0...1].joined(separator: " ") // 첫 두 단어만 합치기
            } else {
                return address // 공백이 2개 미만일 때는 전체 주소 반환
            }
        }
}
struct TouristView: View {
    @State private var searchText = ""  // 검색어 저장하는 상태 변수
    
    var body: some View {
        NavigationView {
            List(filteredTouristSpots) { spot in
                TouristSpotCard(spot: spot)  // 각 관광지 정보를 카드 형식으로 표현
            }
            .searchable(text: $searchText, prompt: "관광지를 검색하세요")  // 서치바 추가
            .navigationTitle("검색결과")
        }
    }
    
    // 검색어를 기준으로 필터링된 관광지 리스트 반환
    var filteredTouristSpots: [TouristSpot] {
        if searchText.isEmpty {
            return touristSpots
        } else {
            return touristSpots.filter { spot in
                spot.name.contains(searchText) || spot.address.contains(searchText)
            }
        }
    }
}




#Preview {
    TouristView()
}
