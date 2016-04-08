//
//  ViewController.swift
//  SideMenu
//
//  Created by MADAO on 16/4/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var containViewController:ContainViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.view.addSubview(mainTableView);
        mainTableView.dataSource = self
        mainTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mainCell")
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
        }
        cell?.textLabel?.text = "fdfs"
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
