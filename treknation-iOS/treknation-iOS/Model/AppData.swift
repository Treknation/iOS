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
    var onCompletionTitle: String
    var overview: String
    var isOpen:Bool = false
    var isComplete = false
    var longDesc: String
    
    init(title: String, onCompletionTitle: String, overview :String, longDesc: String) {
        self.title = title;
        self.onCompletionTitle = onCompletionTitle;
        self.overview = overview;
        self.isOpen = false
        self.isComplete = false
        self.longDesc = longDesc
    }
    

    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let onCompletionTitle = aDecoder.decodeObject(forKey: "onCompletionTitle") as! String
        let overview = aDecoder.decodeObject(forKey: "overview") as! String
        let longDesc = aDecoder.decodeObject(forKey: "longDesc") as! String
        
        self.init(title: title, onCompletionTitle: onCompletionTitle, overview :overview, longDesc :longDesc)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(overview, forKey: "overview")
        aCoder.encode(onCompletionTitle, forKey: "onCompletionTitle")
        aCoder.encode(longDesc, forKey: "longDesc")
    }
}

class CommonMistakeData: NSObject, NSCoding {
    var title: String
    var detailedDescription: String
    var isOpen:Bool = false
    
    init(title: String, detailedDescription: String) {
        self.title = title;
        self.detailedDescription = detailedDescription;
        self.isOpen = false
    }
    

    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let detailedDescription = aDecoder.decodeObject(forKey: "detailedDescription") as! String
        
        self.init(title: title, detailedDescription: detailedDescription)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(detailedDescription, forKey: "detailedDescription")
    }
}
