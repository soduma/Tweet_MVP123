//
//  FeedPresenterTests.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/01.
//

import XCTest
@testable import Tweet_MVP

class FeedPresenterTests: XCTestCase {
    var sut: FeedPresenter!
    
    var viewController: MockFeedViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockFeedViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = FeedPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        userDefaultsManager = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가요청되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupView)
    }
    
    func test_viewWillAppear가요청되면() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetTweet)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_didTapWriteButton이요청되면() {
        sut.didTapWriteButton()
        
        XCTAssertTrue(viewController.isCalledMoveToWriteViewController)
    }
}
