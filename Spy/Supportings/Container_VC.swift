//
//  Container_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit

class Container_VC: UIViewController {

    @IBOutlet weak var chooseOutlet: UIButton!
    
    var currentGroup: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "\(currentGroup.title ?? "")"
        navigationController?.navigationBar.tintColor = .white
        chooseOutlet.layer.cornerRadius = chooseOutlet.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableVC = segue.destination as? SetGroup_VC else { return }
        tableVC.currentGroup = currentGroup
    }
   

}
