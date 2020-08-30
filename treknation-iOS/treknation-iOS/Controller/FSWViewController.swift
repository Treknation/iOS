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
        
        
        
        let attributedString = NSMutableAttributedString(string: "You would need to score a minimum of 67 points out of 100 to qualify for FSW. These points are different from your CRS points. The points will be calculated based on how you meet the below minimum requirements.\n\n• Work Experience\n\t• Skilled work experience of at least 1-\t\t\tyear continuous full time within the last 10 \t\tyears in NOC job groups 0, A, or B which is \t\tpaid.\n\t• Full-time at 1 job: 30 hours/week for 12 \t\tmonths = 1 year full time (1,560 hours)\n\t• Equal amount in part-time: 15 hours/week \t\tfor 24 months = 1 year full time (1,560 hours)\n\t• Full-time at more than 1 job: 30 hours/week \tfor 12 months at more than 1 job = 1-year full \ttime (1,560 hours)\n\n• Language \nGet a minimum score of CLB 7 in all 4 abilities of ECB in either English or French language\n\n• Education\n\t• If you went to school in Canada, you must \t\tsubmit certificate, diploma or degree from a \tCanadian high school or post-secondary \t\tinstitution\n\t• If you have foreign education, you must \t\tsubmit an ECA verified certificate, diploma or \tdegree\n\n• No plans to live in Quebec\n\n• You must show you have enough funds for you and your family to settle in Canada unless you are able to legally work in Canada and have a valid job offer. See more.\n\n\nYou can check your points by visiting this link.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.link, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 1218, length: 8))
        attributedString.addAttribute(.link, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 1273, length: 4))
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
