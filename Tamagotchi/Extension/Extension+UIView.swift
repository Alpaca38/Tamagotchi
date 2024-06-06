//
//  Extension+UIView.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.fontAndBorderColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
