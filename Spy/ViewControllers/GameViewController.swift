//
//  GameViewController.swift
//  Spy
//
//  Created by Илья Тюрин on 07.04.2021.
//

import UIKit
import AudioToolbox

class GameViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var faqLabel: UILabel!
    @IBOutlet weak var overButton: UIButton!
    
    private var timer: Timer?
    private var secondsInBackground = 0
    var totalTime: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        setBackgroundImage(with: "Spy_Background", for: view)
        cornerRadiusAndShadows(overButton)
        createTimer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pauseWhenBackground(noti:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground(noti:)), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    static func getTimeDifference(startDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.second], from: startDate, to: Date())
        return(components.second ?? 0)
    }
    
    @IBAction func stopTimerButton() {
        if let timer = timer {
            timer.invalidate()
        }
        UIApplication.shared.isIdleTimerDisabled = false
    }
}

// MARK: - Private Methods
extension GameViewController {
    private func createTimer() {
        UIApplication.shared.isIdleTimerDisabled = true
        
        if totalTime > 0 {
            timerLabel.text = timeFormatted(totalTime)
        } else {
            timerLabel.text = "00:00"
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @objc private func updateTimer() {
        if totalTime > 0 {
            totalTime -= 1
            timerLabel.text = timeFormatted(totalTime)
        } else if let timer = timer {
            timer.invalidate()
            faqLabel.isHidden = true
            timerLabel.text = "Время вышло!"
            timerLabel.font = timerLabel.font.withSize(40)
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            UIApplication.shared.isIdleTimerDisabled = false
            self.timer = nil
        }
    }
    
    @objc private func pauseWhenBackground(noti: Notification) {
        if let timer = timer {
            timer.invalidate()
        }
        let shared = UserDefaults.standard
        shared.set(Date(), forKey: "savedTime")
    }
    
    @objc private func willEnterForeground(noti: Notification) {
        if let savedDate = UserDefaults.standard.object(forKey: "savedTime") as? Date {
            totalTime -= GameViewController.getTimeDifference(startDate: savedDate)
            createTimer()
        }
    }
    
    
}


