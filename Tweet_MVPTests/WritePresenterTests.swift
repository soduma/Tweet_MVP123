//
//  WritePresenterTests.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import XCTest
@testable import Tweet_MVP

class WritePresenterTests: XCTestCase {
    var sut: WritePresenter!
    
    var viewController: MockWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = WritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
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
    
    func test_didTapLeftBarButtonItem가요청되면() {
        sut.didTapLeftBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledDismiss)
    }
    
    func test_didTapRightBarButtonItem가요청되면() {
        sut.didTapRightBarButtonItem(text: "")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetTweet)
        XCTAssertTrue(viewController.isCalledDismiss)
    }
}
