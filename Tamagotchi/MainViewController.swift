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
    
    var data: TamagotchiData? = UserDefaults.standard.tamagoData {
        didSet {
            changeTamagoState()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
        
        UserDefaults.standard.startMode = StartMode.main.rawValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let randomIndex = Int.random(in: 0...data!.mainSpeech.count - 1)
        speechLabel.text = data?.mainSpeech[randomIndex]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        foodTextField.underlined()
        waterTextField.underlined()
    }
}

extension MainViewController {
    
    func getLevel() {
        let exp = (data!.tamagotchiStatus.food / 5) + (data!.tamagotchiStatus.water / 2)
        var level: Int
        switch exp {
        case 0...19:
            level = 1
        case 20...29:
            level = 2
        case 30...39:
            level = 3
        case 40...49:
            level = 4
        case 50...59:
            level = 5
        case 60...69:
            level = 6
        case 70...79:
            level = 7
        case 80...89:
            level = 8
        case 90...99:
            level = 9
        default:
            level = 10
        }
        data?.tamagotchiStatus.level = level
    }
    
    func changeTamagoState() {
        guard let data else { return }
        
        statusLabel.text = data.tamagotchiStatus.status
        
        let tamagotchiImage: UIImage?
        
        switch data.name {
        case Tamagotchi.first.name:
            tamagotchiImage = UIImage(named: Tamagotchi.first.image(for: data.tamagotchiStatus.level))
        case Tamagotchi.second.name:
            tamagotchiImage = UIImage(named: Tamagotchi.second.image(for: data.tamagotchiStatus.level))
        case Tamagotchi.third.name:
            tamagotchiImage = UIImage(named: Tamagotchi.third.image(for: data.tamagotchiStatus.level))
        default:
            return
        }
        
        tamagoImageView.image = tamagotchiImage
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
        navigationItem.backButtonDisplayMode = .minimal
        
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
        
        foodTextField.placeholder = "밥주세용"
        foodTextField.font = .contentsFont
        foodTextField.textAlignment = .center
        
        foodButton.setFeedButton(title: "밥먹기", image: .food!)
        foodButton.addTarget(self, action: #selector(foodButtonTapped), for: .touchUpInside)
        
        waterTextField.placeholder = "물주세용"
        waterTextField.font = .contentsFont
        waterTextField.textAlignment = .center
        
        waterButton.setFeedButton(title: "물먹기", image: .water!)
        waterButton.addTarget(self, action: #selector(waterButtonTapped), for: .touchUpInside)
    }
}

extension MainViewController {
    
    @objc func settingButtonTapped() {
        let vc = SettingViewController()
        vc.user = data?.user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func foodButtonTapped() {
        let text = foodTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let amount = Int(text!), amount < 100 {
            data?.tamagotchiStatus.food += amount
        } else if text?.isEmpty == true {
            data?.tamagotchiStatus.food += 1
        } else {
            showAlert(title: "올바르지 않은 값입니다.", message: "100개 이상 먹을 수 없어요")
        }
        
        foodTextField.text = nil
        
        let randomIndex = Int.random(in: 0...data!.foodSpeech.count - 1)
        speechLabel.text = data?.foodSpeech[randomIndex]
        
        getLevel()
    }
    
    @objc func waterButtonTapped() {
        let text = waterTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let amount = Int(text!), amount < 50 {
            data?.tamagotchiStatus.water += amount
        } else if text?.isEmpty == true {
            data?.tamagotchiStatus.water += 1
        } else {
            showAlert(title: "올바르지 않은 값입니다.", message: "50개 이상 먹을 수 없어요")
        }
        
        waterTextField.text = nil
        
        let randomIndex = Int.random(in: 0...data!.waterSpeech.count - 1)
        speechLabel.text = data?.waterSpeech[randomIndex]
        
        getLevel()
    }
}
