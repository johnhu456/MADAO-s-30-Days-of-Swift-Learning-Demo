
//
//  DemoLayout.swift
//  CollectionDemo
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit


class DemoLayout: UICollectionViewLayout {
    
    let ITEM_SIZE:CGFloat = UIApplication.sharedApplication().windows[0].frame.size.width/2.0
    var count = 0
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(ITEM_SIZE * 2, ITEM_SIZE * 5)
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        count = (self.collectionView?.numberOfItemsInSection(0))!
    }
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = NSMutableArray()
        for (var i=0 ; i < count; i += 1) {
            let indexPath = NSIndexPath.init(forItem: i, inSection: 0)
            attributes.addObject(self.layoutAttributesForItemAtIndexPath(indexPath)!)
        }
        let result :[UICollectionViewLayoutAttributes] = attributes.copy() as! [UICollectionViewLayoutAttributes]
        return result
    }
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let collectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        let itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE)
        let center : CGPoint
        if indexPath.row % 2 == 0 {
            center = CGPointMake(ITEM_SIZE/2.0, (CGFloat(indexPath.row/2) * ITEM_SIZE + ITEM_SIZE/2.0))
        }
        else{
            center = CGPointMake(ITEM_SIZE * 3/2.0, (CGFloat(indexPath.row/2) * ITEM_SIZE + ITEM_SIZE/2.0))
        }
        collectionViewLayoutAttributes.size = itemSize
        collectionViewLayoutAttributes.center = center
        return collectionViewLayoutAttributes
    }
}
