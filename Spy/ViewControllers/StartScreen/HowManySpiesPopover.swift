//
//  HowMuchSpyPopover.swift
//  Spy
//
//  Created by Илья Тюрин on 16.04.2021.
//

import UIKit

class HowManySpiesPopover: UIViewController {
    
    @IBOutlet weak var pickerSpyCount: UIPickerView!
    
    var players: Int!
    var delegate: HowMuchSpiesDelegate!
    private var countArray: [Int] = []
    private var countOfSpies = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSpiesCount()
    }
    
    override func viewWillLayoutSubviews() {
        setBackgroundImage(with: "back", for: view)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate.getSpiesCount(count: countOfSpies)
    }
    
}

// MARK: - Spyes Count Configure
extension HowManySpiesPopover {
    
    private func getSpiesCount() {
        if players % 2 == 1 {
            let counts = players / 2
            for count in 1...counts {
                countArray.append(count)
            }
        } else {
            let counts = players / 2 - 1
            for count in 1...counts {
                countArray.append(count)
            }
        }
        
    }
}

// MARK: - Picker View Configure
extension HowManySpiesPopover:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countOfSpies = countArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: String(countArray[row]),
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
