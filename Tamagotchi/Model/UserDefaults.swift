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
        case tamagoData
    }
    
    var startMode: String {
        get { string(forKey: UserDefaultsKeys.startMode.rawValue) ?? StartMode.select.rawValue}
        set { setValue(newValue, forKey: UserDefaultsKeys.startMode.rawValue)}
    }
    
    var tamagoData: TamagotchiData {
        get {
            if let savedData = UserDefaults.standard.object(forKey: UserDefaultsKeys.tamagoData.rawValue) as? Data {
                    let decoder = JSONDecoder()
                    if let lodedObejct = try? decoder.decode(TamagotchiData.self, from: savedData) {
                        return lodedObejct
                    }
                }
            return TamagotchiData(user: User(), name: Tamagotchi.first.name, image: Tamagotchi.first.imageList[0], tamagotchiStatus: TamagotchiStatus())
            }
            set {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(newValue) {
                    UserDefaults.standard.setValue(encoded, forKey: UserDefaultsKeys.tamagoData.rawValue)
                }
            }
    }
}
