//
//  DetailedViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-27.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
