//
//  MainViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit
import StoreKit

protocol HowMuchSpiesDelegate {
    func getSpiesCount(count: Int)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var chooseLocation: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var countSpyButton: UIButton!
    @IBOutlet var pickers: [UIPickerView]!
    
    private var playersPicker = Array(3...25)
    private var timerPicker = Array(1...25)
    private var game = Game(time: 1, players: 3, spies: 1)
    private var locationGroup = LocationGroup.getDefaultGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        RateManager.showRatesController()
        setupGestures()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.sizeToFit()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cornerAndShadows(
            chooseLocation,
            faqButton,
            reviewButton,
            startButtonOutlet,
            countSpyButton
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let whoSpyVC = segue.destination as? WhoIsSpyViewController else { return }
        whoSpyVC.currentGroup = locationGroup
        whoSpyVC.currentGame = game
    }
    
    @IBAction func beginsPressed(_ sender: UIButton) {
        sender.showAnimationWithHaptic()
    }
    
    @IBAction func reviewPressed() {
        alertForReview()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? ContainerForLocationDetail else { return }
        locationGroup = sourceVC.currentGroup
        chooseLocation.setTitle(locationGroup.title, for: .normal)
    }
    
    private func setupUI() {
        setBackgroundImage(with: "Spy_Background", for: view)
        chooseLocation.setTitle(locationGroup.title, for: .normal)
        for picker in pickers {
            picker.tintColor = .white
        }
    }
    
}

// MARK: - Configure popover
extension MainViewController: UIPopoverPresentationControllerDelegate {
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        countSpyButton.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") as? HowManySpiesPopover else { return }
        popVC.modalPresentationStyle = .popover
        popVC.players = game.players
        popVC.delegate = self
        
        guard let popOverVC = popVC.popoverPresentationController else { return }
        popOverVC.delegate = self
        popOverVC.sourceView = countSpyButton
        popOverVC.sourceRect = CGRect(x: countSpyButton.bounds.midX, y: countSpyButton.bounds.minY + -10, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        present(popVC, animated: true)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

// MARK: - Picker View configure
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerView.tag == 1
            ? playersPicker.count
            : timerPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            game.players = playersPicker[row]
            game.spies = 1
            countSpyButton.setTitle("Шпионов: 1", for: .normal)
        default:
            game.time = timerPicker[row]
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
extension MainViewController: HowMuchSpiesDelegate {
    func getSpiesCount(count: Int) {
        if game.players % 2 == 1 {
            count > game.players / 2 ? setSpiesToOne() : setSpiesToNormal(count: count)
        } else {
            count > game.players / 2 - 1 ? setSpiesToOne() : setSpiesToNormal(count: count)
        }
    }
    
    private func setSpiesToOne() {
        game.spies = 1
        countSpyButton.setTitle(String("Шпионов: 1"), for: .normal)
    }
    
    private func setSpiesToNormal(count: Int) {
        game.spies = count
        countSpyButton.setTitle(String("Шпионов: \(count)"), for: .normal)
    }
}
