//
//  ViewController.swift
//  EggTimer
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var softImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var mediumImage: UIImageView!
    @IBOutlet weak var hardImage: UIImageView!
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
        
        switch hardness {
        case "Soft":
            hardImage.layer.shadowColor = UIColor.gray.cgColor
            hardImage.layer.shadowOpacity = 0
           
            mediumImage.layer.shadowColor = UIColor.gray.cgColor
            mediumImage.layer.shadowOpacity = 0
           
            softImage.layer.shadowColor = UIColor.black.cgColor
            softImage.layer.shadowOpacity = 0.5
            
            
        case "Medium":
            softImage.layer.shadowColor = UIColor.gray.cgColor
            softImage.layer.shadowOpacity = 0
            
            hardImage.layer.shadowColor = UIColor.gray.cgColor
            hardImage.layer.shadowOpacity = 0
            
            mediumImage.layer.shadowColor = UIColor.black.cgColor
            mediumImage.layer.shadowOpacity = 0.5
            
            
        case "Hard":
            softImage.layer.shadowColor = UIColor.gray.cgColor
            softImage.layer.shadowOpacity = 0
            
            mediumImage.layer.shadowColor = UIColor.gray.cgColor
            mediumImage.layer.shadowOpacity = 0
            
            hardImage.layer.shadowColor = UIColor.black.cgColor
            hardImage.layer.shadowOpacity = 0.5
            
        default:
            hardImage.layer.shadowColor = UIColor.gray.cgColor
            hardImage.layer.shadowOpacity = 0
            
            softImage.layer.shadowColor = UIColor.gray.cgColor
            softImage.layer.shadowOpacity = 0
            
            mediumImage.layer.shadowColor = UIColor.gray.cgColor
            mediumImage.layer.shadowOpacity = 0
           
        }
        
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
