//
//  ViewController.swift
//  LimitInput
//
//  Created by MADAO on 16/3/22.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var toolBar: UIView!
    
    @IBOutlet weak var headIcon: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var lblCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headIcon.layer.masksToBounds = true
        self.signNotification()
        textView.delegate = self
    }
    //注册通知
    func signNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardFrameChange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }

    //MARK: - NotificationAction
    func keyBoardFrameChange(notification:NSNotification) {
        //获取键盘移动前初始位置
        let keyBoardBeginFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey]?.CGRectValue)!
        //获取键盘移动后位置
        let keyBoardEndFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue)!
        //获取键盘移动动画时间，并做格式转换
        let duration : NSTimeInterval = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        //获取键盘动画方式，并作转换 参考:http://stackoverflow.com/questions/7327249/ios-how-to-convert-uiviewanimationcurve-to-uiviewanimationoptions
        //                           http://www.cocoachina.com/swift/20151020/13740.html
        let options = UIViewAnimationOptions(rawValue: UInt((notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
        //计算纵轴移动量
        let deltaY = keyBoardEndFrame.origin.y - keyBoardBeginFrame.origin.y
        
        //工具条根据以上参数进行动画平移动
        UIView.animateWithDuration(duration, delay: 0, options: options, animations: { () -> Void in
             self.toolBar.transform = CGAffineTransformTranslate(self.toolBar.transform, 0, deltaY)
            }, completion: { (success) -> Void in
            }
        )
    }
    
    //MARK: - UITextViewDelegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        //lblCount 是一个Label，用于显示还剩下多少字可以输入
        lblCount.text = "\(140 - range.location)"
        return range.location < 140
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

