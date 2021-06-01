//
//  LocationGroup.swift.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//


struct LocationGroup {
    let title: String
    var locations: [String]
    
    static func getDefaultGroup() -> LocationGroup {
        LocationGroup(title: Groupes.allLocations.rawValue, locations: Groupes.allLocations.definition)
    }
    
    static func getGroupes() -> [LocationGroup] {
        [
            LocationGroup(title: Groupes.allLocations.rawValue, locations: Groupes.allLocations.definition),
            LocationGroup(title: Groupes.coutries.rawValue, locations: Groupes.coutries.definition),
            LocationGroup(title: Groupes.sports.rawValue, locations: Groupes.sports.definition),
            LocationGroup(title: Groupes.travels.rawValue, locations: Groupes.travels.definition),
            LocationGroup(title: Groupes.culture.rawValue, locations: Groupes.culture.definition),
            LocationGroup(title: Groupes.child.rawValue, locations: Groupes.child.definition),
            LocationGroup(title: Groupes.timeMachine.rawValue, locations: Groupes.timeMachine.definition),
            LocationGroup(title: Groupes.adult.rawValue, locations: Groupes.adult.definition)
        ]
        
    }
}

