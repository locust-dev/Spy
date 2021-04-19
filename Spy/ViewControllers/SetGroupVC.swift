//
//  SetGroupVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class SetGroupVC: UITableViewController {
    
    var currentGroup: LocationGroup!
    var locationsForRecover: LocationGroup!
    var delegate: SetGroupDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.sizeToFit()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentGroup.locations.count
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel()
        
        view.textColor = .white
        view.font = UIFont(name: "Montserrat", size: 18) ?? .systemFont(ofSize: 22)
        view.numberOfLines = 0
        view.text = title
        view.textAlignment = .center
        
        return view
    }

    
}