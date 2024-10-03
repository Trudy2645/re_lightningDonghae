import SwiftUI

// 역 리스트
let stations = [
    "부전", "거제해맞이", "거제", "부산교대", "동래", "안락", "부산원동",
    "재송", "센텀", "벡스코", "신해운대", "송정", "오시리아", "기장", "일광",
    "좌천", "월내", "서생", "남창", "망양", "덕하", "개운포", "태화강"
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
                        NavigationLink(destination: EmptyView(station: station)) {
                            HStack {
                                Circle()
                                    .fill(Color.my4195F9)
                                    .frame(width: 30, height: 30)
                                    .overlay(Text("\(index + 1)").foregroundColor(.white))
                                
                                Text("\(station)역")
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

// 엠프티 뷰: 선택한 역 이름을 표시
struct EmptyView: View {
    var station: String
    
    var body: some View {
        VStack {
            Text("\(station)역 정보가 없습니다.")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationBarTitle("검색결과", displayMode: .inline)
        .toolbar(content: {
            NavigationLink(destination: MainView(), label: {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundStyle(Color.my147DFA)
            })
        })
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

