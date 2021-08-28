//
//  SettingsViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import UIKit
import StoreKit

class SettingsViewController: UITableViewController {

    private let cells = SettingsTableViewManager.getCells()
    // var ads: SKProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
//    private func removeAds() {
//        guard let ads = ads else {
//            print("returned")
//            return
//        }
//
//        if SKPaymentQueue.canMakePayments() {
//            let payment = SKPayment(product: ads)
//            SKPaymentQueue.default().add(self)
//            SKPaymentQueue.default().add(payment)
//        }
//    }
    
    private func setupUI() {
        title = "Настройки"
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
        navigationController?.navigationBar.tintColor = .white
    }
    
}


//// MARK: - SK protocols
//extension SettingsViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
//
//    // MARK: - Public methods
//
//    func fetchProducts() {
//        let request = SKProductsRequest(productIdentifiers: ["voxx.spy.removeads"])
//        request.delegate = self
//        request.start()
//    }
//
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        print("producted")
//        if let product = response.products.first {
//            print("some")
//            ads = product
//            print(product.productIdentifier)
//            print(product.price)
//            print(product.localizedTitle)
//            print(product.localizedDescription)
//        }
//    }
//
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        for transaction in transactions {
//            switch transaction.transactionState {
//
//            case .purchasing:
//                // nothing
//                print("purch")
//                break
//
//            case .purchased, .restored:
//                // unlock item
//
//                UserDefaults.standard.set(true, forKey: "ads_removed")
//                print("purc1")
//                SKPaymentQueue.default().finishTransaction(transaction)
//                SKPaymentQueue.default().remove(self)
//
//            case .failed, .deferred:
//                // failed
//                print("purch2")
//                SKPaymentQueue.default().finishTransaction(transaction)
//                SKPaymentQueue.default().remove(self)
//
//            @unknown default:
//                print("purch3")
//                SKPaymentQueue.default().finishTransaction(transaction)
//                SKPaymentQueue.default().remove(self)
//                fatalError("Something went wrong with removing ads.")
//            }
//        }
//
//    }
//
//}
//
//
// MARK: - TableView configure
extension SettingsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
        
        let cellType = cells[indexPath.row]
        cell.configureWith(title: cellType.rawValue)
        cell.type = cellType
        
        if cellType == .adsRemove {
            cell.detailTextLabel?.text = InAppManager.shared.getStringPrice()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SettingsCell else { return }
        
        switch cell.type {
            
        case .faq:
            performSegue(withIdentifier: "toFaq", sender: nil)
            
        case .adsRemove:
            InAppManager.shared.getProducts()
            
        case .none:
            break
        }
    }
    
}
