//
//  ViewController.swift
//  VideoLogin
//
//  Created by MADAO on 16/3/8.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer
class ViewController: UIViewController {

    var videoPlayer = AVPlayer()
    var videoPlayerVC = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVideoPlayer()
        self.registerNotification()
        
    }
    
    func setupVideoPlayer() {
        let filePath = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
//        let videoURL = NSURL(string:NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
//        let movieAvasset:AVAsset = AVURLAsset(URL: filePath, options: nil)
//        let playerItem = AVPlayerItem(URL: filePath)
//        videoPlayer = AVPlayer(playerItem: playerItem)
//        videoPlayerVC.player = AVPlayer(URL: filePath)
        videoPlayer = AVPlayer(URL: filePath)

//        self.videoPlayerVC.player = AVPlayer(URL: filePath)
//        self.videoPlayerVC.player?.play()
//        self.videoPlayerVC.view.frame = self.view.frame
//        self.videoPlayerVC.showsPlaybackControls = false
        
        let avplayerLayer = AVPlayerLayer(player: videoPlayer)
        avplayerLayer.frame = self.view.bounds
        avplayerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        videoPlayerVC.showsPlaybackControls = false
        videoPlayerVC.view.frame = self.view.frame
//        self.view.addSubview(videoPlayerVC.view)
//        self.view.sendSubviewToBack(videoPlayerVC.view)
        self.view.layer.addSublayer(avplayerLayer)
        avplayerLayer.zPosition = -1
        videoPlayer.play()
    }

    func registerNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rePlay", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
    }
    
    func setupButtons() {
        
    }
    
    func rePlay() {
        videoPlayer.seekToTime(kCMTimeZero)
        videoPlayer.play()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

