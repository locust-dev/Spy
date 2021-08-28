//
//  SettingsCell.swift
//  SettingsCell
//
//  Created by Илья Тюрин on 28.08.2021.
//

import UIKit

class SettingsCell: UITableViewCell {

    var type: SettingsTableViewManager.Cells!
    
    func configureWith(title: String) {
        textLabel?.text = title
        textLabel?.font = UIFont(name: "Montserrat", size: 20)
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
        
        detailTextLabel?.font = UIFont(name: "Montserrat", size: 15)
        detailTextLabel?.textColor = .white
        detailTextLabel?.numberOfLines = 1
    }

}
