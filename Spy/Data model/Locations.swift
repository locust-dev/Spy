//
//  Locations.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

struct Location {
    
    let title: String!
    let group: Groupe!
    
    static func getLocation() -> [Location] {
        [
            Location(title: "Russia", group: .coutries),
            Location(title: "Japan", group: .coutries),
            Location(title: "USA", group: .coutries),
            Location(title: "Golf", group: .sports),
            Location(title: "Stadium", group: .sports),
            Location(title: "Hockey field", group: .sports)
        ]
        
    }
    
}


enum Groupe {
    case coutries
    case sports
}

