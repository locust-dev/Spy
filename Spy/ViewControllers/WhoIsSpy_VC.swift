//
//  WhoIsSpy_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class WhoIsSpy_VC: UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var whoIsSpyBTN: UIButton!

    @IBOutlet weak var whoIsSpyLabel: UILabel!
    
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
        navigationItem.title = "\(countOfPlayers!) игрока, 1 шпион!"
        
        whoIsSpyBTN.layer.cornerRadius = 35
        exitButton.layer.cornerRadius = exitButton.frame.height / 2
    
        whichPlayerWillSpy = Int.random(in: 1...(countOfPlayers ?? 3))
        randomLocationFromGroup = currentGroup.locations.randomElement()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? Game_VC else { return }
        gameVC.totalTime = totalTime
    }
    
    @IBAction func whoIsSpyPressed(_ sender: UIButton) {
        
        if whenScreenNext == countOfPlayers * 2 - 1 {
            performSegue(withIdentifier: "toStartGame", sender: nil)
        } else if whenShowLocation == whichPlayerWillSpy {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.7167256775, blue: 0.7167256775, alpha: 0.7028695416)
            whoIsSpyLabel.text = "Ты шпион!"
            whenShowLocation += 1
            whenScreenNext += 1
        } else if whenScreenNext % 2 == 0 {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.7167256775, blue: 0.7167256775, alpha: 0.7028695416)
            whoIsSpyLabel.text = "Ты обычный гражданин. Локация: \(randomLocationFromGroup ?? "")"
            whenScreenNext += 1
        } else {
            sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3882404252)
            whoIsSpyLabel.text = "Передайте телефон другому игроку"
            whenScreenNext += 1
            whenShowLocation += 1
        }
    }
    
    
    
    
    
    
}
