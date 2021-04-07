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
    
    var currentGroup: Group!
    var countOfPlayers: Int!
    var totalTime: Int!
    
    private var whichPlayerWillSpy: Int!
    private var randomLocationFromGroup: String!
    private var whenScreenNext = 0
    private var whenShowLocation = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        whoIsSpyBTN.setTitle("Игрок 1, \n нажми, \n чтобы увидеть свою роль", for: .normal)
        whoIsSpyBTN.titleLabel?.lineBreakMode = .byWordWrapping
        
        playersLabel.text = "Количество игроков: \(String(countOfPlayers ?? 0))"
    
        whichPlayerWillSpy = Int.random(in: 1...(countOfPlayers ?? 3))
        randomLocationFromGroup = currentGroup.locations.randomElement()
        
        //TEST
        testLabel.text = "Отладка(which number is spy): \(String(whichPlayerWillSpy ?? 0))"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? Game_VC else { return }
        gameVC.totalTime = totalTime
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
            sender.setTitle("Ты обычный гражданин. \n Локация:\(randomLocationFromGroup ?? "")", for: .normal)
            sender.backgroundColor = #colorLiteral(red: 0.8006544605, green: 0.5798318559, blue: 0, alpha: 1)
            whenScreenNext += 1
            print(whenScreenNext)
        } else {
            sender.setTitle("Передайте телефон \n другому игроку", for: .normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.5070373533, blue: 0.9813989472, alpha: 0.3563387031)
            whenScreenNext += 1
            whenShowLocation += 1
            print(whenScreenNext)
        }
    }
    
    
    
    
    
    
}
