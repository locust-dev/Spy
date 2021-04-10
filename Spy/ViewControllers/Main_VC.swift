//
//  Main_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class Main_VC: UIViewController {

    @IBOutlet weak var chooseLocation: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet var pickers: [UIPickerView]!
    
    var currentGroup: Group!
    var players = 3
    var timer = 1
    
    private var playersPicker: [Int] = []
    private var timerPicker: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseLocation.layer.cornerRadius = chooseLocation.frame.height / 2
        startButtonOutlet.layer.cornerRadius = startButtonOutlet.frame.height / 2
        
        for player in 3...30 {
            playersPicker.append(player)
        }
        
        for minute in 1...50 {
            timerPicker.append(minute)
        }
        
        for picker in pickers {
            picker.tintColor = .white
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let whoSpyVC = segue.destination as? WhoIsSpy_VC else { return }
        whoSpyVC.currentGroup = currentGroup
        whoSpyVC.countOfPlayers = players
        whoSpyVC.totalTime = timer * 60
    }
    
    @IBAction func begins(_ sender: UIButton) {
        sender.showAnimationWithHaptic()
        currentGroup != nil
            ? performSegue(withIdentifier: "whoIsSpy", sender: nil)
            : alert(title: "Нет локации!", message: "Пожалуйста, выберите локацию!")
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? Container_VC else { return }
        currentGroup = sourceVC.currentGroup
        chooseLocation.setTitle(currentGroup.title, for: .normal)
    }
    
}

extension Main_VC {
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}


extension Main_VC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerView.tag == 1
            ? playersPicker.count
            : timerPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            players = playersPicker[row]
        } else {
            timer = timerPicker[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        pickerView.tag == 1
            ? NSAttributedString(string: String(playersPicker[row]),
                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            : NSAttributedString(string: String(timerPicker[row]),
                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
