//
//  UIViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 10.04.2021.
//

import UIKit

extension UIViewController {
    
    func setBackgroundImage(with image: String, for view: UIView) {
        let imageView = UIImageView(image: UIImage(named: image))

        if view is UIButton {
            imageView.frame = view.bounds
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = view.frame.height / 2
            view.addSubview(imageView)
        } else {
            imageView.frame = view.bounds
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.center = view.center
            view.addSubview(imageView)
            view.sendSubviewToBack(imageView)
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func setCornerRadiusToCircle(_ button: UIButton...) {
        button.forEach{ button in
            button.layer.cornerRadius = button.frame.height / 2
        }
    }
    
    func addShadows(_ outlets: UIView...) {
        outlets.forEach { outlet in
            outlet.layer.shadowOpacity = 0.7
            outlet.layer.shadowOffset = CGSize(width: 7, height: 10)
            outlet.layer.shadowColor = UIColor.black.cgColor
            outlet.layer.shadowRadius = 5.0
        }
    }
    
    
}
