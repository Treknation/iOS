//
//  LanguageTestViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class LanguageTestViewController: UIViewController {
    var appData: AppData!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!

    @IBOutlet weak var costsBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        
        let attributedString = NSMutableAttributedString(string: "There two approved English tests and two for French: \n\n• IRCC-approved English tests:\n  \n  1.  IELTS\n  2. CELPIP\n\n• IRCC-approved French tests:\n  \n  1. TEF Canada\n  2. TCF Canada\n\nFor Express Entry, you need to take the general category for the above-mentioned language tests.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 95, length: 5))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 106, length: 6))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 152, length: 10))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 168, length: 10))
        
        
        detailLabel.attributedText = attributedString
               let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
               gesture.numberOfTapsRequired = 1
               detailLabel.addGestureRecognizer(gesture)
               detailLabel.isUserInteractionEnabled = true
               detailLabel.lineBreakMode = .byWordWrapping
        
        
        
        self.costsBtn.layer.cornerRadius = 6
        self.costsBtn.layer.shadowColor = UIColor.lightGray.cgColor
        self.costsBtn.layer.shadowOpacity = 1
        self.costsBtn.layer.shadowOffset = .zero
        self.costsBtn.layer.shadowRadius = 2
        
        self.resultsBtn.layer.cornerRadius = 6
        self.resultsBtn.layer.shadowColor = UIColor.lightGray.cgColor
        self.resultsBtn.layer.shadowOpacity = 1
        self.resultsBtn.layer.shadowOffset = .zero
        self.resultsBtn.layer.shadowRadius = 2
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange:NSRange(location: 95, length: 5)){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.IELTSLink)
           self.navigationController?.pushViewController(webView, animated: true)

        } else if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: NSRange(location: 106, length: 6)){
            let webView = WebViewViewController()
             webView.setLinkURL(link: Constant.URLConstants.CELPIP)
            self.navigationController?.pushViewController(webView, animated: true)
        }else if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: NSRange(location: 152, length: 10)){
            let webView = WebViewViewController()
             webView.setLinkURL(link: Constant.URLConstants.tefCanada)
            self.navigationController?.pushViewController(webView, animated: true)
        }else if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: NSRange(location: 168, length: 10)){
                let webView = WebViewViewController()
                 webView.setLinkURL(link: Constant.URLConstants.tcfCanada)
                self.navigationController?.pushViewController(webView, animated: true)
        }
        else {
            print("Tapped none")
        }
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
    
    @IBAction func showResultsView(_ sender: Any) {
        let testVC = convertTestViewController()
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
    @IBAction func showCostsVC(_ sender: Any) {
        let costVC = languageCostsViewController()
        self.navigationController?.pushViewController(costVC, animated: true)
    }
}
