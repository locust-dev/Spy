//
//  ContainerForFAQ_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 16.04.2021.
//

import UIKit

class ContainerForFAQ: UIViewController {

    @IBOutlet weak var allRightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        setCornerRadiusToCircle(allRightButton)
        setBackgroundImage(with: "backForButtons", for: allRightButton)
    }
}
