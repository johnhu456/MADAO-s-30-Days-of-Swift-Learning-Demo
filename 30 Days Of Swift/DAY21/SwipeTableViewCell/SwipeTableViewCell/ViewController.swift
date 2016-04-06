//
//  ViewController.swift
//  SwipeTableViewCell
//
//  Created by MADAO on 16/4/6.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var imageDataArray = ["1","2","3","4","5"]
    var titleDataArray = ["Jared Davidson", "Geeky Lemon", "Brian Advent", "CodeWithChris", "KevinZhow"]
    var mainTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupTableView() {
        mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView?.dataSource = self
        mainTableView?.delegate = self
        self.view.addSubview(mainTableView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mainCell") as? SwipeTableViewCell
        if  cell == nil {
            cell = SwipeTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
        }
        cell?.imageName = imageDataArray[indexPath.row]
        cell?.title = titleDataArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.Default, title: "删除") { (deleteAction, indexPath) in
            self.imageDataArray.removeAtIndex(indexPath.row)
            self.titleDataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)

        }
        let shareAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.Default, title: "分享") { (shareAction, indexPath) in
            let activityViewController = UIActivityViewController.init(activityItems:[self.titleDataArray[indexPath.row]], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor.blueColor()
        return [deleteAction,shareAction]
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }


}

