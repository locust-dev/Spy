//
//  SettingsViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import UIKit
import StoreKit

class SettingsViewController: UITableViewController {

    // MARK: - Properties
    
    private var cells = SettingsTableViewManager.getCells()
    private var isIndicatorDraw = false
    
    private lazy var grayView: UIView = {
        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .gray
        grayView.alpha = 0.5
        grayView.layer.cornerRadius = 25
        return grayView
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.startAnimating()
        return activity
    }()
    
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Init
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: Private methods
    
    private func drawActivity() {
        isIndicatorDraw = true
    
        view.addSubview(grayView)
        view.addSubview(activity)
        
        NSLayoutConstraint.activate([
            
            grayView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            grayView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            grayView.widthAnchor.constraint(equalToConstant: activity.frame.width + 100),
            grayView.heightAnchor.constraint(equalToConstant: activity.frame.width + 100),
            
            activity.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    private func stopActivity() {
        activity.removeFromSuperview()
        grayView.removeFromSuperview()
        isIndicatorDraw = false
    }
    
    private func setupUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: InAppManager.NotiKeys.loadedNoti), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(purchasesCompleted), name: NSNotification.Name(rawValue: InAppManager.NotiKeys.completedNoti), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nothingToRestore), name: NSNotification.Name(rawValue: InAppManager.NotiKeys.nothingToRestoreNoti), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fail), name: NSNotification.Name(rawValue: InAppManager.NotiKeys.failNoti), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeMind), name: NSNotification.Name(rawValue: InAppManager.NotiKeys.changeMindNoti), object: nil)
        
        title = "Настройки"
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
    @objc private func purchasesCompleted() {
        DispatchQueue.main.async { [weak self] in
            self?.cells = SettingsTableViewManager.getCells()
            self?.tableView?.reloadData()
            self?.stopActivity()
            self?.alert(title: "Поздравляем!", message: "Вы успешно отключили рекламу. Удачной игры!")
        }
    }
    
    @objc private func nothingToRestore() {
        DispatchQueue.main.async { [weak self] in
            self?.stopActivity()
            self?.alert(title: "Похоже, у вас нет ранее совершенных покупок или же все покупки уже были восстановлены.", message: "В случае ошибки, пожалуйста, свяжитесь по данному электронному адресу для решения проблемы: spyfall.helper@gmail.com")
        }
    }
    
    @objc private func fail() {
        DispatchQueue.main.async { [weak self] in
            self?.stopActivity()
            self?.alert(title: "Похоже, что-то пошло не так. Попробуйте позже.", message: "Если вам надоело пробовать позже, пожалуйста, свяжитесь по данному электронному адресу для решения проблемы: spyfall.helper@gmail.com")
        }
    }
    
    @objc private func changeMind() {
        DispatchQueue.main.async { [weak self] in
            self?.stopActivity()
        }
    }
}


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
        
//        if cellType == .adsRemove {
//            cell.detailTextLabel?.text = InAppManager.shared.getStringPrice()
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? SettingsCell else { return }
        
        switch cell.type {
            
        case .faq:
            performSegue(withIdentifier: "toFaq", sender: nil)
            
//        case .adsRemove:
//            InAppManager.shared.purchaseRemoveAds()
//            
//            if !isIndicatorDraw {
//                drawActivity()
//            }
            
        case .restorePurchases:
            InAppManager.shared.restoreCompletedTransactions()
            
            if !isIndicatorDraw {
                drawActivity()
            }
            
        case .none:
            break
        }
    }
    
}
