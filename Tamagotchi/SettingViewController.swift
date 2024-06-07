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

class SettingViewController: UIViewController {
    
    let tableView = UITableView()
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierachy()
        configureLayout()
        configureUI()
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
        view.backgroundColor = .backgroundColor
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
        cell.configure(index: indexPath.row, userName: user?.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UserChangeViewController()
            vc.user = user
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = SelectViewController()
            vc.user = user
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
            print("데이터 초기화")
            let vc = SelectViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            
            present(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "아냐!", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}
