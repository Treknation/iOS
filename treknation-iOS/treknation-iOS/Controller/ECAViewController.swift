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
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var processingTimeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        self.submitBtn.layer.cornerRadius = 6
        self.submitBtn.layer.shadowColor = UIColor.lightGray.cgColor
        self.submitBtn.layer.shadowOpacity = 1
        self.submitBtn.layer.shadowOffset = .zero
        self.submitBtn.layer.shadowRadius = 2
        
        self.processingTimeBtn.layer.cornerRadius = 6
        self.processingTimeBtn.layer.shadowColor = UIColor.lightGray.cgColor
        self.processingTimeBtn.layer.shadowOpacity = 1
        self.processingTimeBtn.layer.shadowOffset = .zero
        self.processingTimeBtn.layer.shadowRadius = 2
        
        // Do any additional setup after loading the view.
    }
    func setAppData(data : AppData) {
        appData = data
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
        let alert = UIAlertController(title: "TrekNation", message: "Are you sure you want to mark this section as Complete?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.appData.isComplete = true
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
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
