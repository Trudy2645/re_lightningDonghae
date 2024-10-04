//
//  SelectLifeStyleView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

//import Foundation
//import SwiftUI
//
//
//import SwiftUI
//
//struct SelectLifeStyleView: View {
//    @State private var searchText: String = "" // 입력 텍스트
//    
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                Text("오늘은")
//                    .font(.title)
////                    .fontWeight(.bold)
//                
//                HStack(spacing: 0) {
//                    Text("어떤 ")
//                    Text("하루")
//                        .foregroundStyle(Color.my147DFA)
//                        .bold()
//                    
//                    Text("를 보내고 싶나요?")
//                }
//                .font(.title)
////                .fontWeight(.bold)
//                
//                Text("적어주신 내용을 바탕으로 AI가 장소를 추천해드립니다.")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                // 텍스트 필드와 플레이스홀더
//                ZStack {
//                    if searchText.isEmpty {
//                        Text("시원한 바람을 맞으며 산책하고 싶어.")
//                            .foregroundStyle(Color.myB0B2B8)
//                            .padding(.trailing, 108)
//                    }
//                    
//                    TextField("", text: $searchText)
//                        .padding(.vertical, 10)
//                        .font(.body)
//                    // 밑줄
//                    Rectangle()
//                        .frame(width: 353, height: 1) // 밑줄 두께
//                        .foregroundStyle(Color.myB0B2B8) // 밑줄 색상
//                        .padding(.top, 30)
//                    NavigationLink(destination: AILottiView(), label: {
//                            Image(systemName: "magnifyingglass")
//                                .resizable()
//                                .frame(width: 22, height: 22)
//                                .padding(.leading, 320)
//                    })
//                }
//                .padding(.vertical, 10)
//                
//                Text("추천 검색어")
//                    .font(.headline)
//                    .padding(.top, 20)
//                    .bold()
//                
//                // 첫 번째 줄 추천 검색어 버튼들
//                HStack {
//                    ForEach(["러닝", "여행", "이색체험", "맛집"], id: \.self) { keyword in
//                        NavigationLink(destination: Text(keyword)) {
//                            Text(keyword)
//                                .padding(.vertical, 5)
//                                .padding(.horizontal, 10)
//                                .background(Color.myDEE9F5)
//                                .cornerRadius(10)
//                                .foregroundStyle(Color.my4195F9)
//                                .bold()
//                        }
//                    }
//                }
//                .padding(.vertical, 10)
//                
//                // 두 번째 줄 추천 검색어 버튼들
//                HStack {
//                    ForEach(["힐링", "카페", "쇼핑"], id: \.self) { keyword in
//                        NavigationLink(destination: Text(keyword)) {
//                            Text(keyword)
//                                .padding(.vertical, 5)
//                                .padding(.horizontal, 10)
//                                .background(Color.blue.opacity(0.1))
//                                .cornerRadius(10)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .padding(.vertical, 5)
//                
//                Spacer()
//            }
//            .padding()
//            .padding(.top, 40)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectLifeStyleView()
//    }
//}
import SwiftUI
import Foundation

struct AIRequest: Codable {
    let prompt: String
}

struct AIResponse: Codable {
    let response: String // API 응답에 따라 조정하세요
}



struct SelectLifeStyleView: View {
    @State private var searchText: String = "" // 입력 텍스트
    @State private var response: String? = nil // API 응답을 저장할 상태
    @State private var isShowingAnswerView = false // 네비게이션 제어 상태
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("오늘은")
                    .font(.title)

                HStack(spacing: 0) {
                    Text("어떤 ")
                    Text("하루")
                        .foregroundStyle(Color.blue) // Color.my147DFA로 대체 가능
                        .bold()
                    Text("를 보내고 싶나요?")
                }
                .font(.title)

