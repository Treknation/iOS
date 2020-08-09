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
class AppData{
    var title: String
    var overview: String
    var isOpen:Bool = false
    
    
    init(title: String, overview :String) {
        self.title = title;
        self.overview = overview;
    }
}
