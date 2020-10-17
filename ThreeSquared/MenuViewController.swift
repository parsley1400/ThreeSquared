//
//  MenuViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/15.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var againButton: UIButton!
    @IBOutlet var homeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        againButton.layer.cornerRadius = 15
        homeButton.layer.cornerRadius = 15
        continueButton.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueGame(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
