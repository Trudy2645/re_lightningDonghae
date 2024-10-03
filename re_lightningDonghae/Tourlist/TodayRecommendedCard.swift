//Trudy
// 2024.10.03 목

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
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }.padding(.leading, 20)
                
                VStack(alignment: .leading) {
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
                    
                    Text(spot.truncatedAddress)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading, 10)
                Spacer()
            }
            
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
            .padding(.top)
                .padding(.leading, 300)
        }
    }
}

#Preview {
    TodayRecommendedCard(spot: touristSpots[0])
}
