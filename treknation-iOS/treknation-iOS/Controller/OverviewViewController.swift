//
//  OverviewViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var isCompletedBtn: UIButton!
    var appData: AppData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.isCompletedBtn.layer.cornerRadius = 10
    }

    func setAppData(data : AppData) {
        appData = data
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
        
        appData.isComplete = true
    }
    
    @IBAction func goback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
