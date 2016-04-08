//
//  MenuViewController.swift
//  SideMenu
//
//  Created by MADAO on 16/4/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
class MenuViewController: UITableViewController {

    typealias selectedCallBack=(selectdIndex:NSInteger)->Void
    var viewControllerBeSelectedAtIndex = selectedCallBack?()
    
    private let reuseIdentifier = "mainCell"
    var viewControllerArray:[UIViewController]?
    
    init(style:UITableViewStyle, vcArray:[UIViewController]) {
        super.init(style:style)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.viewControllerArray = vcArray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.blackColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewControllerArray?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = viewControllerArray![indexPath.row].title
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (viewControllerBeSelectedAtIndex != nil) {
            viewControllerBeSelectedAtIndex!(selectdIndex:indexPath.row)
        }
    }
}
