//
//  ImageCell.swift
//  FlowLayout
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    let imageView:UIImageView?
    
    override init(frame: CGRect) {
        self.imageView = UIImageView(frame:frame)
        super.init(frame: frame)
        self.addSubview(self.imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
