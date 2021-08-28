//
//  RateManager.swift
//  Spy
//
//  Created by Илья Тюрин on 22.04.2021.
//

import StoreKit

final class RateManager {
    
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
                if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    if #available(iOS 14.0, *) {
                        SKStoreReviewController.requestReview(in: windowScene)
                    } else {
                        SKStoreReviewController.requestReview()
                    }
                }
            })
        }
    }
}
