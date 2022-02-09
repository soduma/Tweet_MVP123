//
//  MockProfileViewController.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation
@testable import Tweet_MVP

class MockProfileViewController: ProfileProtocol {
    var isCalledSetView = false
    var isCalledSetUpView = false
    var isCalledEndEditing = false
    var isCalledShowToast = false
    
    func setView(name: String, account: String) {
        isCalledSetView = true
    }
    
    func setupView() {
        isCalledSetUpView = true
    }
    
    func endEditing() {
        isCalledEndEditing = true
    }
    
    func showToast() {
        isCalledShowToast = true
    }
}
