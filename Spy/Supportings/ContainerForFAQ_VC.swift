//
//  ContainerForFAQ_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 16.04.2021.
//

import UIKit

class ContainerForFAQ_VC: UIViewController {

    @IBOutlet weak var allRightOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white
        allRightOutlet.layer.cornerRadius = allRightOutlet.frame.height / 2
    }
    
}
