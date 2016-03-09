//
//  ViewController.swift
//  Timer
//
//  Created by MADAO on 16/2/18.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTimer = NSTimer()
    var time = 0.0
    //是否正在计数
    var isPlaying:Bool = false
    
    @IBOutlet weak var lblCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime(){
        time += 0.1
        lblCount.text = String(format: "%.1f", time)
    }
    
    //MARK: - Widgets Actions
    @IBAction func playButtonOnClicked(sender: UIButton) {
        if (isPlaying)
        {
            return
        }
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:"updateTime", userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func pauseButtonOnClicked(sender: UIButton) {
        if (!isPlaying)
        {
            return
        }
        myTimer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetButtonOnClicked(sender: UIButton) {
        isPlaying = false
        myTimer.invalidate()
        time = 0
        lblCount.text = String(format: "%.1f", time)
    }

}

