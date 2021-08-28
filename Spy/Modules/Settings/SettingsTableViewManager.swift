//
//  SettingsTableViewManager.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import Foundation

final class SettingsTableViewManager {
    
    enum Cells: String {
        case faq = "FAQ"
        case adsRemove = "Отключить рекламу"
        case restorePurchases = "Восстановить покупки"
    }
    
    static func getCells() -> [Cells] {
        var titlesArray = [Cells]()
        
        // Add some settings cells depends on some conditions:
        
        /// FAQ cell
        titlesArray.append(Cells.faq)
        
        /// Remove ads cell
        if !UserDefaults.standard.bool(forKey: ProductKeys.removeAds.userDefaultsKey) {
            titlesArray.append(Cells.adsRemove)
        }
        
        /// Restore purchases cell
        titlesArray.append(Cells.restorePurchases)
        
        return titlesArray
    }
    
}
