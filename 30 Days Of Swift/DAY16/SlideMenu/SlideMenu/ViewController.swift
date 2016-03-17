//
//  ViewController.swift
//  SlideMenu
//
//  Created by MADAO on 16/3/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,MenuDelegate {

    var mainTableView:UITableView?
    var dataArray = PhotoData.getPhotoData()
    
    var menuButton:UIBarButtonItem?
    
    var menuVC:MenuTableViewController?
    
    var openMenu:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackOpaque
        self.view.backgroundColor = UIColor.blackColor()
        self.setupNavigationItems()
        self.setupMainTableView()
        self.setMenuTableViewController()
    }

    func setupMainTableView() {
        mainTableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView?.dataSource = self
        mainTableView?.delegate = self
        mainTableView?.registerNib(UINib(nibName: "MainTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "mainCell")
        self.view.addSubview(mainTableView!)
        self.dataArray = PhotoData.getPhotoData()
        mainTableView?.reloadData()
    }
    
    func setupNavigationItems() {
        menuButton = UIBarButtonItem.init(title: "🐽", style: UIBarButtonItemStyle.Done, target: self, action: "menuButtonOnClicked")
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    func setMenuTableViewController() {
        menuVC = MenuTableViewController()
        self.addChildViewController(menuVC!)
        menuVC!.menuDelegate = self
        menuVC!.view.frame = CGRectMake(0, -(self.view.frame.size.height - 264), self.view.frame.size.width, self.view.frame.size.height - 264)
        self.view.addSubview(menuVC!.view)
    }
    
    //MARK: - UITableViewDataSourceAndDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var currentCell = tableView.dequeueReusableCellWithIdentifier("mainCell") as? MainTableViewCell
        if currentCell == nil {
            currentCell = MainTableViewCell();
        }
        let data = dataArray[indexPath.row]
        currentCell!.photoData = data as? PhotoData
        return currentCell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - WidgetsAction
    func menuButtonOnClicked() {
        if (openMenu)
        {
            UIView.animateWithDuration(0.5) { () -> Void in
                self.menuVC!.view.frame = CGRectMake(0, -(self.view.frame.size.height - 264), self.view.frame.size.width, self.view.frame.size.height - 264)
                self.navigationController?.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 44)
                self.mainTableView?.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
            }
         }
        else
        {
            UIView.animateWithDuration(0.5) { () -> Void in
                self.menuVC!.view.frame = CGRectMake(0, 0, self.menuVC!.view.frame.size.width, self.menuVC!.view.frame.size.height)
                self.navigationController?.navigationBar.frame = CGRectMake(0, self.view.frame.size.height - 244, self.view.frame.size.width, 44)
                self.mainTableView?.frame = CGRectMake(0, self.view.frame.size.height - 200 - 64, self.view.frame.size.width, self.view.frame.size.height)
            }
  
        }
        openMenu = !openMenu
//        self.navigationController?.pushViewController(menuVC, animated: true)
        
    }
    
    //MARK: - Delagate
    func cellBeClicked(with title: String) {
        self.title = title
        self.menuButtonOnClicked()
    }

}

