//
//  MovieModel.swift
//  SpotLightApp
//
//  Created by MADAO on 16/4/14.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class MovieModel: NSObject {
    private var dataDictionary:NSDictionary?
    
    var title:String?
    var category:String?
    var rating:String?
    var des: String?
    var director:String?
    var stars:String?
    var image:String?
    
    init(dataDic:NSDictionary) {
        super.init()
        self.dataDictionary = dataDic
        self.parse()
    }
    
    func parse() {
        self.setValue(dataDictionary!["Title"], forKey: "title")
        self.setValue(dataDictionary!["Category"], forKey: "category")
        self.setValue(dataDictionary!["Rating"], forKey: "rating")
        self.setValue(dataDictionary!["Description"], forKey: "des")
        self.setValue(dataDictionary!["Director"], forKey: "director")
        self.setValue(dataDictionary!["Stars"], forKey: "stars")
        self.setValue(dataDictionary!["Image"], forKey: "image")
    }
}
