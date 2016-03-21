//
//  MenuViewController.swift
//  PopMenu
//
//  Created by MADAO on 16/3/19.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit
protocol MenuDelegate:NSObjectProtocol{
    func didUnload()
}
class MenuViewController: UIViewController {

    weak var delegate : MenuDelegate?
    
    var buttonAudio = UIButton(type: UIButtonType.Custom)
    var buttonChat = UIButton(type: UIButtonType.Custom)
    var buttonLink = UIButton(type: UIButtonType.Custom)
    var buttonPhoto = UIButton(type: UIButtonType.Custom)
    var buttonQuote = UIButton(type: UIButtonType.Custom)
    var buttonText = UIButton(type: UIButtonType.Custom)
    var backButton = UIButton(type: UIButtonType.Custom)
    
    var blurEffect:UIBlurEffect?
    var blurView:UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBlurView()
        setupUserInterface()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startAnimate()
    }
    
    func setupBlurView() {
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView!.frame = self.view.frame
        self.view.addSubview(blurView!)

    }
    func setupUserInterface(){
        buttonAudio.setImage(UIImage(named: "Audio"), forState: UIControlState.Normal)
        buttonChat.setImage(UIImage(named: "Chat"), forState: UIControlState.Normal)
        buttonLink.setImage(UIImage(named: "Link"), forState: UIControlState.Normal)
        buttonPhoto.setImage(UIImage(named: "Photo"), forState: UIControlState.Normal)
        buttonQuote.setImage(UIImage(named: "Quote"), forState: UIControlState.Normal)
        buttonText.setImage(UIImage(named: "Text"), forState: UIControlState.Normal)
        
        buttonText.frame = CGRectMake(-100, 50, 100, 100)
        buttonQuote.frame = CGRectMake(-100, CGRectGetMaxY(buttonText.frame) + 30, 100, 100)
        buttonChat.frame = CGRectMake(-100, CGRectGetMaxY(buttonQuote.frame) + 30, 100, 100)
        
        buttonPhoto.frame = CGRectMake(CGRectGetMaxY(self.view.frame), 50, 100, 100)
        buttonLink.frame = CGRectMake(buttonPhoto.frame.origin.x, CGRectGetMaxY(buttonPhoto.frame) + 30, 100, 100)
        buttonAudio.frame = CGRectMake(buttonPhoto.frame.origin.x, CGRectGetMaxY(buttonLink.frame) + 30, 100, 100)
        blurView!.addSubview(buttonText)
        blurView!.addSubview(buttonQuote)
        blurView!.addSubview(buttonChat)
        blurView!.addSubview(buttonPhoto)
        blurView!.addSubview(buttonLink)
        blurView!.addSubview(buttonAudio)
        
        backButton.titleLabel?.textAlignment = NSTextAlignment.Center
        backButton.setTitle("NeverMind", forState: UIControlState.Normal)
        backButton.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backButton.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 30)
        backButton.addTarget(self, action: "backToMainControlelr", forControlEvents: UIControlEvents.TouchUpInside)
        blurView!.addSubview(backButton)
        
    
    }
    
    func startAnimate()
    {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.alpha = 1
        }
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 25, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonChat.frame = CGRectMake(50, self.buttonChat.frame.origin.y, self.buttonChat.frame.size.width,self.buttonChat.frame.size.height)
            self.buttonAudio.frame = CGRectMake(CGRectGetMaxX(self.buttonChat.frame) + 60,self.buttonAudio.frame.origin.y, self.buttonAudio.frame.size.width, self.buttonAudio.frame.size.height)
            
           
            }) { (success) -> Void in
                
        }
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 15, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonQuote.frame = CGRectMake(50, self.buttonQuote.frame.origin.y, self.buttonQuote.frame.size.width, self.buttonQuote.frame.size.width)
            self.buttonLink.frame = CGRectMake(CGRectGetMaxX(self.buttonQuote.frame) + 60, self.buttonLink.frame.origin.y, self.buttonLink.frame.size.width, self.buttonLink.frame.size.height)
            }) { (success) -> Void in
                
        }
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonText.frame = CGRectMake(50, self.buttonText.frame.origin.y, self.buttonText.frame.size.width, self.buttonText.frame.size.height)
            self.buttonPhoto.frame = CGRectMake(CGRectGetMaxX(self.buttonChat.frame) + 60, self.buttonPhoto.frame.origin.y, self.buttonPhoto.frame.size.width, self.buttonPhoto.frame.height)
            }) { (success) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                  self.backButton.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 30)
                })
             }
    }
    
    func backToMainControlelr() {
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.alpha = 0
        }
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 25, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonText.frame = CGRectMake(-100, 50, 100, 100)
            self.buttonPhoto.frame = CGRectMake(CGRectGetMaxY(self.view.frame), 50, 100, 100)
            }) { (success) -> Void in
                
        }
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 15, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonQuote.frame = CGRectMake(-100, CGRectGetMaxY(self.buttonText.frame) + 30, 100, 100)
            self.buttonLink.frame = CGRectMake(CGRectGetMaxY(self.view.frame), CGRectGetMaxY(self.buttonPhoto.frame) + 30, 100, 100)
            }) { (success) -> Void in
                
        }
        
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buttonChat.frame = CGRectMake(-100, CGRectGetMaxY(self.buttonQuote.frame) + 30, 100, 100)
            self.buttonAudio.frame = CGRectMake(CGRectGetMaxY(self.view.frame), CGRectGetMaxY(self.buttonLink.frame) + 30, 100, 100)
            UIView.animateWithDuration(0.0, animations: { () -> Void in
                self.backButton.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 30)
               })

            
            }) { (success) -> Void in
                self.removeFromParentViewController()
                self.view.removeFromSuperview()
                self.delegate?.didUnload()
        }
    }
    
    deinit{
        print("deinit")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
