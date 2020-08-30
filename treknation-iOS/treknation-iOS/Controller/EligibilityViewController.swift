//
//  EligibilityViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class EligibilityViewController: UIViewController {
    var appData: AppData!
    func setAppData(data : AppData) {
        appData = data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //self.scrollView.contentSize = CGSize(width: 320, height: 960)
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
        appData.isComplete = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cic(_ sender: Any) {
        let langVC = CECViewController()
        self.navigationController?.pushViewController(langVC, animated: true)
    }
    
    @IBAction func fsw(_ sender: Any) {
        let langVC = FSWViewController()
        self.navigationController?.pushViewController(langVC, animated: true)
    }
    @IBAction func fst(_ sender: Any) {
    let langVC = FSTViewController()
    self.navigationController?.pushViewController(langVC, animated: true)
    }
}
