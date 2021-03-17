//
//  OnBoardingStartViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OnBoardingStartViewController: TNBaseViewController {

    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .whiteColor
        }
    }
    @IBOutlet weak var startMessageLabel: UILabel! {
        didSet {
            startMessageLabel.textColor = .darkSlateBlue
            startMessageLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var yesButton: UIButton! {
        didSet {
            yesButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            yesButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    @IBOutlet weak var noButton: UIButton! {
        didSet {
            noButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            noButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .whiteColor
    }
    
    @IBAction func yesButtonAction(_ sender: Any) {
//        AppContext.sharedAppContext.isFirstTimeUser = false
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_select", eventProperties: ["value":"yes"])
        
        yesButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            let onBoardingStageViewController = OnBoardingStageViewController(nibName: "OnBoardingStageViewController", bundle:nil)
            self.navigationController?.pushViewController(onBoardingStageViewController, animated: true)
        }
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
//        AppContext.sharedAppContext.isFirstTimeUser = true
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_select", eventProperties: ["value":"no"])
        
        noButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            let onBoardingPersonlizedViewController = OnBoardingPersonlizedViewController(nibName: "OnBoardingPersonlizedViewController", bundle:nil)
            self.navigationController?.pushViewController(onBoardingPersonlizedViewController, animated: true)
        }
    }
}

























