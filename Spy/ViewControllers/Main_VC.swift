//
//  Main_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 06.04.2021.
//

import UIKit

class Main_VC: UIViewController {

    @IBOutlet weak var chooseLocation: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
   
    @IBOutlet weak var plusCount: UIButton!
    @IBOutlet weak var plusTimer: UIButton!
    @IBOutlet weak var minusCount: UIButton!
    @IBOutlet weak var minusTimer: UIButton!
    
    @IBOutlet weak var countOfPlayers: UILabel!
    @IBOutlet weak var timerCount: UILabel!
    
    var currentGroup: Group!
    var players = 3
    var timer = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseLocation.layer.cornerRadius = chooseLocation.frame.height / 2
        startButtonOutlet.layer.cornerRadius = startButtonOutlet.frame.height / 2
        
        plusCount.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        plusTimer.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        minusCount.setBackgroundImage(UIImage(named: "minus"), for: .normal)
        minusTimer.setBackgroundImage(UIImage(named: "minus"), for: .normal)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let whoSpyVC = segue.destination as? WhoIsSpy_VC else { return }
        whoSpyVC.currentGroup = currentGroup
        whoSpyVC.countOfPlayers = players
        whoSpyVC.totalTime = timer * 60
    }
    
    @IBAction func gameBegins() {
        currentGroup != nil
            ? performSegue(withIdentifier: "whoIsSpy", sender: nil)
            : alert(title: "Нет локации!", message: "Пожалуйста, выберите локацию!")
    }
    
    
    @IBAction func playerCountPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            players += 1
            countOfPlayers.text = String(players)
        } else if sender.tag == 0, players != 3 {
            players -= 1
            countOfPlayers.text = String(players)
        }
    }
    
    @IBAction func timerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            timer += 1
            timerCount.text = String(timer)
        } else if sender.tag == 0, timer != 1 {
            timer -= 1
            timerCount.text = String(timer)
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? Container_VC else { return }
        currentGroup = sourceVC.currentGroup
        chooseLocation.setTitle(currentGroup.title, for: .normal)
    }
    
}

extension Main_VC {
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}
