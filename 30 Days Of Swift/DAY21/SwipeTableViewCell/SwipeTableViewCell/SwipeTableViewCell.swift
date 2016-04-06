//
//  SwipeTableViewCell.swift
//  SwipeTableViewCell
//
//  Created by MADAO on 16/4/6.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class SwipeTableViewCell: UITableViewCell {

    private var leftImageView: UIImageView?
    private var lblTitle: UILabel?
    
    var imageName: String?{
        willSet{
            leftImageView?.image = UIImage(named: newValue!)
        }
    }
    var title: String?{
        willSet{
            lblTitle?.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.frame = CGRectMake(0, 0, 375, 100)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        leftImageView = UIImageView.init(frame: CGRectMake(0, 0, self.contentView.frame.size.width * 0.5, self.contentView.frame.size.height))
        lblTitle = UILabel.init(frame: CGRectMake(self.contentView.frame.size.width * 0.5, 0, self.contentView.frame.size.width * 0.5, self.contentView.frame.size.height))
        self.contentView.addSubview(leftImageView!)
        self.contentView.addSubview(lblTitle!)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
