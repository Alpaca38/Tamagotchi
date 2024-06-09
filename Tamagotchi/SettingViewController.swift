//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/7/24.
//

import UIKit
import SnapKit

enum SettingOptions: Int, CaseIterable {
    case name, tamagotchi, reset
    
    var image: UIImage? {
        switch self {
            
        case .name:
                .pencil
        case .tamagotchi:
                .moon
        case .reset:
                .reset
        }
    }
    
    var text: String {
        switch self {
            
        case .name:
            "내이름 설정하기"
        case .tamagotchi:
            "다마고치 변경하기"
        case .reset:
            "데이터 초기화"
        }
    }
    
}

class SettingViewController: BaseViewController {
    
    let tableView = UITableView()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension SettingViewController: ConfigureProtocol {
    func configureHierachy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        setNaviTitle("설정", color: .fontAndBorderColor)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.backgroundColor = .backgroundColor
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.configure(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UserChangeViewController()
            vc.data = data
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = SelectViewController()
            vc.data = data
            var changedList = UserDefaults.standard.tamagoList
            for i in 0...2 {
                changedList[i].tamagotchiStatus = data!.tamagotchiStatus
                changedList[i].user = data!.user
                changedList[i].image = Tamagotchi.allCases[i].image(for: data!.tamagotchiStatus.level)
            }
            UserDefaults.standard.tamagoList = changedList
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            resetAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?")
        default:
            return
        }
    }
}

extension SettingViewController {
    func resetAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "웅", style: .default) { [weak self] _ in
            guard let self else { return }
            UserDefaults.standard.tamagoList = TamagotchiList.tamagoList
            UserDefaults.standard.tamagoData = nil
            UserDefaults.standard.startMode = StartMode.select.rawValue
            let vc = SelectViewController()
            let navi = UINavigationController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            navi.modalTransitionStyle = .crossDissolve
            
            present(navi, animated: true)
        }
        let cancel = UIAlertAction(title: "아냐!", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}
