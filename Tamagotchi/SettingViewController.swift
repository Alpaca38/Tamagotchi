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
            print("이름 변경 화면으로 전환")
        case 1:
            print("다마고치 선택 화면을 전환")
        case 2:
            print("데이터 초기화 할지 물어보는 경고창")
        default:
            return
        }
    }
}
