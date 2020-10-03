//
//  GameViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var bestScoreLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var ruleView: UIView!
    @IBOutlet var fieldView1: UIView!
    @IBOutlet var fieldView2: UIView!
    @IBOutlet var fieldView3: UIView!
    @IBOutlet var fieldView4: UIView!
    @IBOutlet var fieldView5: UIView!
    @IBOutlet var fieldView6: UIView!
    @IBOutlet var fieldView7: UIView!
    @IBOutlet var fieldView8: UIView!
    @IBOutlet var fieldView9: UIView!
    @IBOutlet var pieceView: UIView!

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
        pieceView.layer.cornerRadius = 35
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
