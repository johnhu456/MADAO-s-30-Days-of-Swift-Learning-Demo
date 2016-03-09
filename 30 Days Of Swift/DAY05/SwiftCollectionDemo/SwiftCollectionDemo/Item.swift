//
//  Item.swift
//  SwiftCollectionDemo
//
//  Created by MADAO on 16/3/3.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class Item: NSObject {
    var title : String?
    var image: UIImage?
    
    init(title : String? ,image: UIImage?) {
        self.title = title
        self.image = image
    }
    
    static func createItems() -> [Item] {
        return [
            Item(title: "1", image: UIImage(named: "bodyline")),
            Item(title: "2", image: UIImage(named: "darkvarder")),
            Item(title: "3", image: UIImage(named: "dudu")),
            Item(title: "4", image: UIImage(named: "hello")),
            Item(title: "5", image: UIImage(named: "hhhhh")),
            Item(title: "6", image: UIImage(named: "run")),
            Item(title: "7", image: UIImage(named: "wave")),
        ]
    }

}
