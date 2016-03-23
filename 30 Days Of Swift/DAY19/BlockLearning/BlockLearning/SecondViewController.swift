//
//  SecondViewController.swift
//  BlockLearning
//
//  Created by MADAO on 16/3/23.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

typealias addClosure = (isAdd:Bool)->Void

class SecondViewController: UIViewController {

    var btnAdd:UIButton?
    var btnMinus:UIButton?
    var calculateClosure:addClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupButtons()
        // Do any additional setup after loading the view.
    }
    init(block backBlock:((isAdd:Bool) ->Void)){
        super.init(nibName: nil, bundle: nil)
        calculateClosure = backBlock

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    func initWithBlock(function:(isAdd:Bool) ->Void) {
//        calculateClosure = function
//    }
    func setupButtons() {
        let center = self.view.center
        btnAdd = UIButton.init(type: UIButtonType.Custom)
        btnAdd?.frame = CGRectMake(0, 0, 100, 100)
        btnAdd?.setTitle("Add", forState: UIControlState.Normal)
        btnAdd?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnAdd?.center = CGPointMake(center.x, center.y - 100)
        btnAdd?.addTarget(self, action: #selector(SecondViewController.funcAdd), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnAdd!)
        
        btnMinus = UIButton.init(type: UIButtonType.Custom)
        btnMinus?.frame = CGRectMake(0, 0, 100, 100)
        btnMinus?.setTitle("Minus", forState: UIControlState.Normal)
        btnMinus?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnMinus?.center = CGPointMake(center.x, center.y)
        btnMinus?.addTarget(self, action: #selector(SecondViewController.funcMinus), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnMinus!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func funcAdd() {
        if (calculateClosure != nil) {
            calculateClosure!(isAdd:true)
        }
    }
    
    func funcMinus() {
        if (calculateClosure != nil) {
            calculateClosure!(isAdd:false)
        }
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
