//
//  UserDefaults.swift
//  re_lightningDonghae
//
//  Created by 트루디 on 10/3/24.
//
import Foundation

extension UserDefaults {
    var visitedSpots: Set<String> { // UUID 대신 String으로 변경
        get {
            // 저장된 문자열 배열을 가져옴
            let savedNames = stringArray(forKey: "visitedSpots") ?? []
            return Set(savedNames) // Set<String>으로 변환
        }
        set {
            // Set<String>을 문자열 배열로 변환하여 저장
            let names = newValue.map { $0 } // 새로운 Set에서 이름만 가져옴
            set(names, forKey: "visitedSpots")
        }
    }
}

