//
//  ImageStock.swift
//  kameraApp
//
//  Created by kosuge satoshi on 2015/11/28.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

class ImageStock: NSObject {
    static let sharedInstance = ImageStock()
    var images: [UIImage] = []
}

