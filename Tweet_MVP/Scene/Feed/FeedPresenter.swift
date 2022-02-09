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
}

class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    
    init(viewController: FeedProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
}

extension FeedPresenter: UITableViewDelegate {
    
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell() }
        
        let tweet = Tweet(user: User.shared, content: "안녕하세요")
        cell.setup(tweet: tweet)
        return cell
    }
}
