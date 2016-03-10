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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupVideoPlayer() {
        let filePath = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        videoPlayer = AVPlayer(URL: filePath)
        
        let avplayerLayer = AVPlayerLayer(player: videoPlayer)
        avplayerLayer.frame = self.view.bounds
        avplayerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        videoPlayerVC.showsPlaybackControls = false
        videoPlayerVC.view.frame = self.view.frame
        self.view.layer.addSublayer(avplayerLayer)
        avplayerLayer.zPosition = -1
        videoPlayer.play()
    }

    func registerNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rePlay", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
    }
    
    func rePlay() {
        videoPlayer.seekToTime(kCMTimeZero)
        videoPlayer.play()
    }
    @IBAction func loginButtonOnClicked(sender: AnyObject) {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    @IBAction func signUpButtonOnClicked(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

