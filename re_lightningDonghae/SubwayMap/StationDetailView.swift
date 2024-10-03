//
//  SubwayMapSheet.swift
//  lightningdonghae
//
//  Created by 트루디 on 10/1/24.
//
import SwiftUI

struct StationDetailView: View {
    let station: String

    var body: some View {
        VStack {
            // 상단 뷰: 이전역, 현재역, 다음역
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 60)
                HStack {
                    Button(action: {
                        print("이전 역 버튼 누름")
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 11, height: 20)
                    })
                    .padding(.leading, 20)
                    .padding(.trailing, 8)
                    .foregroundColor(Color.white)

                    Text("이전역")
                        .foregroundColor(Color.white)

                    Spacer()

                    Text("\(station)")
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 128, height: 38)
                        )
                        .foregroundColor(Color.blue)

                    Spacer()

                    Text("다음역")
                        .foregroundColor(Color.white)

                    Button(action: {
                        print("다음역 버튼 누름")
                    }, label: {
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 11, height: 20)
                    })
                    .padding(.trailing, 20)
                    .padding(.leading, 8)
                    .foregroundColor(Color.white)
                }
            }

            // 열차 시간표 표시
            if let schedule = subwaySchedules[station] {
                HStack {
                    // 상행선
                    VStack {
                        Text("부전행")
                            .fontWeight(.bold)
                        let nextUpTimes = getNextTrainTimes(schedule.weekdayUp, schedule.weekendUp)
                        ForEach(nextUpTimes, id: \.self) { time in
                            Text(time)
                                .padding(5)
                        }
                    }

                    // 분리선
                    Rectangle()
                        .frame(width: 1, height: 50)
                        .foregroundColor(Color.gray)

                    // 하행선
                    VStack {
                        Text("태화강행")
                            .fontWeight(.bold)
                        let nextDownTimes = getNextTrainTimes(schedule.weekdayDown, schedule.weekendDown)
                        ForEach(nextDownTimes, id: \.self) { time in
                            Text(time)
                                .padding(5)
                        }
                    }
                }
            }
        }
        .padding()
    }

    // 현재 시간 기준으로 가장 가까운 두 개의 열차 시간 계산
    private func getNextTrainTimes(_ weekdayTimes: [String], _ weekendTimes: [String]) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let now = Date()
        
        // 현재 요일 확인 (1: 일요일, 7: 토요일)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: now)
        let isWeekend = (components.weekday == 1 || components.weekday == 7)

        // 현재 시간 가져오기
        let currentTime = dateFormatter.string(from: now)

        // 현재 시간 이후의 시간 필터링
        let upcomingTimes = (isWeekend ? weekendTimes : weekdayTimes).filter {
            guard let time = dateFormatter.date(from: $0) else { return false }
            return time > dateFormatter.date(from: currentTime)!
        }

        // 가장 가까운 두 개의 시간을 가져오기
        let nextTwoTimes = Array(upcomingTimes.prefix(2))
        return nextTwoTimes
    }
}

