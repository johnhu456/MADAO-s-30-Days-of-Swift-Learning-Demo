//
//  MainTableViewCell.swift
//  SlideMenu
//
//  Created by MADAO on 16/3/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imgviewBackground: UIImageView!
    
    @IBOutlet weak var imgviewIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    
    
    var photoData : PhotoData?{
        willSet(newValue){
            imgviewBackground.image = newValue?.photo
            imgviewIcon.image = newValue?.headIcon
            lblTitle.text = newValue?.title
            lblAuthor.text = newValue?.author
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
