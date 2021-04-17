//
//  Game_VC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit
import AudioToolbox

class Game_VC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var overButton: UIButton!
    
    var timer: Timer!
    var totalTime = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage(with: "Spy_Background", for: view)
        
        navigationItem.hidesBackButton = true
        timerLabel.text = timeFormatted(totalTime)
        overButton.layer.cornerRadius = overButton.frame.height / 2
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func updateTimer() {
        timerLabel.text = timeFormatted(totalTime)
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            if let timer = timer {
                timer.invalidate()
                timerLabel.text = "Время вышло! Шпион побеждает!"
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                self.timer = nil
            }
        }
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
}
