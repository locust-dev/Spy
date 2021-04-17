//
//  Container_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

protocol SetGroupDelegate {
    func getChangedGroup(new group: LocationGroup)
}

class Container_VC: UIViewController {

    @IBOutlet weak var chooseOutlet: UIButton!
    
    var currentGroup: LocationGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(currentGroup.title ?? "")"
        navigationController?.navigationBar.tintColor = .white
        chooseOutlet.layer.cornerRadius = chooseOutlet.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableVC = segue.destination as? SetGroup_VC else { return }
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


extension Container_VC: SetGroupDelegate {
    func getChangedGroup(new group: LocationGroup) {
        currentGroup.locations = group.locations.filter{$0 != ""}
        
        if currentGroup.locations.isEmpty {
        alert(title: "Ошибка!", message: "Должна быть выбрана хотя бы одна локация из списка!")
        }
    }
}
