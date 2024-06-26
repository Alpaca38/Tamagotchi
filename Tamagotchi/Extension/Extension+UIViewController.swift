//
//  Extension+UIViewController.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

extension UIViewController {
    func setNaviTitle(_ title: String, color: UIColor) {
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: color]
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
