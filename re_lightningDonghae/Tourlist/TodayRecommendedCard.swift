//
//  TodayRecommendedCard.swift
//  DiveIn2024Test
//
//  Created by Cho YeonJi on 9/29/24.
//

import SwiftUI

struct TodayRecommendedCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.clear)
                .background(.white)
                .frame(width: 353, height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.87, green: 0.91, blue: 0.96), lineWidth: 1)
                ) //: overlay
            Image("")
            
            
        } //: ZSTACK
        
    }
}

#Preview {
    TodayRecommendedCard()
}
