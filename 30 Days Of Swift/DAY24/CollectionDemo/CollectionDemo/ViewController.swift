//
//  ViewController.swift
//  CollectionDemo
//
//  Created by MADAO on 16/4/11.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: DemoLayout())
        collectionView.registerClass(CollectionCell.self, forCellWithReuseIdentifier: "mainCell")
        collectionView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - UICollectionViewDataSourceAndDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("mainCell", forIndexPath: indexPath) as! CollectionCell
        collectionViewCell.lblTitle!.text = String(indexPath.row)
        collectionViewCell.backgroundColor = UIColor.redColor()
        
        return collectionViewCell
    }

}

