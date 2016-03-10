//
//  GradientCell.swift
//  GradientTableViewCell
//
//  Created by MADAO on 16/3/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class GradientCell: UITableViewCell {
    var gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupGradientLayer()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGradientLayer() {
        let color1 = UIColor(white: 1.0, alpha: 0.1)
        let color2 = UIColor(white: 0.8, alpha: 0.2)
        let color3 = UIColor(white: 0.6, alpha: 0.3)
        gradientLayer.colors = [color1.CGColor,color2.CGColor,color3.CGColor]
        gradientLayer.locations = [0.2,0.4,0.6]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, atIndex: 0)

    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
