//
//  ProfileViewController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import UIKit
import SnapKit
import Toast_Swift

class ProfileViewController: UIViewController {
    private lazy var presenter = ProfilePresenter(viewController: self)
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16, weight: .bold)
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ProfileViewController: ProfileProtocol {
    func setView(name: String, account: String) {
        nameTextField.text = name
        accountTextField.text = account
    }
    
    func setupView() {
        navigationItem.title = "Profile"
        
        [nameTextField, accountTextField, saveButton]
            .forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        accountTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(nameTextField)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(accountTextField.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    
    func showToast() {
        view.makeToast("내용을 입력해주세요.")
    }
}

extension ProfileViewController {
    @objc func didTapSaveButton() {
        presenter.didTapSaveButton(name: nameTextField.text, account: accountTextField.text)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
