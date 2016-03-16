//
//  ViewController.swift
//  LuckyMachine
//
//  Created by MADAO on 16/3/16.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var emojiPicker: UIPickerView!
    
    @IBOutlet weak var lblTip: UILabel!
    
    let emojiData = ["🐱","🐨","🐵","🐶","🐷","🐸","🐮"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UIPikcerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiData.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getRandomEmoji()
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let atttibutedStr = NSAttributedString(string: getRandomEmoji()!, attributes: [NSFontAttributeName:UIFont(name: "Apple Color Emoji", size: 80)!])
        return atttibutedStr
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = getRandomEmoji()
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func getRandomEmoji() -> String? {
        let randomIndex : Int = Int(rand()%7)
        return emojiData[randomIndex]
    }
    
    //MARK: - WidgetsActions
    @IBAction func buttonGoOnClicked(sender: AnyObject) {
        for var count = 0;count<10;count++ {
            for var component = 0;component<3; component++ {
                emojiPicker.selectRow(self.getRandomIndex(), inComponent: component, animated: true)
            }
        }
        if emojiPicker.selectedRowInComponent(0) == emojiPicker.selectedRowInComponent(1) && emojiPicker.selectedRowInComponent(1) == emojiPicker.selectedRowInComponent(2)
        {
            lblTip.text = "Bingo"
        }
        else
        {
            lblTip.text = "Try Again"
        }
        
    }
    
    func getRandomIndex() -> Int {
        return Int(rand()%7)
    }
}
