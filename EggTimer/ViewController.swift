//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var player: AVAudioPlayer!
    

    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness + " Boiled Egg"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

          
            player = try! AVAudioPlayer(contentsOf: url!)

            

            player.play()

                }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            subTitle.text = String(totalTime-secondsPassed) + " Seconds Remaining..."
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
            
            
        }
    }
    
}
