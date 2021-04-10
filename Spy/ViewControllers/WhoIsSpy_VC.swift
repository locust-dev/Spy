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
    @IBOutlet weak var whoIsSpyLocation: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    var currentGroup: Group!
    var countOfPlayers: Int!
    var totalTime: Int!
    
    private var whichPlayerWillSpy: Int!
    private var randomLocationFromGroup: String!
    private var whenScreenNext = 0
    private var whenShowLocation = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage(with: "Spy_Background", for: view)
        
        navigationItem.hidesBackButton = true
        whoIsSpyLocation.text = ""
        
        whoIsSpyBTN.layer.cornerRadius = 35
        exitButton.layer.cornerRadius = exitButton.frame.height / 2
    
        whichPlayerWillSpy = Int.random(in: 1...(countOfPlayers ?? 3))
        randomLocationFromGroup = currentGroup.locations.randomElement()
        
        whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy1"), for: .normal)
        whoIsSpyBTN.clipsToBounds = true
        whoIsSpyBTN.alpha = 0.5
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? Game_VC else { return }
        gameVC.totalTime = totalTime
    }
    
    @IBAction func whoIsSpyPressed(_ sender: UIButton) {
        sender.showAnimationWithHaptic()
        
        if whenScreenNext == countOfPlayers * 2 - 1 {
            performSegue(withIdentifier: "toStartGame", sender: nil)
        } else if whenShowLocation == whichPlayerWillSpy {
            whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy2"), for: .normal)
            whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(40)
            whoIsSpyLabel.text = "Ты шпион!"
            whoIsSpyLocation.text = "Постарайся понять, о какой локации говорят игроки."
            whoIsSpyLocation.font = whoIsSpyLocation.font.withSize(15)
            icon.image = UIImage(named: "spy")
            whenShowLocation += 1
            whenScreenNext += 1
        } else if whenScreenNext % 2 == 0 {
            whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy2"), for: .normal)
            whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(15)
            whoIsSpyLabel.text = "Ты обычный гражданин.\n Постарайся вычислить шпиона!"
            whoIsSpyLocation.text = "\(randomLocationFromGroup ?? "")"
            icon.image = UIImage(named: "locationIcon")
            whoIsSpyLocation.font = whoIsSpyLocation.font.withSize(30)
            whenScreenNext += 1
        } else {
            sender.setBackgroundImage(UIImage(named: "forSpy1"), for: .normal)
            whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(20)
            whoIsSpyLabel.text = "Передайте телефон другому игроку"
            whoIsSpyLocation.text = ""
            icon.image = UIImage(named: "share")
            whenScreenNext += 1
            whenShowLocation += 1
        }
    }
    
    
}


