//
//  ContainerForTableViewVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

protocol SetGroupDelegate {
    func getChangedGroup(new group: LocationGroup)
}

class ContainerForLocationDetail: UIViewController {
    
    @IBOutlet weak var chooseOutlet: UIButton!
    
    var currentGroup: LocationGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(currentGroup.title)"
        navigationController?.navigationBar.tintColor = .white
        cornerAndShadows(chooseOutlet)
        setBackgroundImage(with: "backForButtons", for: chooseOutlet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableVC = segue.destination as? LocationsDetailViewController else { return }
        tableVC.delegate = self
        tableVC.currentGroup = currentGroup
        tableVC.locationsForRecover = currentGroup
    }
    
    @IBAction func chooseButton() {
        if currentGroup.locations.isEmpty {
            alert(title: "Ошибка!", message: "Должна быть выбрана хотя бы одна локация из списка!")
        } else {
            performSegue(withIdentifier: "backFromLocations", sender: nil)
        }
    }
    
}

// MARK: - Set group delegate
extension ContainerForLocationDetail: SetGroupDelegate {
    func getChangedGroup(new group: LocationGroup) {
        currentGroup.locations = group.locations.filter{$0 != ""}
        if currentGroup.locations.isEmpty {
            alert(title: "Ошибка!", message: "Должна быть выбрана хотя бы одна локация из списка!")
        }
    }
}
