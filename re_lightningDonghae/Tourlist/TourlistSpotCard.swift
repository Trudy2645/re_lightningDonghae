
import SwiftUI
import CoreLocation

//// 관광지 정보를 담을 구조체
//struct TouristSpot: Identifiable {
//    let id: UUID = UUID()  // 각 관광지 정보의 고유 ID
//    let name: String
//    let latitude: Double
//    let longitude: Double
//    let address: String
//    let nearestSubway: String
//    let description: String
//    let imageURL: String  // 사진 URL 추가
//}

struct TouristSpotCard: View {
    let spot: TouristSpot
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
