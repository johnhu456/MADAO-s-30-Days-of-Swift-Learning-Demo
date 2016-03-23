//
//  FirstViewController.swift
//  BlockLearning
//
//  Created by MADAO on 16/3/23.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var lblCount : UILabel?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupNavigationItem()
        self.setupLabel()

        // Do any additional setup after loading the view.
    }

    func setupNavigationItem() {
        let nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Done, target: self, action: #selector(FirstViewController.pushNextViewController))
        self.navigationItem.rightBarButtonItem = nextButton
    }
    
    func setupLabel() {
        lblCount = UILabel(frame: CGRectMake(self.view.center.x,self.view.center.y,100,100))
        lblCount?.text = String(count);
        lblCount?.backgroundColor = UIColor.redColor()
        self.view.addSubview(lblCount!)
    }
    
    func pushNextViewController() {
        let secondVC = SecondViewController.init { (isAdd) in
            if isAdd {
                self.count += 1
            }
            else
            {
                self.count -= 1
            }
            self.lblCount?.text = String(self.count)
        }
//        secondVC.calculateClosure = selfCalculateClosure
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func selfCalculateClosure(isAdd:Bool) {
        if isAdd {
            count += 1
        }
        else
        {
            count -= 1
        }
        lblCount?.text = String(count)
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
