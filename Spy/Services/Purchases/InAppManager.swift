//
//  InAppManager.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import StoreKit

final class InAppManager: NSObject {
    
    // MARK: - Properties
    
    static let shared = InAppManager()
    var product: SKProduct?
    
    
    // MARK: - Init
    
    private override init() {}
    
    
    // MARK: - Public methods
    
    func setupPurchases(completion: @escaping(Bool) -> Void) {
        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            completion(true)
            return
        }
        completion(false)
    }
    
    func getProducts() {
        let identifiers: Set = ["voxx.spy.removeads"]
        let request = SKProductsRequest(productIdentifiers: identifiers)
        request.delegate = self
        request.start()
    }
    
    func getStringPrice() -> String? {
        guard let product = product else { return nil }
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = product.priceLocale
        return nf.string(from: product.price)
    }
    
}


extension InAppManager: SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let myProduct = response.products.first {
            product = myProduct
            print(myProduct.productIdentifier)
            print(myProduct.price)
            print(myProduct.localizedTitle)
            print(myProduct.localizedDescription)
            print(myProduct.priceLocale)
        }
    }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        
    }
    
    
}
