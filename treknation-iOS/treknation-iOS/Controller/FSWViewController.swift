//
//  FSWViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class FSWViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        let boldFont = UIFont.boldSystemFont(ofSize: 15.0)

        
        let attributedString = NSMutableAttributedString(string: "You would need to score a minimum of 67 points out of 100 to qualify for FSW. These points are different from your CRS points. The points will be calculated based on how you meet the below minimum requirements.\n\nWork Experience\n• Skilled work experience of at least 1- year continuous full time within the last 10 years in NOC job groups 0, A, or B which is paid.\n• Full-time at 1 job: 30 hours/week for 12 months = 1 year full time (1,560 hours).\n• Equal amount in part-time: 15 hours/week for 24 months = 1 year full time (1,560 hours).\n• Full-time at more than 1 job: 30 hours/week for 12 months at more than 1 job = 1-year full time (1,560 hours).\n\nLanguage \nGet a minimum score of CLB 7 in all 4 abilities of ECB in either English or French language\n\nEducation\n• If you went to school in Canada, you must submit certificate, diploma or degree from a Canadian high school or post-secondary institution\n• If you have foreign education, you must submit an ECA verified certificate, diploma or degree\n\nNo plans to live in Quebec\n\nProof Of Funds\nYou must show you have enough funds for you and your family to settle in Canada unless you are able to legally work in Canada and have a valid job offer. See more.\n\nYou can check your points by visiting this link.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 212, length: 15))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 653, length: 8))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 756, length: 9))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1003, length: 42))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 1200, length: 8))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 1254, length: 4))
        
        
        let conditionRange = (attributedString.string as NSString).range(of: "See more")
        let cancellationRange = (attributedString.string as NSString).range(of: "link.")
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: conditionRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: cancellationRange)
        // Do any additional setup after loading the view.
        
        self.detailLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailLabel.addGestureRecognizer(gesture)
        detailLabel.isUserInteractionEnabled = true
        detailLabel.lineBreakMode = .byWordWrapping

    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
           guard let text = self.detailLabel.attributedText?.string else
           {
               return
           }

           let conditionRange = (text as NSString).range(of: "See more")
           let cancellationRange = (text as NSString).range(of: "link.")

           if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange:conditionRange){
              let webView = WebViewViewController()
               webView.setLinkURL(link: Constant.URLConstants.fundsPoofFSW)
              self.navigationController?.pushViewController(webView, animated: true)

           } else if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: cancellationRange){
               let webView = WebViewViewController()
                webView.setLinkURL(link: Constant.URLConstants.fswLink)
               self.navigationController?.pushViewController(webView, animated: true)
           } else {
               print("Tapped none")
           }
       }

}
