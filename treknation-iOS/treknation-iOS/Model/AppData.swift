//
//  AppData.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-07-04.
//  Copyright © 2020 treknation. All rights reserved.
//

import Foundation
import UIKit
//
class AppData: NSObject, NSCoding {
    var title: String
    var overview: String
    var isOpen:Bool = false
    var isComplete = false
    
    init(title: String, overview :String) {
        self.title = title;
        self.overview = overview;
        self.isOpen = false
        self.isComplete = false
    }
    

    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let overview = aDecoder.decodeObject(forKey: "overview") as! String
        
        self.init(title: title, overview :overview)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(overview, forKey: "overview")
    }
}
