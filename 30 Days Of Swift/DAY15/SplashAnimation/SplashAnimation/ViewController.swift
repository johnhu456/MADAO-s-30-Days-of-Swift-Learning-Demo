//
//  ViewController.swift
//  SplashAnimation
//
//  Created by MADAO on 16/3/16.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        screenView.frame = self.view.frame
        screenView.image = UIImage(named: "screen")
        screenView.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(screenView)
        
    }
//
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.startAnimation()
//    }
//    
//    func setupLoadViews() {
////        whiteView = UIView()
////        whiteView.backgroundColor = UIColor.whiteColor()
////        whiteView.frame = self.view.frame
////        appVie.addSubview(whiteView)
//        
////        twitterBakcImageView = UIImageView()
//        twitterBakcImageView.image = UIImage(named: "IMG_2112")
//        twitterBakcImageView.contentMode = UIViewContentMode.ScaleAspectFill
//        twitterBakcImageView.frame = self.view.frame
//        appVie.addSubview(twitterBakcImageView)
//    }
//    
//    func startAnimation() {
////        UIView.animateWithDuration(0.3, animations: { () -> Void in
////            self.whiteView.alpha = 0.0
////            }) { (success) -> Void in
////                if(success){
//                    self.whiteView.removeFromSuperview()
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.twitterBakcImageView.transform = CGAffineTransformMakeScale(0.9, 0.9)
//                        }, completion: { (success) -> Void in
//                            if(success){
//                                UIView.animateWithDuration(1, animations: { () -> Void in
//                                   self.twitterBakcImageView.transform = CGAffineTransformMakeScale(10, 10)
//                                    }, completion: { (success) -> Void in
//                                        self.twitterBakcImageView.removeFromSuperview()
//                                })
//                            }
//                    })
//                }
////        }
////    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

