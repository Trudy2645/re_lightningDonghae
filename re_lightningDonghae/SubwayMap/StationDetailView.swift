//
//  SubwayMapSheet.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/1/24.
//

import Foundation
import SwiftUI

struct StationDetailView: View {
    let station: String
    
    var body: some View {
        VStack {
            // 이전 역 현재역 다음역
            ZStack{
                Rectangle()
                        .fill(Color.my3356B4)
                        .frame(width: 393, height: 60)
                HStack{
                    Button(action: {
                        print("이전 버튼 누름")
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 11, height: 20)
                    })
                    .padding(.leading, 20)
                    .padding(.trailing, 8)
                    .foregroundStyle(Color.white)
                    
                    Text("이전역")
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    Text("\(station)")
                        .background(
                            RoundedRectangle(cornerRadius: 20) // 모서리 반지름 설정
                                .fill(Color.white) // 배경 색상 설정
                                .frame(width: 128, height: 38)
                        )
                        .foregroundColor(Color.my3356B4) // 텍스트 색상 설정
                    
                    Spacer()
                    
                    Text("다음역")
                        .foregroundStyle(Color.white)
                    
                    Button(action: {
                        print("다음역 버튼 누름")
                    }, label: {
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 11, height: 20)
                    })
                    .padding(.trailing, 20)
                    .padding(.leading, 8)
                    .foregroundStyle(Color.white)
                }
               
            }
            HStack{
                //부전행
                VStack{
                    HStack{
                        Text("부전행")
                            .padding(.trailing, 10)
                        Text("8분 33초")
                            .foregroundStyle(Color.myFF892A)
                    }
                    HStack{
                        Text("부전행")
                            .padding(.trailing, 10)
                        Text("8분 33초")
                            .foregroundStyle(Color.myFF892A)
                    }
                }
                Rectangle()
                       .frame(width: 1, height: 50) // 두께 0.5, 길이 30
                       .foregroundStyle(Color.myEFEFEF) // 세로선 색상 설정
                       .padding(.horizontal)
                //태화강행
                VStack{
                    HStack{
                        Text("태화강행")
                            .padding(.trailing, 10)
                        Text("8분 33초")
                            .foregroundStyle(Color.myFF892A)
                    }
                    HStack{
                        Text("태화강행")
                            .padding(.trailing, 10)
                        Text("8분 33초")
                            .foregroundStyle(Color.myFF892A)
                    }
                }
            }
        }
        .padding()
    }
}
