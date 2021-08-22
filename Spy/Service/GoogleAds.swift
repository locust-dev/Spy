//
//  GoogleAds.swift
//  Spy
//
//  Created by Илья Тюрин on 21.08.2021.
//

import GoogleMobileAds

class GoogleAds {
    
    // MARK: - Locals
    
    private enum Locals {
        
        enum adBlocks {
            
            static let id1 = "ca-app-pub-8123415297019784/4985798738"
            
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
        GADInterstitialAd.load(withAdUnitID: Locals.adBlocks.id1, request: request) { ad, error in
            
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            
            completion(ad)
            print("ad was loaded from server")            
        }
    }
    
    func showInterstitial(ad: GADInterstitialAd?, viewController: UIViewController, completion: () -> Void) {
        if let ad = ad, adCount % 2 == 0 {
            ad.present(fromRootViewController: viewController)
        } else {
            print("Ad wasn't ready")
            completion()
        }
    }
    
}
