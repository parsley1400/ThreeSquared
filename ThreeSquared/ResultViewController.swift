//
//  ResultViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/10.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var score: Int = 0
    var scoreArray = [Int]()
    
    let saveScore: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameButton.layer.cornerRadius = 20
        backButton.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
        scoreLabel.text = String(score)
        if saveScore.object(forKey:"boolean") as? Bool == true{
        scoreArray = saveScore.object(forKey:"score") as! [Int]
        }
        scoreArray.append(score)
        saveScore.set(scoreArray, forKey:"score")
        saveScore.set(true, forKey:"boolean")
        scoreArray = saveScore.object(forKey:"score") as! [Int]
    }
    
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
//    @objc func backGame(){
//        performSegue(withIdentifier: "backGame", sender: nil)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
