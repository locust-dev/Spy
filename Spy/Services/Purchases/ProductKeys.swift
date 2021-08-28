//
//  ProductKeys.swift
//  ProductKeys
//
//  Created by Илья Тюрин on 28.08.2021.
//

enum ProductKeys {
    
    case removeAds
    
    var identifier: String {
        switch self {
        case .removeAds: return "voxx.spy.removeads"
        }
    }
    
    var userDefaultsKey: String {
        switch self {
        case .removeAds: return "remove_ads"
        }
    }
    
}
