//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit
import SnapKit

class PopupViewController: UIViewController {
    
    let alertView = UIView()
    let tamagaImageView = UIImageView()
    let nameLabel = CustomLabel()
    let separatorView = UIView()
    let descriptionLabel = UILabel()
    let buttonSeparator = UIView()
    let cancelButton = UIButton()
    let okButton = UIButton()
    
    lazy var stackView = {
        let view = UIStackView(arrangedSubviews: [tamagaImageView, nameLabel, separatorView, descriptionLabel])
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        
        self.view.addSubview(view)
        return view
    }()
    
    var data: TamagotchiData?
    
    var okString: String = "시작하기"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierachy()
        configureLayout()
        configureUI()
    }
    

}

extension PopupViewController: ConfigureProtocol {
    func configureHierachy() {
        view.addSubview(alertView)
        alertView.addSubviews([stackView, buttonSeparator, cancelButton, okButton])
        
    }
    
    func configureLayout() {
        alertView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview().offset(-16)
            $0.height.equalToSuperview().multipliedBy(0.65)
        }
        
        tamagaImageView.snp.makeConstraints {
            $0.size.equalTo(100)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        buttonSeparator.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalTo(cancelButton.snp.top)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.12)
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        okButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.size.equalTo(cancelButton)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.4)
        
        alertView.backgroundColor = UIColor.backgroundColor
        alertView.clipsToBounds = true
        alertView.layer.cornerRadius = 5
        
        tamagaImageView.setTamagotchiView(radius: 50, borderWidth: 2.5)
        tamagaImageView.image = UIImage(named: data!.image)
        
        
        nameLabel.setTamagoLabel()
        nameLabel.text = data?.name
        
        separatorView.backgroundColor = .darkGray
        
        descriptionLabel.textColor = .fontAndBorderColor
        descriptionLabel.font = .contentsFont
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = data?.descriptionString
        
        buttonSeparator.backgroundColor = .lightGray.withAlphaComponent(0.6)
        
        cancelButton.backgroundColor = .lightGray.withAlphaComponent(0.3)
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.fontAndBorderColor, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        okButton.backgroundColor = .backgroundColor
        okButton.setTitle(okString, for: .normal)
        okButton.setTitleColor(.fontAndBorderColor, for: .normal)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func okButtonTapped() {
        if okButton.currentTitle == "시작하기" {
            print("메인화면으로 전환")
        } else {
            print("선택화면으로 전환")
        }
    }
    
    
}
