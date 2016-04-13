//
//  ReadLaterViewController.swift
//  TabbarApp
//
//  Created by MADAO on 16/4/13.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ReadLaterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
        self.startAnimation()
        
        // Do any additional setup after loading the view.
    }
    
    func startAnimation() {
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.view.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
