//
//  ViewController.swift
//  BlockLearning
//
//  Created by MADAO on 16/3/23.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var titleArray = [
        "backWardsTrasnpot"
    

    ]
    
    var mainTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainTableView()
    
    }

    func setupMainTableView() {
        mainTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView?.dataSource = self;
        mainTableView?.delegate = self;
        self.view.addSubview(mainTableView!)
    }
    
    //MARK: - UITableViewDataSourceAndDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var currentCell = tableView.dequeueReusableCellWithIdentifier("mainCell")
        if currentCell == nil {
            currentCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
        }
        currentCell?.textLabel?.text = titleArray[indexPath.row]
        return currentCell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
////    let sel = Selector.init(titleArray[indexPath.row])
////        var control:UIControl = UIControl()
//        let name = titleArray[indexPath.row]
//        
//        self.performSelector(Selector(name))
//
//        
////        let cell = self.tableView(mainTableView!, cellForRowAtIndexPath: indexPath)
////        control.sendAction(Selector(name), to: nil, forEvent: nil)
        switch indexPath.row {
        case 0:
            self.backWardsTranspot()
        default:
            break
        }

    }

    func backWardsTranspot() {
        let firstVC = FirstViewController()
        self.navigationController?.pushViewController(firstVC, animated: true)
    }


}

