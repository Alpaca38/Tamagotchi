//
//  TamagotchiData.swift
//  Tamagotchi
//
//  Created by 조규연 on 6/6/24.
//

import Foundation

enum Tamagotchi {
    case first, second, third, others
    
    var name: String {
        switch self {
            
        case .first:
            "따끈따끈 다마고치"
        case .second:
            "방실방실 다마고치"
        case .third:
            "반짝반짝 다마고치"
        case .others:
            "준비중이에요"
        }
    }
    
    var imageList: [String] {
        switch self {
            
        case .first:
            return ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9"]
        case .second:
            return ["2-1", "2-2", "2-3", "2-4", "2-5", "2-6", "2-7", "2-8", "2-9"]
        case .third:
            return ["3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "3-9"]
        case .others:
            return ["noImage"]
        }
    }
    
    func image(for level: Int) -> String {
        guard level >= 1 && level <= imageList.count else {
            return imageList[8]
        }
        return imageList[level - 1]
    }
}
struct TamagotchiList {
    static let tamagoList: [TamagotchiData] = [
        TamagotchiData(user: User(), name: Tamagotchi.first.name, image: Tamagotchi.first.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.second.name, image: Tamagotchi.second.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.third.name, image: Tamagotchi.third.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
        TamagotchiData(user: User(), name: Tamagotchi.others.name, image: Tamagotchi.others.imageList[0], tamagotchiStatus: TamagotchiStatus()),
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
