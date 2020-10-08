//
//  GameViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet var bestScoreLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var ruleView: UIView!
    @IBOutlet var pieceImage: UIImageView!
    
    @IBOutlet var fieldView1: UIView!
    @IBOutlet var fieldView2: UIView!
    @IBOutlet var fieldView3: UIView!
    @IBOutlet var fieldView4: UIView!
    @IBOutlet var fieldView5: UIView!
    @IBOutlet var fieldView6: UIView!
    @IBOutlet var fieldView7: UIView!
    @IBOutlet var fieldView8: UIView!
    @IBOutlet var fieldView9: UIView!
    
    @IBOutlet var fieldImage1: UIImageView!
    @IBOutlet var fieldImage2: UIImageView!
    @IBOutlet var fieldImage3: UIImageView!
    @IBOutlet var fieldImage4: UIImageView!
    @IBOutlet var fieldImage5: UIImageView!
    @IBOutlet var fieldImage6: UIImageView!
    @IBOutlet var fieldImage7: UIImageView!
    @IBOutlet var fieldImage8: UIImageView!
    @IBOutlet var fieldImage9: UIImageView!
    
    var score: Int = 0
    
    var pinkPiece = UIImage(named:"3squared-7")!
    var whitePiece = UIImage(named:"3squared-8")!
    var bluePiece = UIImage(named:"3squared-9")!
    
    var colorArray: [Int] = [1,2,3]
    var fieldArray: [String] = ["none","none","none","none","none","none","none","none","none"]
    
    var timer1: Timer = Timer()
    var timer2: Timer = Timer()
    var timer3: Timer = Timer()
    var timer4: Timer = Timer()
    var timer5: Timer = Timer()
    var timer6: Timer = Timer()
    var timer7: Timer = Timer()
    var timer8: Timer = Timer()
    var timer9: Timer = Timer()
    var timerScore: Timer = Timer()
    var timerBack: Timer = Timer()

    var yoko:Bool = false
    var tate:Bool = false
    var naname:Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ruleView.layer.cornerRadius = 10
        
        fieldView1.layer.cornerRadius = 10
        fieldView2.layer.cornerRadius = 10
        fieldView3.layer.cornerRadius = 10
        fieldView4.layer.cornerRadius = 10
        fieldView5.layer.cornerRadius = 10
        fieldView6.layer.cornerRadius = 10
        fieldView7.layer.cornerRadius = 10
        fieldView8.layer.cornerRadius = 10
        fieldView9.layer.cornerRadius = 10
        
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped1(_:)))
        
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped2(_:)))
        
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped3(_:)))
        
        let tapGesture4:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped4(_:)))
        
        let tapGesture5:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped5(_:)))
        
        let tapGesture6:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped6(_:)))
        
        let tapGesture7:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped7(_:)))
        
        let tapGesture8:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped8(_:)))
        
        let tapGesture9:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped9(_:)))
        
        tapGesture1.delegate = self
        tapGesture2.delegate = self
        tapGesture3.delegate = self
        tapGesture4.delegate = self
        tapGesture5.delegate = self
        tapGesture6.delegate = self
        tapGesture7.delegate = self
        tapGesture8.delegate = self
        tapGesture9.delegate = self
        
        self.fieldView1.addGestureRecognizer(tapGesture1)
        self.fieldView2.addGestureRecognizer(tapGesture2)
        self.fieldView3.addGestureRecognizer(tapGesture3)
        self.fieldView4.addGestureRecognizer(tapGesture4)
        self.fieldView5.addGestureRecognizer(tapGesture5)
        self.fieldView6.addGestureRecognizer(tapGesture6)
        self.fieldView7.addGestureRecognizer(tapGesture7)
        self.fieldView8.addGestureRecognizer(tapGesture8)
        self.fieldView9.addGestureRecognizer(tapGesture9)
        
        shuffle()
    }
    
    func shuffle(){
        colorArray.shuffle()
        let colorNumber = colorArray[0]
        
        if colorNumber == 1{
            pieceImage.image = pinkPiece
        }else if colorNumber == 2{
            pieceImage.image = whitePiece
        }else{
            pieceImage.image = bluePiece
        }
    }
    
    func scoreCount(){
        if yoko && tate && naname{
            score += 70
        }else if yoko && tate{
            score += 50
        }else if yoko && naname{
            score += 50
        }else if naname && tate{
            score += 50
        }else if yoko{
            score += 30
        }else if tate{
            score += 30
        }else if naname{
            score += 30
        }
        timerScore = Timer.scheduledTimer(
            timeInterval: 0.3,
            target: self,
            selector: #selector(changeScore),
            userInfo: nil,
            repeats: false
        )
    }
    
    func back(){
        if fieldArray.allSatisfy({ $0 != "none" }){
            timerBack = Timer.scheduledTimer(
                timeInterval: 0.7,
                target: self,
                selector: #selector(backHome),
                userInfo: nil,
                repeats: false
            )
        }
    }
    
    @objc func changeScore(){
        scoreLabel.text = String(score)
    }
    
    @objc func backHome(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func useTimer1(){
            timer1 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece1),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer2(){
            timer2 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece2),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer3(){
            timer3 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece3),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer4(){
            timer4 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece4),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer5(){
            timer5 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece5),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer6(){
            timer6 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece6),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer7(){
            timer7 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece7),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer8(){
            timer8 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece8),
                userInfo: nil,
                repeats: false
            )
    }
    
    func useTimer9(){
            timer9 = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(removePiece9),
                userInfo: nil,
                repeats: false
            )
    }
    
    @objc func removePiece1(){
        fieldImage1.image = nil
        fieldArray[0] = "none"
    }
    
    @objc func removePiece2(){
        fieldImage2.image = nil
        fieldArray[1] = "none"
    }
    
    @objc func removePiece3(){
        fieldImage3.image = nil
        fieldArray[2] = "none"
    }
    
    @objc func removePiece4(){
        fieldImage4.image = nil
        fieldArray[3] = "none"
    }
    
    @objc func removePiece5(){
        fieldImage5.image = nil
        fieldArray[4] = "none"
    }
    
    @objc func removePiece6(){
        fieldImage6.image = nil
        fieldArray[5] = "none"
    }
    
    @objc func removePiece7(){
        fieldImage7.image = nil
        fieldArray[6] = "none"
    }
    
    @objc func removePiece8(){
        fieldImage8.image = nil
        fieldArray[7] = "none"
    }
    
    @objc func removePiece9(){
        fieldImage9.image = nil
        fieldArray[8] = "none"
    }
    
    @objc func tapped1(_ sender: UITapGestureRecognizer){
           if sender.state == .ended {
            let colorNumber = colorArray[0]
            
            if fieldArray[0] == "none"{
            if colorNumber == 1{
                fieldImage1.image = pinkPiece
                fieldArray[0] = "pink"
                if fieldArray[1] == "blue" && fieldArray[2] == "pink"{
                             useTimer1()
                             useTimer2()
                             useTimer3()
                             yoko = true
                }
                if fieldArray[3] == "blue" && fieldArray[6] == "pink"{
                             useTimer1()
                             useTimer4()
                             useTimer7()
                             tate = true
                }
                if fieldArray[4] == "blue" && fieldArray[8] == "pink"{
                             useTimer1()
                             useTimer5()
                             useTimer9()
                             naname = true
                }
            }else if colorNumber == 2{
                fieldImage1.image = whitePiece
                fieldArray[0] = "white"
                if fieldArray[1] == "pink" && fieldArray[2] == "white"{
                             useTimer1()
                             useTimer2()
                             useTimer3()
                             yoko = true
                }
                if fieldArray[3] == "pink" && fieldArray[6] == "white"{
                             useTimer1()
                             useTimer4()
                             useTimer7()
                             tate = true
                }
                if fieldArray[4] == "pink" && fieldArray[8] == "white"{
                             useTimer1()
                             useTimer5()
                             useTimer9()
                             naname = true
                }
            }else{
                fieldImage1.image = bluePiece
                fieldArray[0] = "blue"
                if fieldArray[1] == "white" && fieldArray[2] == "blue"{
                             useTimer1()
                             useTimer2()
                             useTimer3()
                             yoko = true
                }
                if fieldArray[3] == "white" && fieldArray[6] == "blue"{
                             useTimer1()
                             useTimer4()
                             useTimer7()
                             tate = true
                }
                if fieldArray[4] == "white" && fieldArray[8] == "blue"{
                             useTimer1()
                             useTimer5()
                             useTimer9()
                             naname = true
                }
            }
            scoreCount()
            shuffle()
            yoko = false
            tate = false
            naname = false
            back()
            }
           }
       }
    
    @objc func tapped2(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]

         if fieldArray[1] == "none"{
         if colorNumber == 1{
             fieldImage2.image = pinkPiece
             fieldArray[1] = "pink"
             if fieldArray[4] == "blue" && fieldArray[7] == "pink"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
         }else if colorNumber == 2{
             fieldImage2.image = whitePiece
             fieldArray[1] = "white"
             if fieldArray[4] == "pink" && fieldArray[7] == "white"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
         }else{
             fieldImage2.image = bluePiece
             fieldArray[1] = "blue"
             if fieldArray[4] == "white" && fieldArray[7] == "blue"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
            }
            scoreCount()
            shuffle()
            yoko = false
            tate = false
            naname = false
            back()
         }
        }
    }
    
    @objc func tapped3(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[2] == "none"{
         if colorNumber == 1{
             fieldImage3.image = pinkPiece
             fieldArray[2] = "pink"
             if fieldArray[5] == "blue" && fieldArray[8] == "pink"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[1] == "blue" && fieldArray[0] == "pink"{
                          useTimer1()
                          useTimer2()
                          useTimer3()
                          yoko = true
             }
             if fieldArray[4] == "blue" && fieldArray[6] == "pink"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
         }else if colorNumber == 2{
             fieldImage3.image = whitePiece
             fieldArray[2] = "white"
             if fieldArray[5] == "pink" && fieldArray[8] == "white"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[1] == "pink" && fieldArray[0] == "white"{
                          useTimer1()
                          useTimer2()
                          useTimer3()
                          yoko = true
             }
             if fieldArray[4] == "pink" && fieldArray[6] == "white"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
         }else{
             fieldImage3.image = bluePiece
             fieldArray[2] = "blue"
             if fieldArray[5] == "white" && fieldArray[8] == "blue"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[1] == "white" && fieldArray[0] == "blue"{
                          useTimer1()
                          useTimer2()
                          useTimer3()
                          yoko = true
             }
             if fieldArray[4] == "white" && fieldArray[6] == "blue"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
         }
         
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    
    @objc func tapped4(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[3] == "none"{
         if colorNumber == 1{
             fieldImage4.image = pinkPiece
             fieldArray[3] = "pink"
             if fieldArray[4] == "blue" && fieldArray[5] == "pink"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }else if colorNumber == 2{
             fieldImage4.image = whitePiece
             fieldArray[3] = "white"
             if fieldArray[4] == "pink" && fieldArray[5] == "white"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }else{
             fieldImage4.image = bluePiece
             fieldArray[3] = "blue"
             if fieldArray[4] == "white" && fieldArray[5] == "blue"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    
    @objc func tapped5(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[4] == "none"{
         if colorNumber == 1{
             fieldImage5.image = pinkPiece
             fieldArray[4] = "pink"
         }else if colorNumber == 2{
             fieldImage5.image = whitePiece
             fieldArray[4] = "white"
         }else{
             fieldImage5.image = bluePiece
             fieldArray[4] = "blue"
         }
         shuffle()
         back()
        }
        }
    }
    
    @objc func tapped6(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[5] == "none"{
         if colorNumber == 1{
             fieldImage6.image = pinkPiece
             fieldArray[5] = "pink"
             if fieldArray[4] == "blue" && fieldArray[3] == "pink"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }else if colorNumber == 2{
             fieldImage6.image = whitePiece
             fieldArray[5] = "white"
             if fieldArray[4] == "pink" && fieldArray[3] == "white"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }else{
             fieldImage6.image = bluePiece
             fieldArray[5] = "blue"
             if fieldArray[4] == "white" && fieldArray[3] == "blue"{
                          useTimer4()
                          useTimer5()
                          useTimer6()
                          yoko = true
             }
         }
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    
    @objc func tapped7(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[6] == "none"{
         if colorNumber == 1{
             fieldImage7.image = pinkPiece
             fieldArray[6] = "pink"
             if fieldArray[3] == "blue" && fieldArray[0] == "pink"{
                          useTimer1()
                          useTimer4()
                          useTimer7()
                          tate = true
             }
             if fieldArray[4] == "blue" && fieldArray[2] == "pink"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
             if fieldArray[7] == "blue" && fieldArray[8] == "pink"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }else if colorNumber == 2{
             fieldImage7.image = whitePiece
             fieldArray[6] = "white"
             if fieldArray[3] == "pink" && fieldArray[0] == "white"{
                          useTimer1()
                          useTimer4()
                          useTimer7()
                          tate = true
             }
             if fieldArray[4] == "pink" && fieldArray[2] == "white"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
             if fieldArray[7] == "pink" && fieldArray[8] == "white"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }else{
             fieldImage7.image = bluePiece
             fieldArray[6] = "blue"
             if fieldArray[3] == "white" && fieldArray[0] == "blue"{
                          useTimer1()
                          useTimer4()
                          useTimer7()
                          tate = true
             }
             if fieldArray[4] == "white" && fieldArray[2] == "blue"{
                          useTimer3()
                          useTimer5()
                          useTimer7()
                          naname = true
             }
             if fieldArray[7] == "white" && fieldArray[8] == "blue"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    
    @objc func tapped8(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[7] == "none"{
         if colorNumber == 1{
             fieldImage8.image = pinkPiece
             fieldArray[7] = "pink"
             if fieldArray[4] == "blue" && fieldArray[1] == "pink"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
         }else if colorNumber == 2{
             fieldImage8.image = whitePiece
             fieldArray[7] = "white"
             if fieldArray[4] == "pink" && fieldArray[1] == "white"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
         }else{
             fieldImage8.image = bluePiece
             fieldArray[7] = "blue"
             if fieldArray[4] == "white" && fieldArray[1] == "blue"{
                          useTimer2()
                          useTimer5()
                          useTimer8()
                          tate = true
             }
         }
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    
    @objc func tapped9(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if fieldArray[8] == "none"{
         if colorNumber == 1{
             fieldImage9.image = pinkPiece
             fieldArray[8] = "pink"
             if fieldArray[5] == "blue" && fieldArray[2] == "pink"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[4] == "blue" && fieldArray[0] == "pink"{
                          useTimer1()
                          useTimer5()
                          useTimer9()
                          naname = true
             }
             if fieldArray[7] == "blue" && fieldArray[6] == "pink"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }else if colorNumber == 2{
             fieldImage9.image = whitePiece
             fieldArray[8] = "white"
             if fieldArray[5] == "pink" && fieldArray[2] == "white"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[4] == "pink" && fieldArray[0] == "white"{
                          useTimer1()
                          useTimer5()
                          useTimer9()
                          naname = true
             }
             if fieldArray[7] == "pink" && fieldArray[6] == "white"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }else{
             fieldImage9.image = bluePiece
             fieldArray[8] = "blue"
             if fieldArray[5] == "white" && fieldArray[2] == "blue"{
                          useTimer3()
                          useTimer6()
                          useTimer9()
                          tate = true
             }
             if fieldArray[4] == "white" && fieldArray[0] == "blue"{
                          useTimer1()
                          useTimer5()
                          useTimer9()
                          naname = true
             }
             if fieldArray[7] == "white" && fieldArray[6] == "blue"{
                          useTimer7()
                          useTimer8()
                          useTimer9()
                          yoko = true
             }
         }
         scoreCount()
         shuffle()
         yoko = false
         tate = false
         naname = false
         back()
        }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
