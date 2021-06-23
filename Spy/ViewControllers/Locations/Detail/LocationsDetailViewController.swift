//
//  SetGroupViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class LocationsDetailViewController: UITableViewController {
    
    var currentGroup: LocationGroup!
    var locationsForRecover: LocationGroup!
    var delegate: SetGroupDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Spy_Background"))
        tableView.contentInset.top = 20
        tableView.contentInset.bottom = 100
        tableView.allowsMultipleSelection = true
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
        
        if let selectedRows = tableView.indexPathsForSelectedRows, selectedRows.contains(indexPath) {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        cell.textLabel?.text = locationsForRecover.locations[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Montserrat", size: 20)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
        currentGroup.locations[indexPath.row] = ""
        delegate.getChangedGroup(new: currentGroup)
        setHaptic(style: .medium)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .checkmark
        currentGroup.locations[indexPath.row] = locationsForRecover.locations[indexPath.row]
        delegate.getChangedGroup(new: currentGroup)
        setHaptic(style: .medium)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Montserrat", size: 18)
        view.numberOfLines = 0
        view.text = title
        view.textAlignment = .center
        return view
    }
    
}
