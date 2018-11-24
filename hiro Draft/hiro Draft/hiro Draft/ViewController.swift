//
//  ViewController.swift
//  hiro Draft
//
//  Created by _maiWeb#15 on 11/9/18.
//  Copyright © 2018 ICTSUIM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    @IBOutlet weak var randomImage1: UIImageView!
    @IBOutlet weak var randomImage2: UIImageView!
    @IBOutlet weak var randomImage3: UIImageView!
    
    @IBOutlet weak var showText1: UILabel!
    
    
    @IBOutlet weak var showImgaeLabel: UIImageView!
    @IBOutlet weak var showMoneyYou: UILabel!
    var randomHiroIndex1 : Int = 0
    var randomHiroIndex2 : Int = 0
     var randomHiroIndex3 : Int = 0
    var sumHiro : Int = 0
    let soundFilesName = ["YAHOO","OHNO"]
    let arrayImage  = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var timeCount1 : Int = 0
    @IBOutlet weak var numberSet: UILabel!
    @IBOutlet weak var showTimeSetp: UILabel!
    @IBOutlet weak var timeToV: UILabel!
    var compareHiro : Int = 0
    var x : Int = 0
    var y : Int = 0
    var moneyNumber : Int = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if sender.tag == 4{
            moneyNumber = 50
            x = sender.tag
            restart()
            showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
            
        }
        
        
        
if x == 4 {
        if sender.tag == 1{
            showText1.text = "คุณเลือกสูง"
            compareHiro = 1
            //            print(compareHiro)
            y = 1

        }
         if sender.tag == 2{
            
            showText1.text = "คุณเลือกต่ำ"
            compareHiro = 2
//            print(compareHiro)
            y = 1

    }
}
   
    if y == 1 {
        if  compareHiro == 1 || compareHiro == 2 {
            if moneyNumber != 0{
                if sender.tag == 3{
            
            randomImageHiro()
                    print(compareHiro)
            
            if  sumHiro <= 10  && compareHiro == 2{
                
                
                moneyNumber+=10
                 showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                 ProgressHUD.showSuccess("คุณชนะ")
                playSound(soundFilesName[0])
                y=0
                }
            else if  sumHiro > 10  &&  sumHiro <= 18 && compareHiro == 1{
                
               
                moneyNumber+=10
                showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                 ProgressHUD.showSuccess("คุณชนะ")
                  playSound(soundFilesName[0])
                y=0
                
                
            }
            else {
                
                moneyNumber-=10
                showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                ProgressHUD.showError("คุณแพ้")
                y=0
                 playSound(soundFilesName[1])
            }
       
             
        }
        }
    
    if moneyNumber > 100{
        showImgaeLabel.image=UIImage(named:"a1")
    }
    else if moneyNumber > 0 && moneyNumber < 100{
        showImgaeLabel.image=UIImage(named:"a")
    }
    else if moneyNumber == 0{
        showImgaeLabel.image=UIImage(named:"a2")
                }
            }
        }
        }
    var set : Int = 0
    var timer = Timer()
    var timeCount = 0 //3 mins
    
    @IBAction func buttunTimeLabel(_ sender: UIButton) {
        
        if sender.tag == 1 {
            set+=1
            numberSet.text = "ทำ"+"\(set) set"
        }
        if sender.tag == 2 {
           timeCount = 30
           timeToV.text = String(timeCount)
        }
        if sender.tag == 3 {
           timeCount = 60
            timeToV.text = String(timeCount)
        }
        if sender.tag == 4 {
          timeCount = 90
             timeToV.text = String(timeCount)
        }
        if sender.tag == 5 {
            for i in 0..<set {
              
                timeCount1 = timeCount
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
                if i != 0{
                    timeCount = timeCount1
                }
                numberSet.text = "ทำ"+"\(set) set"
                
             }
        }
        
        
        
        
        
    }
    
    
    
    
    
    func randomImageHiro() {
        
        randomHiroIndex1 = Int(arc4random_uniform(6))
        randomHiroIndex2 = Int(arc4random_uniform(6))
        randomHiroIndex3 = Int(arc4random_uniform(6))
        
        sumHiro = (randomHiroIndex1+1)+(randomHiroIndex2+1)+(randomHiroIndex3+1)
        print(sumHiro)
        
        
            randomImage1.image = UIImage(named:arrayImage[randomHiroIndex1])
        randomImage2.image = UIImage(named:arrayImage[randomHiroIndex2])
         randomImage3.image = UIImage(named:arrayImage[randomHiroIndex3])
        
    }
    func restart(){
        
        
        showText1.text = "คุณเลือก สูง หรือต่ำ"
        compareHiro = 0
        
        
    }
    func playSound(_ playThis : String)  {  // จะต่อตัวแปลเพิ่มใช้ในฟังชั่นนั้นได้ example : soundFilenameToplay playThis : String
        
        
        let soundURL = Bundle.main.url ( forResource: playThis , withExtension : "WAV")
        audioPlayer  = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
        
    }
    @objc func processTimer() {
        
        if timeCount > 0 {
          
            timeCount -= 1
            timeToV.text = String(timeCount)
            
        }
        if timeCount == 0 {
            if set > 0 {
            set = set-1
            }
            numberSet.text = "ทำ"+"\(set) set"
            if set > 0{
                timeCount = timeCount1
                 timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
            }
            else if set == 0{
                 numberSet.text = "ทำ"+"\(set) set"
            }
            
            
        }
        
        
        
        else{
            timer.invalidate()
        }
        
       
        showTimeSetp.text = String(timeCount) //casting
        //"\(timeCount)"
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            randomImageHiro()
            print(compareHiro)
            
            if  sumHiro <= 10  && compareHiro == 2{
                
                
                moneyNumber+=50
                showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                ProgressHUD.showSuccess("คุณชนะ")
                playSound(soundFilesName[0])
                y=0
            }
            else if  sumHiro > 10  &&  sumHiro <= 18 && compareHiro == 1{
                
                
                moneyNumber+=50
                showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                ProgressHUD.showSuccess("คุณชนะ")
                playSound(soundFilesName[0])
                y=0
                
                
            }
            else {
                
                moneyNumber-=50
                showMoneyYou.text = "แต้มของเหลืออยู่ "+"\(moneyNumber)"
                ProgressHUD.showError("คุณแพ้")
                y=0
                playSound(soundFilesName[1])
            }
            if moneyNumber > 100{
                showImgaeLabel.image=UIImage(named:"a1")
            }
            else if moneyNumber > 0 && moneyNumber < 100{
                showImgaeLabel.image=UIImage(named:"a")
            }
            else if moneyNumber == 0{
                showImgaeLabel.image=UIImage(named:"a2")
            }
            
        }
    }
    
    
}
            




