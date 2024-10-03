import SwiftUI

// 역 리스트
let stations = [
    "부전역", "거제해맞이역", "거제역", "부산교대역", "동래역", "안락역", "부산원동역",
    "재송역", "센텀역", "벡스코역", "신해운대역", "송정역", "오시리아역", "기장역", "일광역",
    "좌천역", "월내역", "서생역", "남창역", "망양역", "덕하역", "개운포역", "태화강역"
]

// 메인 화면: 역 리스트
struct SelectArrivalStation: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("도착역 선택하기")
                    .font(.title)
                    .bold()
                    .padding(.trailing, 190)
                    .padding(.top)
                ForEach(Array(stations.enumerated()), id: \.offset) { index, station in
                    VStack {
                        HStack{
                            if index != 0 {
                                DottedLine() // 원으로 된 두 개의 점선
                                    .frame(width: 4, height: 10)
                                    .foregroundColor(Color.my58A2F9)
                                    .padding(.leading, 30)
                            }
                            Spacer()
                        }
                        NavigationLink(destination: ResultOfStationSelection(station: station)) {
                            HStack {
                                Circle()
                                    .fill(Color.my4195F9)
                                    .frame(width: 30, height: 30)
                                    .overlay(Text("\(index + 1)").foregroundColor(.white))
                                
                                Text("\(station)")
                                    .font(.system(size: 17))
                                    .padding(.leading, 10)
                                    .foregroundStyle(Color.black)
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.myDEE9F5)
                            .cornerRadius(10)
                            .frame(width: 353, height: 60)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// 두 개의 원을 표시하는 점선 그리기 컴포넌트
struct DottedLine: View {
    var body: some View {
        VStack(spacing: 5) { // 원 사이의 간격을 조정
            Circle()
                .frame(width: 4, height: 4)
            Circle()
                .frame(width: 4, height: 4)
        }
    }
}

