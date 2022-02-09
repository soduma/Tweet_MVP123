//
//  TweetPresenterTests.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import XCTest
@testable import Tweet_MVP

class TweetPresenterTests: XCTestCase {
    var sut: TweetPresenter!
    
    var viewController: MockTweetViewController!
    var tweet: Tweet!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockTweetViewController()
        tweet = Tweet(user: User(name: "name", account: "account"), content: "content")
        
        sut = TweetPresenter(viewController: viewController, tweet: tweet)
    }
    
    override func tearDown() {
        sut = nil
        tweet = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가요청되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetView)
        XCTAssertTrue(viewController.isCalledSetUpView)
    }
}

