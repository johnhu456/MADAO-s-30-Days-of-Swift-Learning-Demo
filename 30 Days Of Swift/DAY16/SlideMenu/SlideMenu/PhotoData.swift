//
//  PhotoData.swift
//  SlideMenu
//
//  Created by MADAO on 16/3/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class PhotoData: NSObject {
    
    var photo:UIImage?
    var headIcon:UIImage?
    var title:String?
    var author:String?
    
    init(photoName:String,headIconName:String,title:String,author:String) {
        self.photo = UIImage(named: photoName)
        self.headIcon = UIImage(named: headIconName)
        self.title = title
        self.author = author
    }
    
    
    static func getPhotoData() ->NSArray {
        return [
            PhotoData(photoName: "1", headIconName: "a", title: "Love Mountain", author: "MADAO"),
            PhotoData(photoName: "2", headIconName: "b", title: "New Graphic design - LIVE FREE", author: "cole"),
            PhotoData(photoName: "3", headIconName: "c", title: "Summer Sand", author: "Daniel Hooper"),
            PhotoData(photoName: "4", headIconName: "d", title: "Seeking For Sinal", author: "Noby-Wan Kenobi"),
            PhotoData(photoName: "5", headIconName: "e", title: "Ice Road", author: "Any")
        ]
    }
}
