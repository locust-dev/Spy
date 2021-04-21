//
//  GameVC.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit
import AudioToolbox

class GameVC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var faqLabel: UILabel!
    @IBOutlet weak var overButton: UIButton!
    
    var timer: Timer!
    var totalTime: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        setBackgroundImage(with: "Spy_Background", for: view)
        addShadows(overButton)
        setCornerRadiusToCircle(overButton)
        
        timerLabel.text = timeFormatted(totalTime)
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    @IBAction func gameOverPressed() {
        timer.invalidate()
    }
    
    @objc private func updateTimer() {
        timerLabel.text = timeFormatted(totalTime)
        
        if totalTime != 0 {
            totalTime -= 1
        } else if let timer = timer {
            timer.invalidate()
            faqLabel.isHidden = true
            timerLabel.text = "Время вышло!"
            timerLabel.font = timerLabel.font.withSize(40)
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            self.timer = nil
        }
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
}
