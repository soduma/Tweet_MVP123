//
//  MockFeedViewController.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation
@testable import Tweet_MVP

class MockFeedViewController: FeedProtocol {
    var isCalledSetupView = false
    var isCalledReloadTableView = false
    var isCalledMoveToTweetViewController = false
    var isCalledMoveToWriteViewController = false
    
    func setupView() {
        isCalledSetupView = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func moveToTweetViewController(with tweet: Tweet) {
        isCalledMoveToTweetViewController = true
    }
    
    func moveToWriteViewController() {
        isCalledMoveToWriteViewController = true
    }
}
