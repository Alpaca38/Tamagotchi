//
//  Extension+UIButton.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

extension UIButton {
    func setFeedButton(title: String, image: UIImage) {
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        clipsToBounds = true
        layer.borderWidth = 1
        layer.cornerRadius = 8
        setTitleColor(.fontAndBorderColor, for: .normal)
        tintColor = .fontAndBorderColor
        titleLabel?.font = .contentsFont
    }
}
