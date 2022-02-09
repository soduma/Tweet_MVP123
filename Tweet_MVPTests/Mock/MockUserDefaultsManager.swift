//
//  MockUserDefaultsManager.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import XCTest
@testable import Tweet_MVP

class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var tweets: [Tweet] = []
    var newTweet: Tweet!
    
    var isCalledGetTweet = false
    var isCalledSetTweet = false
    
    func getTweet() -> [Tweet] {
        isCalledGetTweet = true
        return tweets
    }
    
    func setTweet(_ newValue: Tweet) {
        isCalledSetTweet = true
        self.newTweet = newValue
    }
}
