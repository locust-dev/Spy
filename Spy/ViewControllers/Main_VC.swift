//
//  Main_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

protocol HowMuchSpiesDelegate {
    func getSpiesCount(count: Int)
}

class Main_VC: UIViewController {

    @IBOutlet weak var chooseLocation: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    @IBOutlet weak var countSpyButton: UIButton!
    
    @IBOutlet var pickers: [UIPickerView]!
    
    var currentGroup = Group(
        title: Groupes.allLocations.rawValue,
        locations: Groupes.allLocations.definition)
    
    var players = 3
    var spiesCount = 1
    var timer = 1
    
    private var playersPicker: [Int] = []
    private var timerPicker: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseLocation.setTitle(currentGroup.title, for: .normal)
        createPlayersAndTimer()
        
        setupGestures()
        setBackgroundImage(with: "Spy_Background", for: view)
        setCornerRadiusToCircle(chooseLocation,
                                faqButton,
                                startButtonOutlet,
                                countSpyButton)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let whoSpyVC = segue.destination as? WhoIsSpy_VC else { return }
        whoSpyVC.currentGroup = currentGroup
        whoSpyVC.countOfPlayers = players
        whoSpyVC.totalTime = timer * 60
        whoSpyVC.countOfSpies = spiesCount
    }
    
    @IBAction func begins(_ sender: UIButton) {
        sender.showAnimationWithHaptic()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? Container_VC else { return }
        currentGroup = sourceVC.currentGroup
        chooseLocation.setTitle(currentGroup.title, for: .normal)
    }
    
}

// MARK: - Configure popover
extension Main_VC: UIPopoverPresentationControllerDelegate {

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        countSpyButton.addGestureRecognizer(tapGesture)
    }

    @objc private func tapped() {
        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") as? HowMuchSpyPopover else { return }
        popVC.modalPresentationStyle = .popover
        popVC.players = players
        popVC.delegate = self
        
        guard let popOverVC = popVC.popoverPresentationController else { return }
        popOverVC.delegate = self
        popOverVC.sourceView = countSpyButton
        popOverVC.sourceRect = CGRect(x: countSpyButton.bounds.midX, y: countSpyButton.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        present(popVC, animated: true)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}

// MARK: - Picker View configure
extension Main_VC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func createPlayersAndTimer() {
        for player in 3...25 {
            playersPicker.append(player)
        }
        
        for minute in 1...30 {
            timerPicker.append(minute)
        }
        
        for picker in pickers {
            picker.tintColor = .white
        }
    }
    
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

// MARK: - Pass Data From Popover
extension Main_VC: HowMuchSpiesDelegate {
    func getSpiesCount(count: Int) {
        spiesCount = count
        countSpyButton.setTitle(String("Шпионов: \(count)"), for: .normal)
    }
}
