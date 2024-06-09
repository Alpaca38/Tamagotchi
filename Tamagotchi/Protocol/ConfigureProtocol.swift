//
//  ConfigureViewControllerProtocol.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

protocol ConfigureProtocol {
    func configureHierachy()
    func configureLayout()
    func configureUI()
}

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .backgroundColor
    }
}
