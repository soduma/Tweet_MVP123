//
//  TweetPresenter.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/09.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setView(tweet: Tweet)
    func setupView()
}

class TweetPresenter: NSObject {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet
    
    init(viewController: TweetProtocol, tweet: Tweet) {
        self.viewController = viewController
        self.tweet = tweet
    }
    
    func viewDidLoad() {
        viewController?.setView(tweet: tweet)
        viewController?.setupView()
    }
    
}
