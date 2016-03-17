//
//  AppDelegate.swift
//  SplashAnimation
//
//  Created by MADAO on 16/3/16.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var maskView: UIImageView?

    var firstVC: UIViewController?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //初始化VC
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        firstVC =  ViewController()
        self.window?.rootViewController = firstVC
        self.window?.makeKeyAndVisible()
        //初始化遮罩
        maskView = UIImageView(image: UIImage(named: "mask"))
        maskView?.frame = CGRectMake(0, 0, 73, 55)
        maskView?.center = CGPointMake((firstVC?.view.center.x)!, (firstVC?.view.center.y)! - 24)

        firstVC!.view.layer.mask = maskView?.layer

        self.window?.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)

        self.startAnimate()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func startAnimate() {
        UIView.animateWithDuration(0.3, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.maskView?.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }) { (success) -> Void in
            UIView.animateWithDuration(1, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.maskView?.transform = CGAffineTransformMakeScale(25, 25)
                }, completion: { (success) -> Void in
                    self.firstVC?.view.layer.mask = nil
            })
        }
    }
    

}

