import SwiftUI
import CoreLocation

// 관광지 정보를 담을 구조체
struct TourlistSpot: Identifiable {
    let id: UUID = UUID()  // 각 관광지 정보의 고유 ID
    let name: String
    let latitude: Double
    let longitude: Double
    let address: String
    let nearestSubway: String
    let description: String
    let imageURL: String  // 사진 URL 추가
//    let category: String
}
struct TourlistView: View {
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
       var filteredTouristSpots: [TourlistSpot] {
           if searchText.isEmpty {
               return touristSpots
           } else {
               return touristSpots.filter { spot in
                   spot.name.contains(searchText) || spot.address.contains(searchText)
               }
           }
       }
}

struct TouristSpotCard: View {
    let spot: TourlistSpot
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {  // 전체 카드 구조
            HStack(spacing: 10) {  // 사진과 텍스트를 나란히 배치
                // 비동기적으로 이미지를 로드하고 표시
                AsyncImage(url: URL(string: spot.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)  // 이미지 크기 설정
                        .cornerRadius(10)
                } placeholder: {
                    // 로딩 중일 때 또는 오류가 있을 때의 플레이스홀더
                    ProgressView()
                        .frame(width: 90, height: 90)  // 이미지 공간 예약
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(spot.nearestSubway)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    HStack{
                        Text(spot.name)
                            .font(.headline)
                            .fontWeight(.bold)
//                        Text()
                    }
                    Text(spot.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
            }
            
            HStack {
                Spacer()
                // 경로 찾기 버튼
                Button(action: {
                    // 경로 찾기 액션 추가
                    print("경로 찾기 버튼 클릭됨")
                }) {
                    ZStack{
                        // 다이아몬드 모양의 배경 (모서리에 radius 적용)
                        RoundedRectangle(cornerRadius: 8) // 원하는 반경을 설정하세요.
                            .fill(Color.blue) // 배경 색상
                            .frame(width: 30, height: 30) // 크기 설정
                            .rotationEffect(Angle(degrees: 45)) // 45도 회전시켜 다이아몬드 모양 만들기
                        
                        // 화살표 아이콘
                        Image(systemName: "arrow.turn.up.right")
                            .foregroundColor(.white) // 화살표 색상
                            .font(.system(size: 14)) // 크기 설정
                            .bold()
                    }
                }
                .padding(.horizontal)  // 버튼의 양쪽 여백
                .padding(.bottom, 10)
            }
           
          
        }
//        .background(Color.white)
//        .cornerRadius(10)

        .padding()
    }
}


#Preview {
    TourlistView()
}
