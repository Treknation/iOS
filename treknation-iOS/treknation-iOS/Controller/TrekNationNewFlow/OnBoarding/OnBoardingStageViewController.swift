//
//  OnBoardingStageViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OnBoardingStageViewController: TNBaseViewController {

    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .whiteColor
        }
    }
    @IBOutlet weak var stageMessageLabel: UILabel! {
        didSet {
            stageMessageLabel.textColor = .darkSlateBlue
            stageMessageLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var createdProfileButton: UIButton! {
        didSet {
            createdProfileButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            createdProfileButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    @IBOutlet weak var receivedITAButton: UIButton! {
        didSet {
            receivedITAButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            receivedITAButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    
    @IBOutlet weak var submittedDocsButton: UIButton! {
        didSet {
            submittedDocsButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            submittedDocsButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    @IBOutlet weak var landingProceduresButton: UIButton! {
        didSet {
            landingProceduresButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            landingProceduresButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .whiteColor
    }

    @IBAction func createdProfileButtonAction(_ sender: Any) {
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_value", eventProperties: ["value":"Created Profile"])
        
        createdProfileButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            Utility.completeStageWithSteps(stepsComplete:5)
            let onBoardingPersonlizedViewController = OnBoardingPersonlizedViewController(nibName: "OnBoardingPersonlizedViewController", bundle:nil)
            onBoardingPersonlizedViewController.userStage = "Created Profile"
            self.navigationController?.pushViewController(onBoardingPersonlizedViewController, animated: true)
        }
    }
    
    @IBAction func receivedITAButtonAction(_ sender: Any) {
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_value", eventProperties: ["value":"Received ITA"])
        
        receivedITAButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            Utility.completeStageWithSteps(stepsComplete:6)
            let onBoardingPersonlizedViewController = OnBoardingPersonlizedViewController(nibName: "OnBoardingPersonlizedViewController", bundle:nil)
            onBoardingPersonlizedViewController.userStage = "Received ITA"
            self.navigationController?.pushViewController(onBoardingPersonlizedViewController, animated: true)
        }
    }
    
    @IBAction func submittedDocsButtonAction(_ sender: Any) {
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_value", eventProperties: ["value":"Submitted Docs"])
        
        submittedDocsButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            Utility.completeStageWithSteps(stepsComplete:8)
            let onBoardingPersonlizedViewController = OnBoardingPersonlizedViewController(nibName: "OnBoardingPersonlizedViewController", bundle:nil)
            onBoardingPersonlizedViewController.userStage = "Submitted Docs"
            self.navigationController?.pushViewController(onBoardingPersonlizedViewController, animated: true)
        }
    }
    
    @IBAction func landingProceduresButtonAction(_ sender: Any) {
        
        self.logAnalyticsEventsForAction(eventName: "stage_pr_process_value", eventProperties: ["value":"Landing Procedures"])
        
        landingProceduresButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            Utility.completeStageWithSteps(stepsComplete:10)
            let onBoardingPersonlizedViewController = OnBoardingPersonlizedViewController(nibName: "OnBoardingPersonlizedViewController", bundle:nil)
            onBoardingPersonlizedViewController.userStage = "Landing Procedures"
            self.navigationController?.pushViewController(onBoardingPersonlizedViewController, animated: true)
        }
    }
}
