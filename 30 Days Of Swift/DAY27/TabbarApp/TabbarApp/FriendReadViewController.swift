//
//  FriendReadViewController.swift
//  TabbarApp
//
//  Created by MADAO on 16/4/13.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class FriendReadViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var mainTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView?.dataSource = self
        mainTableView?.delegate = self
        mainTableView?.registerNib(UINib.init(nibName: "FriendReadTableViewCell", bundle:nil), forCellReuseIdentifier: "mainCell")
        self.view.addSubview(mainTableView!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.startAnimation()
    }
    func startAnimation() {
        for visibleCells in (mainTableView?.visibleCells)! {
            visibleCells.transform = CGAffineTransformMakeTranslation(0, (mainTableView?.frame.size.height)!)
        }
        
        var index = 0
        for cells in (mainTableView?.visibleCells)! {
            UIView.animateWithDuration(0.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                cells.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            index += 1
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainCell") as! FriendReadTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0
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
