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
        if count < 10 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                SKStoreReviewController.requestReview()
            }
        }
    }
}
