//
//  GameViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout ,UIGestureRecognizerDelegate {
    
    @IBOutlet var bestScoreLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var ruleView: UIView!
    @IBOutlet var pieceImage: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var pinkPiece = UIImage(named:"3squared-7")!
    var whitePiece = UIImage(named:"3squared-8")!
    var bluePiece = UIImage(named:"3squared-9")!
    
    var colorArray: [Int] = [1,2,3]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ruleView.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(GameViewController.tapped(_:)))
        
        tapGesture.delegate = self
        self.ruleView.addGestureRecognizer(tapGesture)
        
        shuffle()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
           if sender.state == .ended {
               print("タップ")
           }
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
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        
        let colorNumber = colorArray[0]

        if colorNumber == 1{
            cell.image.image = pinkPiece
        }else if colorNumber == 2{
            cell.image.image = whitePiece
        }else if colorNumber == 3{
            cell.image.image = bluePiece
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        
        cell.image.image = bluePiece
        
//        let colorNumber = colorArray[0]
//
//        if colorNumber == 1{
//            imageView.image = pinkPiece
//        }else if colorNumber == 2{
//            imageView.image = whitePiece
//        }else if colorNumber == 3{
//            imageView.image = bluePiece
//        }

        shuffle()
    
       }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横方向のスペース調整
        let space:CGFloat = 8
        let cellSize:CGFloat = collectionView.bounds.width/3 - space
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 9
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
