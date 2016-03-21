//
//  ViewController.swift
//  PopMenu
//
//  Created by MADAO on 16/3/18.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var menu:MenuViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu = MenuViewController()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if menu==nil
        {
            menu = MenuViewController()
        }
        self.addChildViewController(menu!)
        self.view.addSubview((menu?.view)!)
    }
    


}

