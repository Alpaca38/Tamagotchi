//
//  Extension+UIViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

extension UIViewController {
    func setNaviTitle(_ title: String, color: UIColor) {
        navigationItem.titleView?.tintColor = color
        navigationItem.title = title
    }
}
