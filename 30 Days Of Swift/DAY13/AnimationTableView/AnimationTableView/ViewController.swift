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
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startAnimate()
        
    }

    func setupTableView() {
        mainTableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50), style: UITableViewStyle.Plain)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(mainTableView)
        
    }
    
    func startAnimate() {
        let cells = mainTableView.visibleCells
        let tableHeight: CGFloat = mainTableView.bounds.size.height
        
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                
                }, completion: nil)
            
            index += 1
        }

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
    //此方法会在重用后也启动动画效果，不太适合展现
//        cell.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height)
//        UIView.animateKeyframesWithDuration(0.2, delay: 0.1*Double(indexPath.row), options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
//            cell.transform = CGAffineTransformMakeTranslation(0, 0)
//            }, completion: nil)
    }
    
    func getColorForIndex(indexPath: NSIndexPath) -> UIColor {
        let colorGreen = CGFloat(indexPath.row)/CGFloat(myStrArray.count) * 0.6
        let resultColor = UIColor(red: 1.0, green:colorGreen, blue: 0.0, alpha: 1.0)
        return resultColor
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("24235")
//        mainTableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Top)
        self.startAnimate()
    }


}

