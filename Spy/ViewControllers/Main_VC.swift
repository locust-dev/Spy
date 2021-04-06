//
//  Main_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class Main_VC: UIViewController {

    @IBOutlet var locationsButtons: [UIButton]!
    @IBOutlet weak var countOfPlayers: UITextField!
    
    var locations = Location.getLocation()
    var location: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (button, location) in zip(locationsButtons, locations) {
            button.setTitle(location.title, for: .normal)
        }
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let whoSpyVC = segue.destination as? WhoIsSpy_VC else { return }
        whoSpyVC.location = location
        whoSpyVC.countOfPlayers = Int(countOfPlayers.text ?? "0")
    }
    
    @IBAction func buttonsLocation(_ sender: UIButton) {
        locationsButtons.forEach { (btn) in
            btn.backgroundColor = .darkGray
        }
        
        sender.backgroundColor = .lightGray
        location = sender.title(for: .normal)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {}
    
}

