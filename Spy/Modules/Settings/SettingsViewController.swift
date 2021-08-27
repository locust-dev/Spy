//
//  SettingsViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 27.08.2021.
//

import UIKit

class SettingsViewController: UITableViewController {

    private let categories = ["FAQ", "Отключить рекламу"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Montserrat", size: 20)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
    
}
