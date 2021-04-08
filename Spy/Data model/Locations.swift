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
            Group(title: Groupes.travels.rawValue, locations: Groupes.travels.definition),
            Group(title: Groupes.culture.rawValue, locations: Groupes.culture.definition),
            Group(title: Groupes.child.rawValue, locations: Groupes.child.definition),
            Group(title: Groupes.timeMachine.rawValue, locations: Groupes.timeMachine.definition)
            
        ]
        
    }
}

enum Groupes: String {
    case coutries = "Страны"
    case sports = "Спорт"
    case travels = "Путешествия"
    case culture = "Культура"
    case child = "Дети"
    case timeMachine = "Машина времени"
    
    var definition: [String] {
        switch self {
        case .coutries:
            return ["Россия", "Беларусь", "Япония", "США", "Украина"]
        case .sports:
            return ["Спорт площадка", "Поле для гольфа", "Стадион", "Серфинг", "Хоккейная арена"]
        case .travels:
            return ["Самолет", "Корабль", "Подводная лодка", "Автобус", "Трамвай"]
        case .culture:
            return ["Галерея", "Музей", "Цирк", "Театр", "Планетарий"]
        case .child:
            return ["Детская площадка", "Школа", "Детский сад", "Зоопарк", "Каток"]
        case .timeMachine:
            return ["Древняя греция", "Город будущего", "1980-е", "1990-е", "Вторая мировая"]
        }
    }
}


