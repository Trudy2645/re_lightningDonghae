//
//  AILottiView.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/2/24.
//

import Foundation
import SwiftUI

struct AILottiView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text("AI가 답변을")
                    .font(.title)
                Text("분석하고 있어요!")
                    .font(.title)
                    .padding(.top, -4)
                Text("잠시만 기다려주세요.")
                    .foregroundStyle(Color.my626671)
                    .padding(.top, 10)
            }
            .padding(.trailing, 160)
            .padding(.top, 100)
            Spacer()
            Text("여기에 로티 파일 넣기")
            Spacer()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    AILottiView()
}
