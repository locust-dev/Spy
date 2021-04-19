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
        tableView.contentInset.bottom = 100
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
        let selectionColor = UIView()
        
        cell.textLabel?.text = currentGroup.locations[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Montserrat", size: 22) ?? .systemFont(ofSize: 22)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 0
        selectionColor.backgroundColor = UIColor(white: 1, alpha: 0.5)
        cell.selectedBackgroundView = selectionColor

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
