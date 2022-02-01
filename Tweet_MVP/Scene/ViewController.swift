//
//  ViewController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = UserDefaultsManager()
        manager.setTweet(Tweet(user: User.shared, content: "안녕하세요"))
        
        print(manager.getTweet())
    }
}
