//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit
import SnapKit

class SelectViewController: UIViewController {
    
    let tableView = UITableView()
    
    var list = TamagotchiList.tamagoList {
        didSet {
            tableView.reloadData()
        }
    }
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureLayout()
        configureUI()
        
        UserDefaults.standard.startMode = StartMode.select.rawValue
    }

}

extension SelectViewController: ConfigureProtocol {
    func configureHierachy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.backgroundColor
        if user != nil {
            setNaviTitle("다마고치 변경하기", color: .fontAndBorderColor)
        } else {
            setNaviTitle("다마고치 선택하기", color: .black)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TamagoTableViewCell.self, forCellReuseIdentifier: TamagoTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TamagoTableViewCell.identifier, for: indexPath) as! TamagoTableViewCell
        let data = list[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        if data.name != Tamagotchi.others.name {
            let vc = PopupViewController()
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.data = data
            vc.user = user
            present(vc, animated: true)
        } else {
            showAlert(title: "준비중입니다.", message: nil)
        }
    }
    
    
}
