//
//  ViewController.swift
//  FontChanger
//
//  Created by MADAO on 16/2/20.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let fontArray = UIFont.familyNames()
    var fontCount = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(fontArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fontChangeButtonOnClicked(sender: UIButton) {
        if(fontCount < fontArray.count){
//        textView.font = UIFont.fontNamesForFamilyName(fontArray[2]))
            fontCount++
        }
        else
        {
            fontCount = -1
        }
        textView.font = UIFont.init(name: String(fontArray[fontCount]), size: 14)
    }

}

