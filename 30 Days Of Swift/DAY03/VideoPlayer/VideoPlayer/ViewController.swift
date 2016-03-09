//
//  ViewController.swift
//  VideoPlayer
//
//  Created by MADAO on 16/2/20.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var mainTableView = UITableView()
    var videoArray = [Video]()
    
    var currentVideo : Video?
    
    var videoPlayer = AVPlayer()
    var videoPlayVC = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Videos"
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!]
        self.setupVideo()
        self.setupTableView()
        self.setupVideoPlayer()
    }
    
    //MARK: - Model
    func setupVideo(){
        self.videoArray = [
        
            Video(image: "videoScreenshot01", title: "01", videoUrl: "videoUrl"),
            Video(image: "videoScreenshot02", title: "02", videoUrl: "videoUrl"),
            Video(image: "videoScreenshot03", title: "03", videoUrl: "videoUrl"),
            Video(image: "videoScreenshot04", title: "04", videoUrl: "videoUrl"),
            Video(image: "videoScreenshot05", title: "05", videoUrl: "videoUrl"),
            Video(image: "videoScreenshot06", title: "06", videoUrl: "videoUrl")
        ]
    }
    
    func setupTableView(){
        mainTableView = UITableView.init(frame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.backgroundColor = UIColor.blackColor()
        mainTableView.registerClass(VideoCell.self, forCellReuseIdentifier: "videoCell")
        self.view.addSubview(mainTableView)

    }
    
    func setupVideoPlayer(){
        let videoFilePath = NSBundle.mainBundle().pathForResource("emojizone", ofType: "mp4")
        videoPlayer = AVPlayer(URL: NSURL(fileURLWithPath: videoFilePath!))
        videoPlayVC.player = videoPlayer
    }

    //MARK: - UITableViewDataSource AndDeleate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videoArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier : String = "videoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? VideoCell
        currentVideo = self.videoArray[indexPath.row]
        cell!.frame = CGRectMake(0, 0, 375, 220)
        cell!.video = currentVideo
//        cell!.imageView?.image = UIImage.init(named: currentVideo!.image!)
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let currentCell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        return currentCell.frame.size.height
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.presentViewController(videoPlayVC, animated: true) { () -> Void in
            self.videoPlayVC.player?.play()
        }
    }

}

