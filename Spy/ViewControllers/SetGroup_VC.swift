//
//  SetGroup_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class SetGroup_VC: UITableViewController {
    
    var currentGroup: Group!
    var locationsForRecover: Group!
    var delegate: SetGroupDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = currentGroup.locations[indexPath.row]
        content.textProperties.font = UIFont(name: "Montserrat", size: 22) ?? .systemFont(ofSize: 22)
        content.textProperties.color = .white
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .checkmark {
            currentGroup.locations[indexPath.row] = ""
            cell.accessoryType = .none
        } else {
            currentGroup.locations[indexPath.row] = locationsForRecover.locations[indexPath.row]
            cell.accessoryType = .checkmark
        }
        delegate.getChangedGroup(new: currentGroup)
    }
    
    
}
