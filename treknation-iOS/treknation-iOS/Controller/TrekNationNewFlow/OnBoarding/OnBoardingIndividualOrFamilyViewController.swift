//
//  OnBoardingIndividualOrFamilyViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class OnBoardingIndividualOrFamilyViewController: TNBaseViewController {
    
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
    @IBOutlet weak var individualButton: UIButton! {
        didSet {
            individualButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            individualButton.tag = 1
            individualButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    @IBOutlet weak var familyButton: UIButton! {
        didSet {
            familyButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            familyButton.tag = 1
            familyButton.titleLabel?.font = UIFont.ThinMedium14Font
        }
    }
    
    @IBOutlet weak var startMyJourneyButton: UIButton! {
        didSet {
            startMyJourneyButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            startMyJourneyButton.isHidden = true
            startMyJourneyButton.titleLabel?.font = UIFont.ThinSemiBold14Font
        }
    }
    
    @IBOutlet weak var customPageControl: CustomPageControl!
    
    @IBOutlet weak var checkBoxButton: UIButton! {
        didSet {
            checkBoxButton.backgroundColor = .clear
            checkBoxButton.layer.borderWidth = 1.0
            checkBoxButton.layer.borderColor = UIColor.darkSlateBlue.cgColor
            checkBoxButton.tag = 1
        }
    }
    @IBOutlet weak var selectionView: UIView! {
        didSet {
            selectionView.backgroundColor = .darkSlateBlue
            selectionView.isHidden = true
        }
    }
    @IBOutlet weak var tncLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startMessageLabel.text = "Are you going to apply as an individual or with a family?"
        
        tncLabel.attributedText = NSAttributedString(string: "I accept the terms & conditions.", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.font: UIFont.SourceSansProRegular14Font, NSAttributedString.Key.foregroundColor: UIColor.darkSlateBlue])
        view.backgroundColor = .whiteColor
    }
    
    @IBAction func checkboxButtonAction(_ sender: Any) {
        if checkBoxButton.tag == 1 {
            checkBoxButton.tag = 2
            if individualButton.tag == 2 || familyButton.tag == 2 {
                startMyJourneyButton.isHidden = false
                customPageControl.isHidden = true
            } else {
                startMyJourneyButton.isHidden = true
                customPageControl.isHidden = false
            }
        } else {
            checkBoxButton.tag = 1
            startMyJourneyButton.isHidden = true
            customPageControl.isHidden = false
        }
        selectionView.isHidden = checkBoxButton.tag == 1 ? true : false

    }
    
    @IBAction func termsAndConditionButtonAction(_ sender: Any) {
        showTermsAndConditionScreen()
    }
    
    func showTermsAndConditionScreen() {
        let latestBlogViewController = LatestBlogViewController(nibName: "LatestBlogViewController", bundle:nil)
        latestBlogViewController.urlString = "https://treknation.ca/terms-and-conditions/"
        latestBlogViewController.titleStringForController = "Terms & Conditions"
        self.navigationController?.pushViewController(latestBlogViewController, animated: true)
    }
    
    @IBAction func individualButtonAction(_ sender: Any) {
        if checkBoxButton.tag == 1 {
            startMyJourneyButton.isHidden = true
            customPageControl.isHidden = false
        } else {
            startMyJourneyButton.isHidden = false
            customPageControl.isHidden = true
        }
        
        if individualButton.tag == 1 {
            individualButton.tag = 2
            individualButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            
            familyButton.tag = 1
            familyButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
        } else {
            individualButton.tag = 1
            individualButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            startMyJourneyButton.isHidden = true
            customPageControl.isHidden = false
        }
    }
    
    @IBAction func familyButtonAction(_ sender: Any) {
        if checkBoxButton.tag == 1 {
            startMyJourneyButton.isHidden = true
            customPageControl.isHidden = false
        } else {
            startMyJourneyButton.isHidden = false
            customPageControl.isHidden = true
        }
        
        if familyButton.tag == 1 {
            familyButton.tag = 2
            familyButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            
            individualButton.tag = 1
            individualButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
        } else {
            familyButton.tag = 1
            familyButton.applyRoundedBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            
            startMyJourneyButton.isHidden = true
            customPageControl.isHidden = false
        }
    }
    
    @IBAction func startMyJourneyButtonAction(_ sender: Any) {
        
        if familyButton.tag == 1 {
            self.logAnalyticsEventsForAction(eventName: "no_of_applications", eventProperties: ["value":"Family"])
        } else {
            self.logAnalyticsEventsForAction(eventName: "no_of_applications", eventProperties: ["value":"Individual"])
        }
        
        let afterSpalshOnBoardingViewController = AfterSpalshOnBoardingViewController(nibName: "AfterSpalshOnBoardingViewController", bundle:nil)
        self.navigationController?.pushViewController(afterSpalshOnBoardingViewController, animated: true)
    }
}
