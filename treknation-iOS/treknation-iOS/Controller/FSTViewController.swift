//
//  FSTViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class FSTViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!

    @IBOutlet weak var detailedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        // Do any additional setup after loading the view.
        let attributedString = NSMutableAttributedString(string: "To qualify for FST, you must meet the below minimum requirements\n\n• Work Experience\n\t• Skilled work experience of at least 2 year \t\tfull time within the last 5 years in NOC job \t\tgroups B which is paid for the below major \t\tgroups.\n\t• Major Group 72, industrial, electrical and \t\tconstruction trades\n\t• Major Group 73, maintenance and \t\t\tequipment operation trades\n\t• Major Group 82, supervisors and  technical \t\tjobs in natural resources, agriculture, and \t\trelated production\n\t• Major Group 92, processing, manufacturing \tand utility supervisors and central control \t\toperators\n\t• Minor Group 632, chefs and cooks\n\t• Minor Group 633, butchers and bakers\n\n• Job Offer\nMust have a valid job offer for a total period of at least 1 year OR a certificate of qualification in that skilled trade issued by a Canadian authority\n\n• Language \nGet a minimum score of CLB 5 for speaking and listening and CLB 4 for reading and writing\n\n• Education\nThere are no minimum education requirements for FST, but\n\t• If you went to school in Canada, you can \t\tsubmit certificate, diploma or degree from a \tCanadian high school or post-secondary \t\tinstitution to earn extra CRS points\n\t• If you have foreign education, you can \t\tsubmit an ECA verified certificate, diploma or \tdegree to earn extra CRS points\n\n• No plans to live in Quebec\n\n• You must show you have enough funds for you and your family to settle in Canada unless you are able to legally work in Canada and have a valid job offer. See more.\n\n\nYou can also use the Come to Canada tool to confirm your eligibility and your personal reference code. This reference code will keep your record with IRCC and will pre-populate the forms with your details when you create your profile on CIC. Personal reference code is valid only for 60 days. See more.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1476, length: 8))
        
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 112.0 / 255.0, green: 116.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0), range: NSRange(location: 1789, length: 1))
        
        //attributedString.addAttribute(.foregroundColor, value: UIColor(red: 112.0 / 255.0, green: 116.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0), range: NSRange(location: 1290, length: 185))
        //attributedString.addAttribute(.foregroundColor, value: UIColor(red: 112.0 / 255.0, green: 116.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0), range: NSRange(location: 1484, length: 296))
        //attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1781, length: 8))
        
        self.detailedLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailedLabel.addGestureRecognizer(gesture)
        detailedLabel.isUserInteractionEnabled = true
        detailedLabel.lineBreakMode = .byWordWrapping
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {

           if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 1476, length: 8)){
              let webView = WebViewViewController()
               webView.setLinkURL(link: Constant.URLConstants.fstJobOffer)
              self.navigationController?.pushViewController(webView, animated: true)

           } else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1781, length: 8)){
               let webView = WebViewViewController()
                webView.setLinkURL(link: Constant.URLConstants.fstSecondLink)
               self.navigationController?.pushViewController(webView, animated: true)
           } else {
               print("Tapped none")
           }
       }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
