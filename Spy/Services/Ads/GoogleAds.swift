//
//  GoogleAds.swift
//  Spy
//
//  Created by Илья Тюрин on 21.08.2021.
//

import GoogleMobileAds

final class GoogleAds {
    
    // MARK: - Locals
    
    private enum Locals {
        
        enum adBlocks {
            
            static let fullscreenBlock = "ca-app-pub-7412585754420452/2827491358"
            
        }
        
    }
    
    
    // MARK: - Properties
    
    static let shared = GoogleAds()
    var adCount = 0
    
    
    // MARK: - Init
    
    private init() {}
    
    
    // MARK: - Methods
    
    func createAdsRequest(completion: @escaping (GADInterstitialAd?) -> Void) {
        
        let request = GADRequest()
        let id = Locals.adBlocks.fullscreenBlock
        
        GADInterstitialAd.load(withAdUnitID: id, request: request) { ad, error in
            
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            
            completion(ad)
            print("ad has been loaded from server")
        }
        
    }
    
    func showInterstitial(ad: GADInterstitialAd?, viewController: UIViewController, completion: () -> Void) {
        
        if let ad = ad, adCount % 2 == 0 {
            ad.present(fromRootViewController: viewController)
        } else {
            completion()
        }
        
    }
    
}
