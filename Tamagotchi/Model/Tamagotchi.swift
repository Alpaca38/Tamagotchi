//
//  TamagotchiData.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import Foundation

struct TamagotchiList {
    static let tamagoList: [TamagotchiData] = [
        TamagotchiData(user: User(), name: "따끈따끈 다마고치", image: "1-1", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "방실방실 다마고치", image: "2-1", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "반짝반짝 다마고치", image: "3-1", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: "준비중이에요", image: "noImage", tamagotchiStatus: TamagotchiStatus()),
    ]
}

struct TamagotchiData {
    let user: User
    
    let name: String
    let image: String
    
    var tamagotchiStatus: TamagotchiStatus
    
    var descriptionString: String {
        return "저는 \(name)입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당"
    }
}

struct TamagotchiStatus {
    var level: Int = 0
    var food: Int = 0
    var water: Int = 0
    
    var status: String {
        return "LV\(level) · 밥알 \(food)개 · 물방울 \(water)개"
    }
}

struct User {
    let name: String = "대장"
    
    var title: String {
        return "\(name)님의 다마고치"
    }
}
