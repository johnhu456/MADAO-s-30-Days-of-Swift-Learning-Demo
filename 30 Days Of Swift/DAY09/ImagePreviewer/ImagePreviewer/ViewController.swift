//
//  ViewController.swift
//  ImagePreviewer
//
//  Created by MADAO on 16/3/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    
    var imageView = UIImageView()
    var mainScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainScrollView()
//        self.setupGestureRecognizer()
        imageView.bounds = CGRectMake(0, 0, 375, 667)
    }
    
    func setupMainScrollView() {
        mainScrollView = UIScrollView(frame: self.view.frame)
        mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width + 60, self.view.frame.size.height + 60)
        mainScrollView.delegate = self
        mainScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight];
        mainScrollView.maximumZoomScale = 10
        mainScrollView.minimumZoomScale = 0.2
        imageView = UIImageView(image: UIImage(named: "blue"))
        mainScrollView.addSubview(imageView)
        mainScrollView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(mainScrollView)
    }

    func setupGestureRecognizer() {
        let panGR = UIPanGestureRecognizer()
        panGR.addTarget(self, action: "panTheImage:")
        mainScrollView.addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer()
        pinchGR.addTarget(self, action: "pinchTheImage:")
        mainScrollView.addGestureRecognizer(pinchGR)
    }
    
//    func panTheImage(panGr : UIPanGestureRecognizer){
//        var offSet = mainScrollView.contentOffset
//        offSet.x = -(panGr.translationInView(mainScrollView).x + offSet.x)
//        offSet.y = -(panGr.translationInView(mainScrollView).y + offSet.y)
//        mainScrollView.contentOffset = offSet
//        panGr.setTranslation(CGPointMake(0, 0), inView: mainScrollView)
//    }
//    
//    func pinchTheImage(pinchGR : UIPinchGestureRecognizer){
//        print(pinchGR.scale)
//        mainScrollView.setZoomScale(pinchGR.scale, animated: true)
//    }
    func recenterImage() {
//        let scrollViewSize = mainScrollView.bounds.size
//        let imageViewSize = imageView.frame.size
//        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
//        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 :0
//        
//        mainScrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        imageView.center = self.view.center
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
        scrollView.contentSize = CGSizeMake(375 * 2, 667 * 2)
        print("contentSize:",scrollView.contentSize)
        print("frame:",scrollView.frame)
    }

}

