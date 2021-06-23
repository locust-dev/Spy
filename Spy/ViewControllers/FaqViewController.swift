//
//  FaqViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 17.04.2021.
//

import UIKit

class FaqViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        InfoManager.shared.titlesForFAQ.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath)
        let info = InfoManager.shared.definitionsForFAQ[indexPath.section]
        
        cell.textLabel?.text = info
        cell.textLabel?.font = UIFont(name: "Montserrat", size: 20) ?? .systemFont(ofSize: 22)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel()
        let title = InfoManager.shared.titlesForFAQ[section]
        
        view.textColor = .white
        view.font = UIFont(name: "Montserrat", size: 22) ?? .systemFont(ofSize: 22)
        view.numberOfLines = 0
        view.text = title
        
        return view
    }

}
