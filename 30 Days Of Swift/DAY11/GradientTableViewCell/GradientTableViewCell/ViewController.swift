//
//  ViewController.swift
//  GradientTableViewCell
//
//  Created by MADAO on 16/3/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var mainTableView = UITableView()
    let myStrArray = [
            "Take Bus No.107 to DIC for work",
            "Eat a bow of noodles as breakfast",
            "Start Work",
            "Eat lunch at 12:00",
            "Watch <House Of Cards> for an hour",
            "End Work and Go home at 6:30",
            "asfadfadfdfdfdfd",
            "   1321124432423424",
            "1324dasdfsdfsdfsdfs",
            "sdasdasfsfdsfsdfsf",
            "Take Bus No.107 to DIC for work",
            "Eat a bow of noodles as breakfast",
            "Start Work",
            "Eat lunch at 12:00",
            "Watch <House Of Cards> for an hour",
            "End Work and Go home at 6:30"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    func setupTableView() {
        mainTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(mainTableView)
        
    }
    
    //MARK: - UITableViewDataSourceAndDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStrArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var currentCell = tableView.dequeueReusableCellWithIdentifier("mainCell") as? GradientCell
        if currentCell == nil {
            currentCell = GradientCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mainCell")
        }
        currentCell?.textLabel?.text = myStrArray[indexPath.row]
        return currentCell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = self.getColorForIndex(indexPath)
    }
    
    func getColorForIndex(indexPath: NSIndexPath) -> UIColor {
        let colorGreen = CGFloat(indexPath.row)/CGFloat(myStrArray.count) * 0.6
        let resultColor = UIColor(red: 1.0, green:colorGreen, blue: 0.0, alpha: 1.0)
        return resultColor
    }


}

