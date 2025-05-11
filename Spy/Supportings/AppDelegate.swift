//
//  AppDelegate.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit
//import GoogleMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        RateManager.incrementCount()
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        InAppManager.shared.setupPurchases { success in
            if success {
                InAppManager.shared.getProducts()
            }
        }
        
//        if !UserDefaults.standard.bool(forKey: ProductKeys.removeAds.userDefaultsKey) {
//            UserDefaults.standard.set(false, forKey: ProductKeys.removeAds.userDefaultsKey)
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

