//
//  WritePresenter.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupView()
    func dismiss()
}

class WritePresenter: NSObject {
    private weak var viewController: WriteProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol?
    
    init(viewController: WriteProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
    
    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }
    
    func didTapRightBarButtonItem(text: String) {
        let tweet = Tweet(user: User.shared, content: text)
        userDefaultsManager?.setTweet(tweet)
        viewController?.dismiss()
    }
}
