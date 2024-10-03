//  MainView.swift
//  DiveIn2024Test
//
//  Created by Cho YeonJi on 9/29/24.
//

import SwiftUI

struct MainView: View {
    @State private var isLifeStyleSelected = false
    @State private var isSubwayStationSelected = false
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Image("testingLogo")
                        .resizable()
                        .frame(width: 99, height: 34)
                        .padding(.leading, 15)
                        .padding(.trailing, 16)
                        .padding(.vertical, 12)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "globe")
                            .frame(width: 24, height: 25)
                    }) .buttonStyle(.plain)
                    NavigationLink(destination: LoginView(), label: {
                        Text("로그인")
                            .foregroundStyle(Color.black)
                    })
                    
                } //: HSTACK
                .padding()
                
                NavigationLink(destination: StampMapView(), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 70)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                        
                        HStack (spacing: 114){
                            Text("주변 스탬프 찾기")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.leading, 39)
                                .padding(.vertical, 24)
                            
                            Image("FindIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .clipped()
                                .padding(.trailing, 39)
                                .padding(.top, 5)
                            
                        } //: HSTACK
                    } //: ZSTACK

                })
                Spacer()
                    .frame(height: 12)
                
                HStack (spacing: 19) {
                    Button {
                        isLifeStyleSelected = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 167, height: 180)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                            
                            VStack (alignment: .leading){
                                Spacer()
                                    .frame(height: 40)
                                Group {
                                    Text("라이프스타일")
                                    Spacer()
                                        .frame(height: 8)
                                    Text("선택하기")
                                } .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                
                                Image("LifeStylefire")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .padding(.leading, 82)
                                    .padding(.top, -13)
                                    .padding(.bottom, 9)
                            } //: Vstack
                        } //: Zstack
                    } //: Button
                    .navigationDestination(isPresented: $isLifeStyleSelected) {
                        // 이동할 뷰 작성
                        SelectLifeStyleView()
                    }
                    Button {
                        isSubwayStationSelected = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 167, height: 180)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                            
                            VStack (alignment: .leading){
                                Spacer()
                                    .frame(height: 40)
                                Group {
                                    Text("도착역")
                                    Spacer()
                                        .frame(height: 8)
                                    Text("선택하기")
                                } .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                
                                Image("GetStationIcon")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .padding(.leading, 82)
                                    .padding(.top, -13)
                                    .padding(.bottom, 9)
                            } //: Vstack
                        } //: Zstack
                    } //: Button
                    .navigationDestination(isPresented: $isSubwayStationSelected) {
                        // 이동할 뷰 작성
                        SelectArrivalStation()
                    }
                } //: HSTACK
                
                HStack{
                    Text("오늘 이곳은 어떤가요?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading, 20)
                        .padding(.top, 50)
                        .padding(.bottom, 16)
                    Spacer()
                }
                let randomIndices = generateRandomIndices(count: touristSpots.count, numberOfRandomItems: 2)
                            TodayRecommendedCard(spot: touristSpots[randomIndices[0]])
                            TodayRecommendedCard(spot: touristSpots[randomIndices[1]])
//                TodayRecommendedCard(spot: touristSpots[0])
//                TodayRecommendedCard(spot: touristSpots[1])
                
                
                
            } //: VSTACK
        } //: NAVIGATIONSTACK
        .navigationBarBackButtonHidden()
    }
    // 랜덤 숫자 생성 함수
        func generateRandomIndices(count: Int, numberOfRandomItems: Int) -> [Int] {
            var randomIndices: Set<Int> = []
            while randomIndices.count < numberOfRandomItems {
                let randomIndex = Int.random(in: 0..<count)
                randomIndices.insert(randomIndex)
            }
            return Array(randomIndices)
        }
}

#Preview {
    MainView()
}
