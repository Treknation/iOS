//
//  AfterSpalshOnBoardingViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class AfterSpalshOnBoardingViewController: TNBaseViewController {
    
    @IBOutlet weak var treknationLogoImageView: UIImageView!
    @IBOutlet weak var afterOnboardingMessageLabel: UILabel! {
        didSet {
            afterOnboardingMessageLabel.textColor = .darkSlateBlue
            afterOnboardingMessageLabel.font = UIFont.SourceSansProSemiBold24Font
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
//        let jeremyGif = UIImage.gif(name: "gif")
        treknationLogoImageView.loadGif(name: "gif")
        
        afterOnboardingMessageLabel.text = """
        Hold tight, \(AppContext.sharedAppContext.userName.capitalized)!
        We are personalizing your journey.
        """
        
        AppContext.sharedAppContext.saveInfoToUserDefaults()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TNTabBarController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

