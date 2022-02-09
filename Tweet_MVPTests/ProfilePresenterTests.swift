//
//  ProfilePresenterTests.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import XCTest
@testable import Tweet_MVP

class ProfilePresenterTests: XCTestCase {
    var sut: ProfilePresenter!
    var viewController: MockProfileViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockProfileViewController()
        sut = ProfilePresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가요청되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetView)
        XCTAssertTrue(viewController.isCalledSetUpView)
    }
    
    //name x
    func test_didTapSaveButton가요청될때name이존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: "account")
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetView)
        XCTAssertFalse(viewController.isCalledEndEditing)
    }
    
    //account x
    func test_didTapSaveButton가요청될때account가존재하지않으면() {
        sut.didTapSaveButton(name: "name", account: nil)
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetView)
        XCTAssertFalse(viewController.isCalledEndEditing)
    }
    
    //both x
    func test_didTapSaveButton가요청될때name과account가존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: nil)
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetView)
        XCTAssertFalse(viewController.isCalledEndEditing)
    }
    
    //both o
    func test_didTapSaveButton가요청될때모두존재하면() {
        sut.didTapSaveButton(name: "name", account: "account")
        
        XCTAssertFalse(viewController.isCalledShowToast)
        XCTAssertTrue(viewController.isCalledSetView)
        XCTAssertTrue(viewController.isCalledEndEditing)
    }
}
