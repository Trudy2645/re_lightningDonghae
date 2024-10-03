
import SwiftUI
import CoreLocation

// 관광지 정보를 담을 구조체
struct TouristSpot: Identifiable {
    let id: UUID = UUID()  // 각 관광지 정보의 고유 ID
    let name: String
    let latitude: Double
    let longitude: Double
    let address: String
    let nearestSubway: String
    let description: String
    let imageURL: String  // 사진 URL 추가
}

// 샘플 관광지 데이터를 배열로 생성
let touristSpotsi = [
    TouristSpot(name: "경복궁", latitude: 37.579617, longitude: 126.977041, address: "서울특별시 종로구 세종로 1-1", nearestSubway: "경복궁역", description: "조선시대의 궁궐로서 역사적 가치가 높은 유적지입니다.", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJsPLZoRZuH-0NDKlI_esDNY7LmwSCElb6pQ&s"),
    TouristSpot(name: "남산서울타워", latitude: 37.551169, longitude: 126.988226, address: "서울특별시 용산구 남산공원길 105", nearestSubway: "명동역", description: "서울을 대표하는 랜드마크로 서울 시내 전경을 한눈에 볼 수 있습니다.", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Seoul_Tower_%284394893276%29.jpg/550px-Seoul_Tower_%284394893276%29.jpg"),
    TouristSpot(name: "롯데월드", latitude: 37.511034, longitude: 127.098034, address: "서울특별시 송파구 올림픽로 240", nearestSubway: "잠실역", description: "세계 최대의 실내 놀이공원으로 다양한 즐길거리를 제공합니다.", imageURL: "https://upload.wikimedia.org/wikipedia/commons/3/3e/Khitai7.jpg")
]

struct TouristSpotCard: View {
    let spot: TourlistSpot
    @StateObject private var locationManager = LocationManager() // 현재 위치 관리

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: spot.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 90, height: 90)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(spot.nearestSubway)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)

                    Text(spot.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(spot.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            HStack {
                VStack(alignment: .leading) {
                    Text("댓글 예시")
                        .foregroundStyle(.black)
                        .font(.system(size: 13))
                        .padding(.bottom, 1)
                    Text("댓글 모두 보기")
                        .foregroundStyle(.black.opacity(0.5))
                        .font(.system(size: 15))
                }
                Spacer()
                // 경로 찾기 버튼
                NavigationLink(destination: Directions1View(spot: spot)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                            .rotationEffect(Angle(degrees: 45))
                        
                        Image(systemName: "arrow.turn.up.right")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .bold()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
        }
        .padding()
    }
}
