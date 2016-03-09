//
//  ViewController.swift
//  SwiftRefresh
//
//  Created by MADAO on 16/3/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    
    var tableviewController = UITableViewController()
    var currentCount = 3
    let refresher = UIRefreshControl()
    let emojiArray = [
        "👧👧👧👧👧",
        "👨‍👩‍👧👨‍👩‍👧👨‍👩‍👧👨‍👩‍👧👨‍👩‍👧",
        "👨‍👩‍👧‍👦👨‍👩‍👧‍👦👨‍👩‍👧‍👦👨‍👩‍👧‍👦👨‍👩‍👧‍👦",
        "😓😓😓😓😓",
        "😅😅😅😅😅",
        "😬😬😬😬😬",
        "😱😱😱😱😱",
        "😻😻😻😻😻",
        "😽😽😽😽😽"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refresher = UIRefreshControl()
        tableviewController = UITableViewController(style:UITableViewStyle.Plain)
        tableviewController.tableView = mainTableView
        tableviewController.refreshControl = refresher
        
        refresher.attributedTitle = NSAttributedString(string: "努力加载中……")
        refresher.tintColor = UIColor.whiteColor()
        refresher.addTarget(self, action:"refreshTableView" , forControlEvents: UIControlEvents.ValueChanged)
    }

    //MARK: - UITableViewDataSourceAndDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var mainCell = tableView.dequeueReusableCellWithIdentifier("mainCell")
        if mainCell == nil {
            mainCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
            mainCell?.textLabel?.text = emojiArray[emojiArray.count - indexPath.row - 1]
            mainCell?.backgroundColor = UIColor.clearColor()
        }
        return mainCell!
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return refresher
//    }

    //MARK: - RefreshTarget
    func refreshTableView() {
        currentCount++
        self.tableviewController.tableView.reloadData()
        self.tableviewController.refreshControl!.endRefreshing()
    
    }
}

