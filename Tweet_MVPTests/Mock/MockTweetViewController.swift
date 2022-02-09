//
//  MockTweetViewController.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation
@testable import Tweet_MVP

class MockTweetViewController: TweetProtocol {
    var isCalledSetView = false
    var isCalledSetUpView = false
    
    func setView(tweet: Tweet) {
        isCalledSetView = true
    }
    
    func setupView() {
        isCalledSetUpView = true
    }
}
