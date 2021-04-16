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
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
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
}
