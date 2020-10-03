//
//  HowToViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var ruleLabel1: UILabel!
    @IBOutlet var ruleLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        backView.layer.cornerRadius = 20
        
//        let LineHeightStyle = NSMutableParagraphStyle()
//        LineHeightStyle.lineSpacing = 10
//        let lineHeightAttr = [NSAttributedString.Key.paragraphStyle: LineHeightStyle]
//        ruleLabel1.attributedText = NSMutableAttributedString(string: "ラベルに代入したい文言が入ります。", attributes: lineHeightAttr)
//        ruleLabel2.attributedText = NSMutableAttributedString(string: "ラベルに代入したい文言が入ります。", attributes: lineHeightAttr)
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
