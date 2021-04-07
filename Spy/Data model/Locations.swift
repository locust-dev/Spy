//
//  Locations.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//


struct Group {
    let title: String!
    let locations: [String]!
    
    static func getGroupes() -> [Group] {
        [
            Group(title: Groupes.coutries.rawValue, locations: Groupes.coutries.definition),
            Group(title: Groupes.sports.rawValue, locations: Groupes.sports.definition),
            Group(title: Groupes.travels.rawValue, locations: Groupes.travels.definition)
        ]
        
    }
}

enum Groupes: String {
    case coutries = "Страны"
    case sports = "Спорт"
    case travels = "Путешествия"
    
    var definition: [String] {
        switch self {
        case .coutries:
            return ["Россия", "Беларусь", "Япония", "США", "Украина"]
        case .sports:
            return ["Спорт площадка", "Поле для гольфа", "Стадион", "Серфинг", "Хоккейная арена"]
        case .travels:
            return ["Самолет", "Корабль", "Подводная лодка", "Автобус", "Трамвай"]
        }
    }
}


