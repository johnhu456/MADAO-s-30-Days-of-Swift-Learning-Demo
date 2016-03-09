//
//  VideoCell.swift
//  VideoPlayer
//
//  Created by MADAO on 16/2/22.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    //model
    var video : Video?{
            didSet{
//                self.textLabel!.text = self.video!.title
                self.backgroundImageView?.image = UIImage(named: self.video!.image!)
        }
    }
    //PlayButton
    var btnPlay : UIButton?
    
    var backgroundImageView : UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUserIntetface()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //MARK: - Layout
    func setupUserIntetface()
    {
        let currentWindow = UIApplication.sharedApplication().windows[0];
        self.contentView.frame = CGRectMake(0, 0, currentWindow.frame.size.width , 220);
        self.backgroundImageView = UIImageView(frame: self.contentView.frame)
        
        self.btnPlay = UIButton.init(type: UIButtonType.Custom);
        self.btnPlay!.frame = CGRectMake(self.contentView.frame.size.width/2 - 25, self.contentView.frame.size.height/2 - 25, 50, 50);
        self.btnPlay?.setImage(UIImage(named: "playBtn"), forState: UIControlState.Normal)
        
        self.backgroundImageView!.addSubview(self.btnPlay!)
        self.contentView.addSubview(self.backgroundImageView!)
//        self.contentView.addSubview(self.imageView!)
//        self.contentView.addSubview(self.playImg!)
        
    }
    
    
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
