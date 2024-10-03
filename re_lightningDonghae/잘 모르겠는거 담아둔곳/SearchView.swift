//싼
import SwiftUI

struct SearchView: View {
    @Binding var searchText: String  // 검색어 상태를 받아옴
    
    var body: some View {
        VStack {
            // 텍스트 필드로 검색어 입력
            TextField("검색어를 입력하세요", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()  // 공간 채우기
        }
        .navigationTitle("관광지 검색")
    }
}

