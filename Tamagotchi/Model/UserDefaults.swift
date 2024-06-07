//
//  UserDefaults.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/7/24.
//

import Foundation

enum StartMode: String {
    case select, main
    
}

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case startMode
    }
    
    var startMode: String {
        get { string(forKey: UserDefaultsKeys.startMode.rawValue) ?? StartMode.select.rawValue}
        set { setValue(newValue, forKey: UserDefaultsKeys.startMode.rawValue)}
    }
}
