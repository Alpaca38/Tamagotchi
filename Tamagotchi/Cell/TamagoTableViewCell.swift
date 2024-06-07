//
//  TamagoTableViewCell.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import UIKit
import SnapKit

class TamagoTableViewCell: UITableViewCell {
    
    let tamagoImageView = UIImageView()
    let nameLabel = CustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    func configure(data: TamagotchiData) {
        tamagoImageView.image = UIImage(named: data.image)
        nameLabel.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TamagoTableViewCell: ConfigureProtocol {
    func configureHierachy() {
        contentView.addSubviews([tamagoImageView, nameLabel])
    }
    
    func configureLayout() {
        tamagoImageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tamagoImageView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configureUI() {
        backgroundColor = .backgroundColor
        selectionStyle = .none
        tamagoImageView.contentMode = .scaleAspectFill
        nameLabel.setTamagoLabel()
    }
    
    
}
