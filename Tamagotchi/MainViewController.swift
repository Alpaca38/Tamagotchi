//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let bubbleImageView = UIImageView()
    let speechLabel = UILabel()
    let tamagoImageView = UIImageView()
    let nameLabel = CustomLabel()
    let statusLabel = UILabel()
    let foodTextField = UITextField()
    let foodButton = UIButton()
    let waterTextField = UITextField()
    let waterButton = UIButton()
    
    lazy var mainStackView = {
        let view = UIStackView(arrangedSubviews: [bubbleImageView, tamagoImageView, nameLabel, statusLabel])
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var foodStackView = {
        let view = UIStackView(arrangedSubviews: [foodTextField, foodButton])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var waterStackView = {
        let view = UIStackView(arrangedSubviews: [waterTextField, waterButton])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
        
        self.view.addSubview(view)
        return view
    }()
    
    var data: TamagotchiData?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        foodTextField.underlined()
        waterTextField.underlined()
    }

}

extension MainViewController: ConfigureProtocol {
    
    func configureHierachy() {
        view.addSubview(speechLabel)
    }
    
    func configureLayout() {
        mainStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-70)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.55)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        bubbleImageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.33)
        }
        
        tamagoImageView.snp.makeConstraints {
            $0.size.equalTo(mainStackView.snp.width).multipliedBy(0.9)
        }
        
        speechLabel.snp.makeConstraints {
            $0.centerY.equalTo(bubbleImageView).offset(-6)
            $0.centerX.equalTo(bubbleImageView)
            $0.width.equalTo(mainStackView).multipliedBy(0.8)
        }
        
        foodStackView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.centerX.equalToSuperview()
        }
        
        waterStackView.snp.makeConstraints {
            $0.top.equalTo(foodStackView.snp.bottom).offset(10)
            $0.width.equalTo(foodStackView)
            $0.centerX.equalToSuperview()
        }
        
        foodTextField.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.65)
        }
        
        foodButton.snp.makeConstraints {
            $0.height.equalTo(view).multipliedBy(0.035)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        waterTextField.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.65)
        }
        
        waterButton.snp.makeConstraints {
            $0.height.equalTo(view).multipliedBy(0.035)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .backgroundColor
        setNaviTitle(data!.user.title, color: .fontAndBorderColor)
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        settingButton.tintColor = .fontAndBorderColor
        navigationItem.rightBarButtonItem = settingButton
        
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleImageView.contentMode = .scaleAspectFill
        
        tamagoImageView.contentMode = .scaleAspectFill
        tamagoImageView.image = UIImage(named: data!.image)
        
        nameLabel.setTamagoLabel()
        nameLabel.text = data?.name
        
        statusLabel.textColor = .fontAndBorderColor
        statusLabel.font = .contentsFont
        statusLabel.text = data?.tamagotchiStatus.status
        
        speechLabel.textColor = .fontAndBorderColor
        speechLabel.font = .contentsFont
        speechLabel.numberOfLines = 0
        speechLabel.textAlignment = .center
        speechLabel.text = "asdfadsfdasfdasfadsfadsfsadfaddsfsdfsdfdsfsfadsfadsf"
        
        foodTextField.placeholder = "밥주세용"
        foodTextField.font = .contentsFont
        foodTextField.textAlignment = .center
        
        foodButton.setFeedButton(title: "밥먹기", image: .food!)
        
        waterTextField.placeholder = "물주세용"
        waterTextField.font = .contentsFont
        waterTextField.textAlignment = .center
        
        waterButton.setFeedButton(title: "물먹기", image: .water!)
    }
    
    @objc func settingButtonTapped() {
        print("설정 화면으로 전환")
    }
    
}
