import SwiftUI
import FirebaseAuth

struct MainView: View {
    @State private var isLifeStyleSelected = false
    @State private var isSubwayStationSelected = false
    @State private var isUserLoggedIn = Auth.auth().currentUser != nil
    @State private var showLogoutAlert = false // 로그아웃 경고창 표시 여부
    
    var body: some View {
        NavigationStack {
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
                        // 지구본 버튼 액션 (예: 다국어 설정)
                    }, label: {
                        Image(systemName: "globe")
                            .frame(width: 24, height: 25)
                    })
                    .buttonStyle(.plain)

                    // 로그인 상태에 따라 다른 버튼 표시
                    if isUserLoggedIn {
                        Button(action: {
                            showLogoutAlert = true // 로그아웃 경고창 띄우기
                        }, label: {
                            Text("로그아웃")
                                .foregroundStyle(Color.black)
                        })
                    } else {
                        NavigationLink(destination: LoginView(), label: {
                            Text("로그인")
                                .foregroundStyle(Color.black)
                        })
                    }
                } //: HSTACK
                .padding()
                
                
                
                Spacer()
                    .frame(height: 12)
                
                // 라이프스타일 및 도착역 선택 버튼
                HStack {
                    Button {
                        isLifeStyleSelected = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 174, height: 262)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                            VStack(alignment: .leading) {
                                Text("라이프 스타일")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                    .padding(.bottom, 3)
                                    .padding(.top, 120)
                                Text("입력하기")
                                    .bold()
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 16)
//                                Spacer()
                                Image("LifeStylefire")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .padding(.leading, 82)
                                    .padding(.top,50)
//                                    .padding(.top, -200)
                                    
                            }
                            .padding(.top, -100)
                        }
                    }
                    .padding(.leading)
                    .navigationDestination(isPresented: $isLifeStyleSelected) {
                        SelectLifeStyleView()
                    
                    }
                    
                    VStack{
                        Button {
                            isSubwayStationSelected = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 167, height: 180)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                                
                                VStack(alignment: .leading) {
                                    Spacer().frame(height: 40)
                                    Group {
                                        Text("도착역")
                                            .bold()
                                        Spacer().frame(height: 8)
                                        Text("선택하기")
                                            .bold()
                                    }
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                    
                                    Image("GetStationIcon")
                                        .resizable()
                                        .frame(width: 85, height: 85)
                                        .padding(.leading, 82)
                                        .padding(.top, -13)
                                        .padding(.bottom, 9)
                                }
                            }
                        }
                        .navigationDestination(isPresented: $isSubwayStationSelected) {
                            SelectArrivalStation()
                        }
                        // 주변 스탬프 찾기
                        NavigationLink(destination: StampMapView(), label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 164, height: 70)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                                
                                HStack {
                                    Text("스탬프 찾기")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(.leading, 20)
                                        .padding(.vertical, 24)
                                    
                                    Image("FindIcon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipped()
                                        .padding(.trailing)
                                        .padding(.top, 5)
                                }
                            }
                        })
                    }
                    
                } //: HSTACK
                
                // 오늘의 추천 카드
                HStack {
                    Text("오늘 이곳은 어떤가요?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading, 20)
                        .padding(.top, 50)
                        .padding(.bottom, 16)
                    Spacer()
                }
                .padding(.top, -30)
                
                VStack{
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
                        VStack{
                            HStack {
                                AsyncImage(url: URL(string: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20171117_54%2F1510878782796HdbRU_PNG%2FKcmlAdwK2BGHBSlAU80N8z3z.PNG.png")) { image in
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
                                    Text("벡스코역")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(10)
                                    Text("영화의 전당")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Text("부산 해운대구")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.leading, 10)
                                Spacer()
                                
                                Button(action: {
                                    print("dd")
                                }, label: {
                                    Image(systemName: "arrow.up.forward.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(Color.blue)
                                })
                                .padding(.trailing, 30)
                                .padding(.top, 50)
                            }
                            
                        }
                        
                        //                        NavigationLink(destination: Directions1View(spot: )) {
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 8)
                        //                                    .fill(Color.blue)
//                                    .frame(width: 30, height: 30)
//                                    .rotationEffect(Angle(degrees: 45))
//                                
//                                Image(systemName: "arrow.turn.up.right")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 14))
//                                    .bold()
//                            }
//                        }
//                        .padding(.top)
//                            .padding(.leading, 300)
                    }
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
                        VStack{
                            HStack {
                                AsyncImage(url: URL(string: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220830_16%2F1661821720704gnMTR_JPEG%2F%25B9%25E9%25C8%25AD%25C1%25A1_%25BC%25BE%25C5%25D2%25BD%25C3%25C6%25BC%25C1%25A1.jpg")) { image in
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
                                    Text("벡스코역")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(10)
                                    Text("롯데백화점 센텀시티점")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Text("부산 해운대구")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.leading, 10)
                                Spacer()
                                Button(action: {
                                    print("dd")
                                }, label: {
                                    Image(systemName: "arrow.up.forward.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(Color.blue)
                                })
                                .padding(.trailing, 30)
                                .padding(.top, 50)
                            }
                            
                        }
                        
//                        NavigationLink(destination: Directions1View(spot: )) {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 8)
//                                    .fill(Color.blue)
//                                    .frame(width: 30, height: 30)
//                                    .rotationEffect(Angle(degrees: 45))
//
//                                Image(systemName: "arrow.turn.up.right")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 14))
//                                    .bold()
//                            }
//                        }
//                        .padding(.top)
//                            .padding(.leading, 300)
                    }
                }
                
            } //: VSTACK
        } //: NAVIGATIONSTACK
        .alert(isPresented: $showLogoutAlert) {
            Alert(
                title: Text("로그아웃"),
                message: Text("정말 로그아웃 하시겠습니까?"),
                primaryButton: .destructive(Text("확인"), action: {
                    logOut() // 로그아웃 실행
                }),
                secondaryButton: .cancel(Text("취소"))
            )
        }
        .navigationBarBackButtonHidden()
    }
    
    // 로그아웃 함수
    private func logOut() {
        do {
            try Auth.auth().signOut()
            isUserLoggedIn = false // 로그아웃 후 상태 업데이트
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
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
