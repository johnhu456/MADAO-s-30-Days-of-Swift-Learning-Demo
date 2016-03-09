//
//  CustomCollectionViewCell.swift
//  SwiftCollectionDemo
//
//  Created by MADAO on 16/3/3.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
}
