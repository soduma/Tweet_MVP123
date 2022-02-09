//
//  MockWriteViewController.swift
//  Tweet_MVPTests
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation
@testable import Tweet_MVP

class MockWriteViewController: WriteProtocol {
    var isCalledSetupView = false
    var isCalledDismiss = false
    
    func setupView() {
        isCalledSetupView = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
}
