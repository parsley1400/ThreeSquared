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
    @IBOutlet var scoreShareButton: UIButton!
    
    var score: Int = 0
    var scoreArray = [Int]()
    
    let saveScore: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameButton.layer.cornerRadius = 20
        backButton.layer.cornerRadius = 15
        scoreShareButton.layer.cornerRadius = 15

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
    
    @IBAction func shareButton(){

        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
        let shareImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let shareText = "Scored \(score) points in the 「3squared」 game!! 「3squared」 can be downloaded from https://testflight.apple.com/join/6bqMhkId"
        
        let activityItems: [Any] = [shareText, shareImage]
        
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        let excludedActivityTypes = [UIActivity.ActivityType.postToWeibo, .saveToCameraRoll, .print]
        
        activityViewController.excludedActivityTypes = excludedActivityTypes
        
        present(activityViewController, animated: true, completion: nil)
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
