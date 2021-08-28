//
//  InAppManager.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import StoreKit

final class InAppManager: NSObject {
    
    // MARK: - NotiKeys
    
    enum NotiKeys {
        static let loadedNoti = "createdProducts"
        static let completedNoti = "removeAdsCompleted"
        static let nothingToRestoreNoti = "nothingToRestore"
        static let failNoti = "fail"
        static let changeMindNoti = "changeMind"
    }

    
    // MARK: - Properties
    
    static let shared = InAppManager()
    private let paymentQueue = SKPaymentQueue.default()
    private var removeAdsProduct: SKProduct?
    
    
    // MARK: - Init
    
    private override init() {}
    
    
    // MARK: - Public methods
    
    func setupPurchases(completion: @escaping(Bool) -> Void) {
        if SKPaymentQueue.canMakePayments() {
            paymentQueue.add(self)
            completion(true)
            return
        }
        completion(false)
    }
    
    func purchaseRemoveAds() {
        guard let product = removeAdsProduct else { return }
        let payment = SKPayment(product: product)
        paymentQueue.add(payment)
    }
    
    func getProducts() {
        let identifiers: Set = [ProductKeys.removeAds.identifier]
        let request = SKProductsRequest(productIdentifiers: identifiers)
        request.delegate = self
        request.start()
    }
    
    func getStringPrice() -> String? {
        guard let product = removeAdsProduct else { return nil }
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = .current
        return nf.string(from: product.price)
    }
    
    func restoreCompletedTransactions() {
        paymentQueue.restoreCompletedTransactions()
    }
    
    
    // MARK: - Private methods
    
    private func createPostNoti(_ name: String) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    private func fail(transaction: SKPaymentTransaction) {
        if let error = transaction.error as NSError? {
            if error.code != SKError.paymentCancelled.rawValue {
                print(transaction.error?.localizedDescription ?? "")
                createPostNoti(NotiKeys.changeMindNoti)
            }
            createPostNoti(NotiKeys.changeMindNoti)
        }
    }
    
    private func compteled(transaction: SKPaymentTransaction) {
        adsRemoveCompleted()
    }
    
    private func restored(transaction: SKPaymentTransaction) {
        !UserDefaults.standard.bool(forKey: ProductKeys.removeAds.userDefaultsKey)
            ? adsRemoveCompleted()
            : createPostNoti(NotiKeys.nothingToRestoreNoti)
    }
    
    private func adsRemoveCompleted() {
        UserDefaults.standard.set(true, forKey: ProductKeys.removeAds.userDefaultsKey)
        createPostNoti(NotiKeys.completedNoti)
    }
}


// MARK: - Configure transactions
extension InAppManager: SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if paymentQueue.transactions.isEmpty {
            createPostNoti(NotiKeys.nothingToRestoreNoti)
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        createPostNoti(NotiKeys.nothingToRestoreNoti)
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            removeAdsProduct = product
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: InAppManager.NotiKeys.loadedNoti), object: nil)
        }
    }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
                
            case .deferred:
                print("deffered")
                break
                
            case .purchasing:
                print("purchasing")
                break
                
            case .failed:
                fail(transaction: transaction)
                paymentQueue.finishTransaction(transaction)
                
            case .purchased:
                compteled(transaction: transaction)
                paymentQueue.finishTransaction(transaction)
                
            case .restored:
                restored(transaction: transaction)
                paymentQueue.finishTransaction(transaction)
                
            @unknown default:
                print("unknown")
                break
                
            }
        }
    }
    
}
