//
//  AppDelegate.swift
//  3DTouch
//
//  Created by MADAO on 16/4/6.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let icon0 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Add)
        let item0 = UIApplicationShortcutItem.init(type: "type", localizedTitle: "Title", localizedSubtitle: "subTitle", icon: icon0, userInfo: nil)

        
        let icon1 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Bookmark)
        let item1 = UIApplicationShortcutItem.init(type: "type", localizedTitle: "BookMark", localizedSubtitle: "look for a book", icon: icon1, userInfo: nil)
        UIApplication.sharedApplication().shortcutItems = [item0,item1]
        // Override point for customization after application launch.
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

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        if shortcutItem.localizedTitle == "Title" {
            self.window?.rootViewController!.view.backgroundColor = UIColor.redColor()
        }
        else
        {
            self.window?.rootViewController?.view.backgroundColor = UIColor.grayColor()
        }
    }

}

