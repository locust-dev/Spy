//
//  AddPlayersLocationsVC.swift
//  Spy
//
//  Created by Илья Тюрин on 18.04.2021.
//

import UIKit

class AddPlayersLocationsVC: UIViewController {

    @IBOutlet weak var okButtonOutlet: UIButton!
    @IBOutlet weak var addLocationTF: UITextField!

    var currentGroup: LocationGroup!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationItem.hidesBackButton = true

        setBackgroundImage(with: "Spy_Background", for: view)
        setCornerRadiusToCircle(okButtonOutlet)
        addShadows(addLocationTF, okButtonOutlet)
        addLocationTF.layer.cornerRadius = addLocationTF.frame.height / 2
    }

    @IBAction func okButtonPressed(_ sender: Any) {
        if let text = addLocationTF.text {
            currentGroup.addedLocations.append(text)
        }
    }


}

extension AddPlayersLocationsVC: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
