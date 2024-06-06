//
//  CustomLabel.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit

class CustomLabel: UILabel {
    private var padding = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
    
    func setTamagoLabel() {
        backgroundColor = UIColor.backgroundColor
        textColor = UIColor.fontAndBorderColor
        textAlignment = .center
        font = UIFont.titleFont
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.fontAndBorderColor.cgColor
    }
}
