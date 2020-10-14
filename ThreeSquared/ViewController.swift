//
//  ViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var howToButton: UIButton!
    
    var score:Int = 0
    var scoreArray = [Int]()
    
    let saveScore: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        gameButton.layer.cornerRadius = 20
        howToButton.layer.cornerRadius = 20
        
        if saveScore.object(forKey:"boolean") as? Bool == true{
        scoreArray = saveScore.object(forKey:"score") as! [Int]
        scoreArray.sort { $1 < $0 }
        }

        if scoreArray.count >= 1{
            score = scoreArray[0]
        }
        
        scoreLabel.text = String(score)
    }
    
    @IBAction func backToHome(segue: UIStoryboardSegue){
        self.viewDidLoad()
    }


}

