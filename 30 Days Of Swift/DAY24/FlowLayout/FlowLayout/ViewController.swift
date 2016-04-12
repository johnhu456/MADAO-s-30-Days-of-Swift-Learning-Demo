//
//  ViewController.swift
//  FlowLayout
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var collectionView : UICollectionView?
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var imageDataArray = [
        "1","2","3","4","5","6","7","8","9","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21"
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - UICollectionViewDataSourceAndDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataArray.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mainCell", forIndexPath: indexPath)
        let imageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: imageDataArray[indexPath.row])
        cell.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64((arc4random() % 600 ) / 1000 ) * NSEC_PER_SEC )), dispatch_get_main_queue(), ({ () -> Void in
            
            UIView.animateWithDuration(0.8, animations: ({
                
                cell.alpha = 1.0
                
            }))
            
        }))
        return cell
    }

}

