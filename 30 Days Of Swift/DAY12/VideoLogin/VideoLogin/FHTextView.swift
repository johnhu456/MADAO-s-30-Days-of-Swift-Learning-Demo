//
//  FHTextView.swift
//  VideoLogin
//
//  Created by MADAO on 16/3/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

enum FHTextViewType{
    case FHTextViewWhiteRoundRect

}



class FHTextView: UIView {
    
    var textField = UITextField()
    
    private var type : FHTextViewType
    init(frame: CGRect, textType: FHTextViewType,placeHolder: String) {
        type = textType
        let textFieldFrame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        textField = UITextField(frame: textFieldFrame)
        textField.placeholder = placeHolder
        super.init(frame: frame)
        switch type{
        case .FHTextViewWhiteRoundRect:
            self.setupViewWithTypeWhiteRoundRect()
            
        }
    }

    func setupViewWithTypeWhiteRoundRect() {
        textField.borderStyle = UITextBorderStyle.RoundedRect
        
        self.addSubview(textField)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
