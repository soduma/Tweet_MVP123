//
//  FeedPresenter.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
    func reloadTableView()
    func moveToTweetViewController(with tweet: Tweet)
}

class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    private var userDefalutsManager: UserDefaultsManagerProtocol
    
    private var tweets: [Tweet] = []
    
    init(viewController: FeedProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefalutsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
    
    func viewWillAppear() {
        tweets = userDefalutsManager.getTweet()
        viewController?.reloadTableView()
    }
}

extension FeedPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweet = tweets[indexPath.row]
        viewController?.moveToTweetViewController(with: tweet)
    }
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell() }
        
        let tweet = tweets[indexPath.row]
        cell.setup(tweet: tweet)
        return cell
    }
}
