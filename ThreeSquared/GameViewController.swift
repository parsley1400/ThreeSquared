//
//  GameViewController.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/09/30.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        cell.image.image = pinkPiece
        
//        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = whitePiece
        
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
