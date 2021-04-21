//
//  OnBoardingInsideCanadaViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class OnBoardingInsideCanadaViewController: TNBaseViewController {
    
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
        
        self.logAnalyticsEventsForAction(eventName: "location_details", eventProperties: ["value":"inside"])
        
        AppContext.sharedAppContext.saveInfoToUserCanadaDefaults(value: "Yes")
        
        yesButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            let onBoardingIndividualOrFamilyViewController = OnBoardingIndividualOrFamilyViewController(nibName: "OnBoardingIndividualOrFamilyViewController", bundle:nil)
            self.navigationController?.pushViewController(onBoardingIndividualOrFamilyViewController, animated: true)
        }
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
        
        self.logAnalyticsEventsForAction(eventName: "location_details", eventProperties: ["value":"outside"])
        
        AppContext.sharedAppContext.saveInfoToUserCanadaDefaults(value: "No")
        
        noButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
            let onBoardingIndividualOrFamilyViewController = OnBoardingIndividualOrFamilyViewController(nibName: "OnBoardingIndividualOrFamilyViewController", bundle:nil)
            self.navigationController?.pushViewController(onBoardingIndividualOrFamilyViewController, animated: true)
        }
    }
}
