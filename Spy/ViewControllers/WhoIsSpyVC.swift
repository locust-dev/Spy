//
//  WhoIsSpyVC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class WhoIsSpyVC: UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var whoIsSpyBTN: UIButton!
    @IBOutlet weak var whoIsSpyLabel: UILabel!
    @IBOutlet weak var whoIsSpyLocation: UILabel!
    @IBOutlet weak var startTextLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var currentGroup: LocationGroup!
    var currentGame: Game!
    
    private var roles: [Bool] = []
    private var touches = 0
    private var index = 0
    private var randomLocationFromGroup: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStartScreen()
        configureSpyButton()
        addedRole()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? GameVC else { return }
        gameVC.totalTime = currentGame.time * 60
    }
    
    @IBAction func whoIsSpyPressed(_ sender: UIButton) {
        sender.showAnimationWithHaptic()
        
        if index == roles.count {
            performSegue(withIdentifier: "toStartGame", sender: nil)
            return
        }
        
        if touches % 2 == 0 {
            roles[index] ? setRoleSpyIfTrue(role: true) : setRoleSpyIfTrue(role: false)
            index += 1
            touches += 1
        } else {
            givePhoneNextPlayer()
            touches += 1
        }
    }
    
    
}

// MARK: - Private Methods
extension WhoIsSpyVC {
    
    private func setRoleSpyIfTrue(role: Bool) {
        whoIsSpyLabel.isHidden = false
        startTextLabel.isHidden = true
        
        if role {
            whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy2"), for: .normal)
            whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(36)
            whoIsSpyLabel.text = "Ты шпион!"
            whoIsSpyLocation.text = "Постарайся понять, о какой локации говорят игроки."
            whoIsSpyLocation.font = whoIsSpyLocation.font.withSize(15)
            icon.image = UIImage(named: "spy")
        } else {
            whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy2"), for: .normal)
            whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(30)
            whoIsSpyLabel.text = randomLocationFromGroup
            whoIsSpyLocation.text = "Ты обычный гражданин.\n Постарайся вычислить шпиона!"
            icon.image = UIImage(named: "locationIcon")
            whoIsSpyLocation.font = whoIsSpyLocation.font.withSize(15)
        }
        
    }
    
    private func givePhoneNextPlayer() {
        whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy1"), for: .normal)
        whoIsSpyLabel.font = whoIsSpyLabel.font.withSize(26)
        whoIsSpyLabel.text = "Игрок \(index + 1)"
        whoIsSpyLocation.text = "Нажми, чтобы увидеть свою роль"
        whoIsSpyLocation.font = whoIsSpyLocation.font.withSize(18)
        icon.image = UIImage(named: "share")
    }
    
    private func configureSpyButton() {
        whoIsSpyBTN.setBackgroundImage(UIImage(named: "forSpy1"), for: .normal)
        whoIsSpyBTN.layer.cornerRadius = 35
        whoIsSpyBTN.clipsToBounds = true
        whoIsSpyBTN.alpha = 0.5
    }
    
    private func addedRole() {
        for _ in 1...currentGame.spies {
            roles.append(true)
        }
        
        for _ in currentGame.spies..<currentGame.players {
            roles.append(false)
        }
        roles.shuffle()
    }
    
    private func configureStartScreen() {
        navigationItem.hidesBackButton = true
        setBackgroundImage(with: "Spy_Background", for: view)
        whoIsSpyLocation.text = ""
        startTextLabel.text = "Игрок 1 \n \n Коснись, чтобы узнать роль!"
        randomLocationFromGroup = currentGroup.locations.randomElement()
        addShadows(whoIsSpyBTN, exitButton)
        setCornerRadiusToCircle(exitButton)
    }
}
