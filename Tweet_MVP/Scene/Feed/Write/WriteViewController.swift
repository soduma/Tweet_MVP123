//
//  WriteViewController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/09.
//

import UIKit
import SnapKit

class WriteViewController: UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(didTapLeftBarButtonItem))
        return item
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "게시", style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        item.isEnabled = false
        return item
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.text = "무슨 일이 일어나고 있나요?"
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.textColor = .secondaryLabel
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension WriteViewController: WriteProtocol {
    func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubview(textView)
        
        textView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension WriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(text: textView.text)
    }
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = ""
        textView.textColor = .label
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}
