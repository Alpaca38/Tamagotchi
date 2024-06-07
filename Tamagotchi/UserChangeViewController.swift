//
//  UserChangeViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/7/24.
//

import UIKit
import SnapKit

class UserChangeViewController: UIViewController {
    
    let userTextField = UITextField()
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userTextField.underlined()
    }
}

extension UserChangeViewController: ConfigureProtocol {
    func configureHierachy() {
        view.addSubview(userTextField)
    }
    
    func configureLayout() {
        userTextField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(40)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .backgroundColor
        setNaviTitle("\(user!.name)님의 이름 정하기", color: .fontAndBorderColor)
        
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        
        userTextField.textColor = .fontAndBorderColor
        userTextField.font = .contentsFont
        userTextField.text = user?.name
    }
    
    
}

extension UserChangeViewController {
    @objc func saveButtonTapped() {
        let text = userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text?.isEmpty == false {
            user?.name = userTextField.text!
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "이름을 입력해주세요.", message: nil)
        }
    }
}
