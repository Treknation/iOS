//
//  PrepareforLandingViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class PrepareforLandingViewController: UIViewController {
    var appData: AppData!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!

    func setAppData(data : AppData) {
        appData = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //self.scrollView.contentSize = CGSize(width: 320, height: 960)
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
           appData.isComplete = true
           let alert = UIAlertController(title: "TrekNation", message: "Are you sure you want to mark this section as Complete?", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
               self.navigationController?.popViewController(animated: true)
           }))
           alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
           self.present(alert, animated: true)
    }
    
    
    @IBAction func ifAlredyInCanada(_ sender: Any) {
        let vc = InCanadaViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ifOutsideCanada(_ sender: Any) {
        let vc = OutsideCanadaViewController()
          self.navigationController?.pushViewController(vc, animated: true)
    }
}