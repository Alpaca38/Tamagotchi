//
//  Extension+UIImageView.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

extension UIImageView {
    func setTamagotchiView(radius: CGFloat, borderWidth: CGFloat) {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.fontAndBorderColor.cgColor
    }
}
