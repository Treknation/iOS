//
//  ECAViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class ECAViewController: UIViewController {
    var appData: AppData!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    func setAppData(data : AppData) {
        appData = data
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
        appData.isComplete = true
    }
    
    @IBAction func showHowtoSubmitEEVC(_ sender: Any) {
        let eeVC = submitEEViewController()
        self.navigationController?.pushViewController(eeVC, animated: true)
    }
    @IBAction func showCostandProcessingtimeVC(_ sender: Any) {
        let cpcVC = CPTViewController()
        self.navigationController?.pushViewController(cpcVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
