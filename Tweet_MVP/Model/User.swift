//
//  User.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String
    
    static var shared = User(name: "정보입력란", account: "soduma")
}
