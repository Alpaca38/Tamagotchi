//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/7/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    let settingImageView = UIImageView()
    let titleLabel = UILabel()
    let nameLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierachy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingTableViewCell: ConfigureProtocol {
    func configureHierachy() {
        contentView.addSubviews([settingImageView, titleLabel, nameLabel])
    }
    
    func configureLayout() {
        settingImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(settingImageView.snp.trailing).offset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    
    func configureUI() {
        backgroundColor = .backgroundColor
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        
        settingImageView.tintColor = .fontAndBorderColor
        
        titleLabel.font = .contentsFont
        
        nameLabel.font = .contentsFont
        nameLabel.textColor = .fontAndBorderColor.withAlphaComponent(0.5)
    }
    
    func configure(index: Int, userName: String?) {
        let data = SettingOptions.allCases[index]
        settingImageView.image = data.image
        titleLabel.text = data.text
        if index == 0 {
            nameLabel.text = userName
        }
    }
    
}
