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
    var user: User
    
    let name: String
    let image: String
    
    var tamagotchiStatus: TamagotchiStatus
    
    var descriptionString: String {
        return "저는 \(name)입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당"
    }
    
    var mainSpeech: [String] {
        return ["좋은 하루에요, \(user.name)님", "\(user.name)님 오늘 깃허브 푸시 하셨어영?", "복습 아직 안하셨다구요? 지금 잠이 오세여? \(user.name)님??", "테이블뷰컨트롤러와 뷰컨트롤러는 어떤 차이가 있을까요?"]
    }
    
    var foodSpeech: [String] {
        return ["\(user.name)님 물주세요", "밥과 물을 잘 먹었더니 레벨업 했어요 고마워요 \(user.name)님", "토할꺼 같아요"]
    }
    
    var waterSpeech: [String] {
        return ["\(user.name)님 밥주세요", "밥과 물을 잘 먹었더니 레벨업 했어요 고마워요 \(user.name)님", "토할꺼 같아요"]
    }
}

struct TamagotchiStatus {
    var level: Int = 1
    var food: Int = 0
    var water: Int = 0
    
    var status: String {
        return "LV\(level) · 밥알 \(food)개 · 물방울 \(water)개"
    }
}

struct User {
    var name: String = "대장"
    
    var title: String {
        return "\(name)님의 다마고치"
    }
}
