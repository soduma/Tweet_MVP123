//
//  FeedViewController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import UIKit
import SnapKit
import Floaty

class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private lazy var writeButton: Floaty = {
        let button = Floaty(size: 50)
        button.sticky = true
        button.handleFirstItemDirectly = true
        button.addItem(title: "") { _ in
            print("float!!!!!")
        }
        button.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"
        
        [tableView, writeButton]
            .forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        writeButton.paddingY = 100
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
