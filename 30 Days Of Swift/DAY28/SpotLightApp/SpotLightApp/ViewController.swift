//
//  ViewController.swift
//  SpotLightApp
//
//  Created by MADAO on 16/4/14.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var mainTableView:UITableView?
    var moviewArray:[MovieModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let plistPath = NSBundle.mainBundle().pathForResource("MoviesData", ofType: "plist")
        let dataArray = NSArray.init(contentsOfFile: plistPath!)
        moviewArray = [MovieModel]()
        for dic in dataArray! {
            let newMovie = MovieModel.init(dataDic: dic as! NSDictionary)
            moviewArray?.append(newMovie)
        }
        setupMainTableView()
        setupSearchableItem()
    }

    func setupMainTableView() {
        mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.Plain)
        mainTableView?.dataSource = self
        mainTableView?.delegate = self
        self.view.addSubview(mainTableView!)
        mainTableView?.registerNib(UINib.init(nibName: "MovieSummaryCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "mainCell")
    }
    
    @available(iOS 9.0, *)
    func setupSearchableItem() {
        var index = 0
        var searchItem = [CSSearchableItem]()
        for movie in moviewArray! {
            let newAttributeSet = CSSearchableItemAttributeSet.init(itemContentType: kUTTypeData as String)
            newAttributeSet.title = movie.title
            newAttributeSet.contentDescription = movie.des
            newAttributeSet.thumbnailData = UIImageJPEGRepresentation(UIImage(named: movie.image!)!, 1)
            let attributedItem = CSSearchableItem.init(uniqueIdentifier: String(index), domainIdentifier: String(index) + "Domain", attributeSet: newAttributeSet)
            searchItem.append(attributedItem)
            index += 1
        }
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems(searchItem, completionHandler: nil)

    }

    //MARK: -UITableViewDataSourceAndDelegate a
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (moviewArray?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let summartCell = tableView.dequeueReusableCellWithIdentifier("mainCell") as? MovieSummaryCell
        summartCell!.movieMode = moviewArray![indexPath.row]
        return summartCell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailController = storyBoard.instantiateViewControllerWithIdentifier("movieDetail") as! MovieDetailsViewController
        detailController.movie = moviewArray![indexPath.row]
        self.navigationController?.pushViewController(detailController, animated: true)
    }

    func preparforPush(index:NSInteger) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailController = storyBoard.instantiateViewControllerWithIdentifier("movieDetail") as! MovieDetailsViewController
        detailController.movie = moviewArray![index]
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

