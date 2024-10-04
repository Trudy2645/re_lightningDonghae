import SwiftUI
import CoreLocation
import FirebaseAuth
import FirebaseFirestore


// 관광지 정보를 담을 구조체
//struct TouristSpot: Identifiable {
//    let id: UUID = UUID()  // 각 관광지 정보의 고유 ID
//    let name: String
//    let latitude: Double
//    let longitude: Double
//    let address: String
//    let nearestSubway: String
//    let description: String
//    let imageURL: String  // 사진 URL 추가
//}

struct TouristSpotCard: View {
    let spot: TouristSpot
    @StateObject private var locationManager = LocationManager() // 현재 위치 관리
    @State private var showingCommentSheet = false // 댓글 입력 창 표시 여부
    @State private var comments: [Comment] = [] // Firestore에서 불러온 댓글 리스트
    @State private var userName = "" // 사용자의 닉네임
    @State private var isVisited = false // 관광지 방문 여부 확인

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                // 관광지 이미지
                AsyncImage(url: URL(string: spot.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 90, height: 90)
                }
                
                // 관광지 정보
                VStack(alignment: .leading, spacing: 5) {
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
                    Text(spot.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // 방문 여부에 따른 텍스트 표시
                    Text(isVisited ? "방문 완료" : "방문 전")
                        .font(.subheadline)
                        .foregroundColor(isVisited ? .green : .red)
                        .bold()
                }
            }

            // 경로 찾기와 댓글 달기 버튼
            HStack {
                // 경로 찾기 버튼
                NavigationLink(destination: Directions1View(spot: spot)) {
                    Text("경로 찾기")
                }
                Spacer()
                
                // 댓글 달기 버튼
                Button("댓글") {
                    showingCommentSheet = true
                }
            }
            .sheet(isPresented: $showingCommentSheet) {
                CommentInputSheet(spot: spot, userName: userName, comments: $comments)
            }
        }
        .padding()
        .onAppear {
            fetchComments()
            fetchUserName()
            checkIfVisited() // 방문 여부 확인
        }
    }

    // Firestore에서 댓글 불러오기
    private func fetchComments() {
        let db = Firestore.firestore()
        db.collection("touristSpots").document(spot.name).collection("comments").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching comments: \(error.localizedDescription)")
            } else {
                self.comments = snapshot?.documents.compactMap { doc -> Comment? in
                    try? doc.data(as: Comment.self)
                } ?? []
            }
        }
    }
    
    // Firestore에서 사용자 닉네임 불러오기
    private func fetchUserName() {
        guard let user = Auth.auth().currentUser else { return }
        let emailPrefix = user.email?.split(separator: "@").first ?? ""
        let maskedName = maskEmailName(emailPrefix: String(emailPrefix))
        self.userName = maskedName
    }
    
    // 이메일 앞부분을 마스킹하는 함수
    private func maskEmailName(emailPrefix: String) -> String {
        let length = emailPrefix.count
        let maskedPart = String(repeating: "*", count: max(0, length - 4))
        let maskedEmail = String(emailPrefix.prefix(2)) + maskedPart + String(emailPrefix.suffix(2))
        return maskedEmail
    }
    
    // UserDefaults에서 관광지 방문 여부 확인
    private func checkIfVisited() {
        let visitedSpots = UserDefaults.standard.stringArray(forKey: "visitedSpots") ?? []
        isVisited = visitedSpots.contains(spot.name)
    }
}

struct CommentInputSheet: View {
    let spot: TouristSpot
    let userName: String
    @Binding var comments: [Comment] // 댓글을 업데이트하기 위한 바인딩
    @State private var commentText = ""

    var body: some View {
        VStack {
            Text("댓글 입력")
                .font(.headline)
                .padding()

            // 이전 댓글 표시
            VStack(alignment: .leading) {
                ForEach(comments) { comment in
                    Text(comment.text)
                        .foregroundColor(.black)
                        .font(.system(size: 13))
                        .padding(.bottom, 1)
                }
            }
            .padding(.bottom)

            TextField("댓글을 입력하세요...", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                submitComment()
            }) {
                Text("댓글 달기")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            fetchComments() // 시트가 올라올 때 댓글을 불러옴
        }
    }
    
    // Firestore에서 댓글 가져오기
    private func fetchComments() {
        let db = Firestore.firestore()
        
        db.collection("touristSpots").document(spot.name).collection("comments").order(by: "timestamp").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching comments: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No comments found.")
                return
            }
            
            // 댓글 목록을 업데이트
            comments = documents.compactMap { document -> Comment? in
                let data = document.data()
                let id = document.documentID
                let text = data["text"] as? String ?? ""
                let userName = data["userName"] as? String ?? ""
                let timestamp = (data["timestamp"] as? Timestamp)?.dateValue() ?? Date()

                return Comment(id: id, text: text, userName: userName, timestamp: timestamp)
            }
        }
    }

    // Firestore에 댓글 저장하기
    private func submitComment() {
        guard !commentText.isEmpty else { return }
        
        let db = Firestore.firestore()
        let comment = Comment(id: UUID().uuidString, text: commentText, userName: userName, timestamp: Date())
        
        db.collection("touristSpots").document(spot.name).collection("comments").document(comment.id).setData([
            "text": comment.text,
            "userName": comment.userName,
            "timestamp": comment.timestamp
        ]) { error in
            if let error = error {
                print("Error saving comment: \(error.localizedDescription)")
            } else {
                print("Comment successfully saved!")
                commentText = "" // 댓글 입력 필드 초기화
            }
        }
    }
}

struct Comment: Identifiable, Codable {
    var id: String
    var text: String
    var userName: String
    var timestamp: Date
}
