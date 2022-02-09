//
//  ProfilePresenter.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation

protocol ProfileProtocol: AnyObject {
    func setView(name: String, account: String)
    func setupView()
    func endEditing()
    func showToast()
}

class ProfilePresenter: NSObject {
    private weak var viewController: ProfileProtocol?
    
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    init(viewController: ProfileProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setView(name: user.name, account: user.account)
        viewController?.setupView()
    }
    
    func didTapSaveButton(name: String?, account: String?) {
        if name == nil || name == "" || account == nil || account == "" {
            viewController?.showToast()
            return
        }
        
        if let name = name {
            user.name = name
        }
        
        if let account = account {
            user.account = account
        }
        
        viewController?.setView(name: user.name, account: user.account)
        viewController?.endEditing()
    }
}
