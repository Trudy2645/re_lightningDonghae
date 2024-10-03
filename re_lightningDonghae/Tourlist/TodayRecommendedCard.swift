import SwiftUI
struct TodayRecommendedCard: View {
    let spot: TourlistSpot  // 무작위로 선택된 관광지
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.clear)
                .background(.white)
                .frame(width: 370, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.87, green: 0.91, blue: 0.96), lineWidth: 1)
                )
            
            HStack {
                AsyncImage(url: URL(string: spot.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
                
                VStack(alignment: .leading) {
                    HStack{
                        Text(spot.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(spot.nearestSubway)
                    }
                    Text(spot.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading, 5)
            }
            Button(action: {
                // 경로 찾기 액션 추가
                print("경로 찾기 버튼 클릭됨")
            }) {
                ZStack{
                    // 다이아몬드 모양의 배경 (모서리에 radius 적용)
                    RoundedRectangle(cornerRadius: 3) // 원하는 반경을 설정하세요.
                        .fill(Color.blue) // 배경 색상
                        .frame(width: 25, height: 25) // 크기 설정
                        .rotationEffect(Angle(degrees: 45)) // 45도 회전시켜 다이아몬드 모양 만들기
                    
                    // 화살표 아이콘
                    Image(systemName: "arrow.turn.up.right")
                        .foregroundColor(.white) // 화살표 색상
                        .font(.system(size: 14)) // 크기 설정
                        .bold()
                }
            }.padding(.top, 60)
                .padding(.leading, 280)
        }
    }
}

#Preview {
    TodayRecommendedCard(spot: touristSpots[0])
}
