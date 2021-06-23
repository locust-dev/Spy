//
//  ContainerForFAQ_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 16.04.2021.
//

import UIKit

class ContainerForFaqVC: UIViewController {

    @IBOutlet weak var allRightOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        setCornerRadiusToCircle(allRightOutlet)
        setBackgroundImage(with: "backForButtons", for: allRightOutlet)
    }
}
