//
//  SetGroup_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class SetGroup_VC: UITableViewController {

    var currentGroup: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        self.tableView.contentInset.top = 20
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup.locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath) as! LocationCellTable

        cell.textLabel?.text = currentGroup.locations[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Montserrat", size: 22)
        cell.textLabel?.textColor = .white
        cell.accessoryView?.tintColor = .white
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.text = "rrr"
    }
}
