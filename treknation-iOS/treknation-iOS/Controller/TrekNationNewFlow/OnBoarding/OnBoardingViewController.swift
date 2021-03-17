//
//  OnBoardingViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OnBoardingViewController: TNBaseViewController {
    
    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .whiteColor
        }
    }
    @IBOutlet weak var stepGuideMessageLabel: UILabel! {
        didSet {
            stepGuideMessageLabel.textColor = .darkSlateBlue
            stepGuideMessageLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var getStartedButton: UIButton! {
        didSet {
            getStartedButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            getStartedButton.titleLabel?.font = UIFont.ThinSemiBold14Font
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let userDefaults = UserDefaults.standard
        if let userName = userDefaults.string(forKey: "name"), let email = userDefaults.string(forKey: "email") {
            AppContext.sharedAppContext.userName = userName
            AppContext.sharedAppContext.email = email
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TNTabBarController")
            self.navigationController?.pushViewController(vc, animated: false)
        } else {
            self.logAnalyticsEventsForAction(eventName: "get_started", eventProperties: ["os":"iOS"])
        }
    }
    
    @IBAction func getStartedButtonAction(_ sender: Any) {
        
        let onBoardingStartViewController = OnBoardingStartViewController(nibName: "OnBoardingStartViewController", bundle:nil)
        self.navigationController?.pushViewController(onBoardingStartViewController, animated: true)
    }
}
