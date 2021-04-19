//
//  UITextField.swift
//  Spy
//
//  Created by Илья Тюрин on 18.04.2021.
//

import UIKit

extension UITextField {
    
    func setPlaceHolder(with text: String, and color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}
