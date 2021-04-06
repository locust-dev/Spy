//
//  WhoIsSpy_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class WhoIsSpy_VC: UIViewController {
    
    @IBOutlet weak var whoIsSpyBTN: UIButton!
    @IBOutlet weak var playersLabel: UILabel!
    
    // TEST
    @IBOutlet weak var testLabel: UILabel!
    
    var location: String!
    var countOfPlayers: Int!
    
    var whenScreenNext = 0
    var whenShowLocation = 1
    var whichPlayerWillSpy: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        whoIsSpyBTN.setTitle("Игрок 1, нажми, чтобы увидеть свою роль", for: .normal)
        playersLabel.text = "Количество игроков: \(String(countOfPlayers ?? 0))"
    
        whichPlayerWillSpy = Int.random(in: 1...(countOfPlayers ?? 3))
        
        //TEST
        testLabel.text = "Отладка(which number is spy): \(String(whichPlayerWillSpy ?? 0))"
        
    }
    
    
    
    @IBAction func whoIsSpyPressed(_ sender: UIButton) {
        
        if whenScreenNext == countOfPlayers * 2 - 1 {
            performSegue(withIdentifier: "toStartGame", sender: nil)
        } else if whenShowLocation == whichPlayerWillSpy {
            sender.backgroundColor = #colorLiteral(red: 0.8006544605, green: 0.5798318559, blue: 0, alpha: 1)
            sender.setTitle("Ты шпиён!", for: .normal)
            whenShowLocation += 1
            whenScreenNext += 1
            print(whenScreenNext)
        } else if whenScreenNext % 2 == 0 {
            sender.backgroundColor = #colorLiteral(red: 0.8006544605, green: 0.5798318559, blue: 0, alpha: 1)
            sender.setTitle(location, for: .normal)
            whenScreenNext += 1
            print(whenScreenNext)
        } else {
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5070373533, blue: 0.9813989472, alpha: 0.3563387031)
            sender.setTitle("Передайте телефон другому игроку", for: .normal)
            whenScreenNext += 1
            whenShowLocation += 1
            print(whenScreenNext)
        }
        

            
            
        
    }
    
    
    
    
    
}
