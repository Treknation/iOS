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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var titleText : String!
    var descriptionText : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        // Do any additional setup after loading the view.
        self.titleLabel.text = self.titleText
        self.descriptionLabel.text = self.descriptionText

    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTitle(title : String) {
        self.titleText = title
    }
   
    func setDescription(description : String) {
        self.descriptionText = description
    }


}
