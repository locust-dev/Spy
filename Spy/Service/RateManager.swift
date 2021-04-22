//
//  RateManager.swift
//  Spy
//
//  Created by Илья Тюрин on 22.04.2021.
//

import UIKit
import StoreKit

class RateManager {
    
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count < 11 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
        }
    }
    
    class func showRatesController() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                SKStoreReviewController.requestReview()
            })
        }
    }
}
