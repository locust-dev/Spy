//
//  FAQ_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 17.04.2021.
//

import UIKit

class FAQ_VC: UITableViewController {

    let faq = Faq()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return faq.titles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath)
        let info = faq.definition[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        content.text = info
        content.textProperties.font = UIFont(name: "Montserrat", size: 20) ?? .systemFont(ofSize: 22)
        content.textProperties.color = .white
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel()
        let title = faq.titles[section]
        
        view.textColor = .white
        view.font = UIFont(name: "Montserrat", size: 22) ?? .systemFont(ofSize: 22)
        view.numberOfLines = 0
        view.text = title
        
        return view
    }
    
    

}
