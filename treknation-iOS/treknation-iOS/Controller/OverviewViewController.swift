//
//  OverviewViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!
    @IBOutlet weak var hyperlinkLBL: UILabel!

    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    var appData: AppData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.isCompletedBtn.layer.cornerRadius = 15
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        let attributedString = NSMutableAttributedString(string: "It usually takes 6 months after you receive your ITA.  \n\nIt may take additional time for other processes such as educational document verification, police verification, medical test and language test. These processes can take up to an additional 9 weeks. We suggest you visit this link and check your processing time - here.", attributes: [
            .font: hyperlinkLBL.font!,
          .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 319, length: 4))

        hyperlinkLBL.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        hyperlinkLBL.addGestureRecognizer(gesture)
        hyperlinkLBL.isUserInteractionEnabled = true
        hyperlinkLBL.lineBreakMode = .byWordWrapping
        
        if appData.isComplete {
            self.isCompletedBtn.setTitle("Completed", for: .normal)
        } else {
            self.isCompletedBtn.setTitle("Mark as Complete", for: .normal)
        }
    }

    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let text = self.hyperlinkLBL.attributedText?.string else
        {
            return
        }

        let conditionRange = (text as NSString).range(of: "here")

        if sender.didTapAttributedTextInLabel(label: self.hyperlinkLBL, inRange:conditionRange){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.overviewHere)
           self.navigationController?.pushViewController(webView, animated: true)

        } else {
            print("Tapped none")
        }
    }
    
    func setAppData(data : AppData) {
        appData = data
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
        if AppContext.sharedAppContext.canCompleteCurrentStep(appData: appData, vc: self) {
            let alert = UIAlertController(title: "TrekNation", message: "Are you sure you want to mark this section as Complete?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.appData.isComplete = true
                self.navigationController?.popViewController(animated: true)
                UserDefaults.standard.setValue(true, forKey: self.appData.title)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func goback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
