//
//  UIViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 10.04.2021.
//

import UIKit

extension UIViewController {
    
    func setBackgroundImage(with image: String, for view: UIView) {
        let imageView = UIImageView(image: UIImage(named: "Spy_Background"))
        imageView.frame = UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    
}
