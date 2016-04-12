//
//  FlowLayout.swift
//  FlowLayout
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

let DISTANCE_INSIDE:CGFloat = 2
let WIDTH = UIApplication.sharedApplication().windows[0].frame.size.width
let HEIGHT = UIApplication.sharedApplication().windows[0].frame.size.height
let FHSIZE_BIG = CGSizeMake(WIDTH - 2 * DISTANCE_INSIDE, HEIGHT/3.0)
let FHSIZE_SMALL = CGSizeMake((WIDTH - 3 * DISTANCE_INSIDE)/2.0, HEIGHT/3.0)

class FlowLayout: UICollectionViewLayout {
    
    var itemCount = 0
    
    override func prepareLayout() {
        super.prepareLayout()
        itemCount = (self.collectionView?.numberOfItemsInSection(0))!
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(WIDTH, HEIGHT * 21)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesArray = NSMutableArray()
        for i in 0 ..< itemCount  {
            let indexPath = NSIndexPath.init(forItem: i, inSection: 0)
            let attributes = self.collectionView?.layoutAttributesForItemAtIndexPath(indexPath)
            attributesArray.addObject(attributes!)
        }
        return attributesArray.copy() as? [UICollectionViewLayoutAttributes]
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes.init(forCellWithIndexPath: indexPath)
        let sizeWith = WIDTH/2.0
        let sizeHeight = HEIGHT/3.0
        if (indexPath.row + 1) % 3 == 0 {
            attributes.size = FHSIZE_BIG
            attributes.frame = CGRectMake(0,(2 * CGFloat(indexPath.row + 1)/3 - 1) * sizeHeight, attributes.size.width, attributes.size.height)
        }
        else{
            attributes.size = FHSIZE_SMALL
            if (indexPath.row - 1) % 3 == 0 {
                attributes.frame = CGRectMake(sizeWith, CGFloat(indexPath.row - 1)/3 * 2 * sizeHeight, attributes.size.width, attributes.size.height)
            }
            else{
                attributes.frame = CGRectMake(0, CGFloat(indexPath.row)/3 * 2 * sizeHeight, attributes.size.width, attributes.size.height)
            }
        }
        return attributes
    }
}