                Text("적어주신 내용을 바탕으로 AI가 장소를 추천해드립니다.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // 텍스트 필드와 플레이스홀더
                ZStack {
                    TextField("시원한 바람을 맞으며 산책하고 싶어.", text: $searchText) // 플레이스홀더 설정
                        .padding(.vertical, 10)
                        .font(.body)
                        .background(Color.gray.opacity(0.2)) // 배경 색상 추가
                        .cornerRadius(8) // 모서리 둥글게
                        .padding(.trailing, 50) // 오른쪽 여백 조정
                    
                    Button(action: {
                        fetchAIResponse(prompt: "\(searchText) 이중에서 추천해줘. 뒤쪽에 설명에 해당하게 해줘. 구구롤러스케이트장(롤러, 인라인스케이트장),플라피아(꽃가게),챔피언 키즈카페(키즈카페),철향, 텟판야끼(육류,고기요리),겟럭키(카페, 디저트),ShaBing 샤빙(카페, 디저트),무명정원(카페, 디저트),모브포그(카페, 디저트),젤라떼리아 사우스브룩 연산(카페, 디저트),우든테이블(케이크전문),카페헤븐(카페, 디저트),소금(요리주점),리프페럿 사직점(동물카페),아휘의 부엌(이자카야),이조솥밥(한식),모노스코프(카페, 디저트),etalee(카페, 디저트),맛퍼줘(종합분식),바운티(카페, 디저트),수민어울공원(근린공원),오크레페 동래점(카페, 디저트),라일라카페(카페, 디저트),이로(이자카야),점프키즈카페(키즈카페, 실내놀이터),코모도테이블(카페, 디저트),충렬사(기념물),보헤미아(카페, 디저트),스미타티하우스(카페, 디저트),모해나키친(양식),온천천카페거리(거리, 골목),불란서와이너리(와인),온들랑 샤브샤브(샤브샤브),홀릭스 그라운드 (실내체육관),오렌지실내테니스장(스포츠, 오락),우리끼리 키즈카페 꿈꾸는 마을 해운대 재송점(키즈카페, 실내놀이터),한치두치 재송점(일본식 라멘),한빛공원(근린공원),멜리데이스튜디오(셀프, 대여스튜디오),재송한마음시장(시장),스튜디오 필(셀프, 대여스튜디오),왓더버거 센텀점(햄버거),르꽁비프(프랑스 음식),서요 재송점    (요리주점),베아트리체부티크(한복대여),키자니아 부산(체험, 홍보관),팔선생(중식당),영화의 전당(영화관),롯데백화점 센텀시티점(백화점),신세계백화점 센텀시티점(백화점),센텀 스파랜드(온천, 스파),nan(nan) 이중에서 추천하는 장소를 앞의 이름만 ,로 구분해서 나열해, 그리고 너가 아는 장소라며 너의 배경지식을 조금 활용해서 답변의 질을 높여도 좋아. ") // 버튼 클릭 시 API 호출
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding(.trailing, 16) // 버튼 위치 조정
                    }
                }
                .padding(.vertical, 10)

                Text("추천 검색어")
                    .font(.headline)
                    .padding(.top, 20)
                    .bold()
                
                // 첫 번째 줄 추천 검색어 버튼들
                HStack {
                    ForEach(["러닝", "여행", "이색체험", "맛집"], id: \.self) { keyword in
                        NavigationLink(destination: Text(keyword)) {
                            Text(keyword)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                    }
                }
                .padding(.vertical, 10)
                
                // 두 번째 줄 추천 검색어 버튼들
                HStack {
                    ForEach(["힐링", "카페", "쇼핑"], id: \.self) { keyword in
                        NavigationLink(destination: Text(keyword)) {
                            Text(keyword)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                .padding(.vertical, 5)
                
                Spacer()
            }
            .padding()
            .padding(.top, 40)
            .navigationDestination(isPresented: $isShowingAnswerView) {
                if let response = response {
                    AnswerView(answer: response) // API 응답을 AnswerView로 전달
                }
            }
        }
    }
    
    private func fetchAIResponse(prompt: String) {
        guard let url = URL(string: "http://34.22.84.70:8000/api/query/") else { return }
        
        let request = AIRequest(prompt: prompt)
        
        guard let jsonData = try? JSONEncoder().encode(request) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.response = aiResponse.response // 응답을 저장
                    self.isShowingAnswerView = true // AnswerView로 이동
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLifeStyleView()
    }
}
