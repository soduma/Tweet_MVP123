//
//  TweetViewController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/09.
//

import UIKit
import SnapKit

class TweetViewController: UIViewController {
    private var presenter: TweetPresenter!
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var isLikedButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    init(tweet: Tweet) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = TweetPresenter(viewController: self, tweet: tweet)
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension TweetViewController: TweetProtocol {
    func setView(tweet: Tweet) {
        nameLabel.text = tweet.user.name
        accountLabel.text = "@\(tweet.user.account)"
        contentLabel.text = tweet.content
    }
    
    func setupView() {
        let userInfoStackView = UIStackView(arrangedSubviews: [nameLabel, accountLabel])
        userInfoStackView.axis = .vertical
        userInfoStackView.distribution = .equalSpacing
        userInfoStackView.spacing = 4
        
        let buttonStackView = UIStackView(arrangedSubviews: [isLikedButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [profileImageView, userInfoStackView, contentLabel, buttonStackView]
            .forEach { view.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(60)
        }
        
        userInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(profileImageView)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
