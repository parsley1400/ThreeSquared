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
    
    
    var pinkPiece = UIImage(named:"3squared-7")!
    var whitePiece = UIImage(named:"3squared-8")!
    var bluePiece = UIImage(named:"3squared-9")!
    
    var colorArray: [Int] = [1,2,3]
    

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
    
    @objc func tapped1(_ sender: UITapGestureRecognizer){
           if sender.state == .ended {
            let colorNumber = colorArray[0]
            
            if colorNumber == 1{
                fieldImage1.image = pinkPiece
            }else if colorNumber == 2{
                fieldImage1.image = whitePiece
            }else{
                fieldImage1.image = bluePiece
            }
            
            shuffle()
           }
       }
    
    @objc func tapped2(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 2{
             fieldImage2.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage2.image = whitePiece
         }else{
             fieldImage2.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped3(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage3.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage3.image = whitePiece
         }else{
             fieldImage3.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped4(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage4.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage4.image = whitePiece
         }else{
             fieldImage4.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped5(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage5.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage5.image = whitePiece
         }else{
             fieldImage5.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped6(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage6.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage6.image = whitePiece
         }else{
             fieldImage6.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped7(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage7.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage7.image = whitePiece
         }else{
             fieldImage7.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped8(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage8.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage8.image = whitePiece
         }else{
             fieldImage8.image = bluePiece
         }
         
         shuffle()
        }
    }
    
    @objc func tapped9(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
         let colorNumber = colorArray[0]
         
         if colorNumber == 1{
             fieldImage9.image = pinkPiece
         }else if colorNumber == 2{
             fieldImage9.image = whitePiece
         }else{
             fieldImage9.image = bluePiece
         }
         
         shuffle()
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
