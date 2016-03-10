//
//  LoginViewController.swift
//  VideoLogin
//
//  Created by MADAO on 16/3/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var userNameText : FHTextView?
    var passwordText : FHTextView?
    var loginButton : UIButton?
    
    let currentWindow = UIApplication.sharedApplication().windows[0]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0x70/255.0, green:0xC6/255.0 , blue: 0x3C/255.0, alpha: 1)
        self.setNavigationBar()
        self.setupTextViews()
    }
    
    func setNavigationBar() {
        self.title = "Welcome"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont.systemFontOfSize(17)]
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0x70/255.0, green:0xC6/255.0 , blue: 0x3C/255.0, alpha: 1)
    }

    func setupTextViews() {
        let userTextFrame = CGRectMake(-currentWindow.frame.size.width - 45, 45 + 64, currentWindow.frame.size.width - 90, 45)
        let passwordTextFrame = CGRectMake(-currentWindow.frame.size.width - 45, 110 + 64, userTextFrame.size.width, 45)
        userNameText = FHTextView(frame:userTextFrame, textType: FHTextViewType.FHTextViewWhiteRoundRect, placeHolder: "User Name")
        passwordText = FHTextView(frame: passwordTextFrame, textType: FHTextViewType.FHTextViewWhiteRoundRect, placeHolder: "Password")
        passwordText?.textField.secureTextEntry = true
        self.view.addSubview(userNameText!)
        self.view.addSubview(passwordText!)
        self.setupLoginButton()
    }
    
    func setupLoginButton() {
        loginButton = UIButton(type: UIButtonType.Custom)
        loginButton?.backgroundColor = UIColor(red: 0x36/255.0, green:0x6D/255.0 , blue: 0x3C/255.0, alpha: 1)
        loginButton?.frame = CGRectMake(-currentWindow.frame.size.width - 90 , 175 + 64,  currentWindow.frame.size.width - 180, 45)
        loginButton?.setTitle("Login", forState: UIControlState.Normal)
        loginButton?.layer.cornerRadius = 10.0
        loginButton?.layer.masksToBounds = true
        loginButton?.addTarget(self, action: "loginButtonOnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(loginButton!)
        self.startAnimation()
    }
    
    func startAnimation() {
        UIView.animateKeyframesWithDuration(0.3, delay: 0.1, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
            self.userNameText?.frame = CGRectMake(45, 45 + 64, self.currentWindow.frame.size.width - 90, 45)
            }, completion: nil)
        UIView.animateKeyframesWithDuration(0.3, delay: 0.2, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
            self.passwordText?.frame = CGRectMake(45, 110 + 64,self.currentWindow.frame.size.width - 90, 45)
            }, completion: nil)
        UIView.animateKeyframesWithDuration(0.3, delay: 0.3, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: { () -> Void in
            self.loginButton?.frame = CGRectMake(90, 175 + 64, self.currentWindow.frame.size.width - 180, 45)
            }, completion: nil)
        
    }
    
    func loginButtonOnClicked() {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.loginButton?.frame = CGRectMake((self.loginButton?.frame.origin.x)! - 20, 175 + 64,  self.loginButton!.frame.size.width + 40, 45)
            }) { (success) -> Void in
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                   self.loginButton?.frame = CGRectMake(90 , 175 + 64,  self.currentWindow.frame.size.width - 180, 45)
                    }, completion: nil)
                
        }
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
