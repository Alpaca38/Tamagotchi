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
    
    var data: TamagotchiData? {
        get {
            return UserDefaults.standard.tamagoData
        }
        
        set {
            UserDefaults.standard.tamagoData = newValue!
        }
    }

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
        setNaviTitle("\(data!.user.name)님의 이름 정하기", color: .fontAndBorderColor)
        
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        
        userTextField.textColor = .fontAndBorderColor
        userTextField.font = .contentsFont
        userTextField.text = data?.user.name
    }
    
    
}

extension UserChangeViewController {
    @objc func saveButtonTapped() {
        let text = userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let text else { return }
        
        if text.count >= 2 && text.count <= 6 {
            data?.user.name = userTextField.text!
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "올바르지 않은 이름입니다.", message: "이름은 2글자 이상 6글자 이하까지 가능합니다.")
        }
    }
}
