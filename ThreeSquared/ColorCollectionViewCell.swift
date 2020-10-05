//
//  ColorCollectionViewCell.swift
//  ThreeSquared
//
//  Created by risako takeya on 2020/10/05.
//  Copyright © 2020 Paseri Takeya. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.layer.cornerRadius = 10.0
    }
}
