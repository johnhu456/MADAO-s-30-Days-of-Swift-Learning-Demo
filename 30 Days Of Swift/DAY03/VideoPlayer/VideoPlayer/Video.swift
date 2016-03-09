//
//  Video.swift
//  VideoPlayer
//
//  Created by MADAO on 16/2/20.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import Foundation
import UIKit

class Video {
    var image : String?
    var title : String?
    var videoUrl : String?
    
    convenience init(image:String?,title:String,videoUrl:String){
        self.init()
        self.image = image
        self.title = title
        self.videoUrl = videoUrl

    }
}