//
//  ViewController.swift
//  GradientColor
//
//  Created by MADAO on 16/3/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var gradientLayer = CAGradientLayer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGradientLayer()
        let musicURL = NSBundle.mainBundle().URLForResource("Ecstasy", withExtension: "mp3")
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "changeColor", userInfo: nil, repeats: true)
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: musicURL!)

        }catch let audioError as NSError{
            print(audioError)
        }
//        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        backgroundImage.layer.addSublayer(gradientLayer);
        gradientLayer.colors = [UIColor.whiteColor().CGColor,UIColor.redColor().CGColor,UIColor.orangeColor().CGColor]
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 0)
    }
    
    func randomColor() ->CGColorRef {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1).CGColor
    }
    
    func changeColor() {
        gradientLayer.colors = [self.randomColor(),self.randomColor(),self.randomColor(),self.randomColor(),self.randomColor()]
    }



}

