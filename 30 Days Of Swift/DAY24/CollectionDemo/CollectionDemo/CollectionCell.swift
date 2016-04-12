//
//  CollectionCell.swift
//  CollectionDemo
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    let lblTitle : UILabel?
    
    override init(frame: CGRect) {
        self.lblTitle = UILabel(frame:CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.lblTitle?.font = UIFont.systemFontOfSize(50)
        super.init(frame: frame)
        self.setSubViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews() {
        self.addSubview(self.lblTitle!)
    }
    
}
