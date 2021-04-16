//
//  HowMuchSpyPopover.swift
//  Spy
//
//  Created by Илья Тюрин on 16.04.2021.
//

import UIKit

class HowMuchSpyPopover: UIViewController {
    
    @IBOutlet weak var pickerSpyCount: UIPickerView!
    
    var players: Int!
    var delegate: HowMuchSpiesDelegate!
    
    private var countArray: [Int] = []
    private var countOfSpyes = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(with: "Spy_Background", for: view)
        getSpiesCount()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate.getSpiesCount(count: countOfSpyes)
    }
    
}

// MARK: - Spyes Count Configure
extension HowMuchSpyPopover {
    
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
extension HowMuchSpyPopover:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countOfSpyes = countArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: String(countArray[row]),
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
