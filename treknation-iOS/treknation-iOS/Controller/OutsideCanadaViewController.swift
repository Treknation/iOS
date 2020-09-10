//
//  OutsideCanadaViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-09-07.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class OutsideCanadaViewController: UIViewController {

    var appData: AppData!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!
    @IBOutlet weak var detailedLabel: UILabel!

    func setAppData(data : AppData) {
        appData = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        //self.scrollView.contentSize = CGSize(width: 320, height: 960)
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        
        let font = UIFont.systemFont(ofSize: 15)
        let boldFont = UIFont.boldSystemFont(ofSize: 16.0)

      let attributedString = NSMutableAttributedString(string: "There are things you can do to prepare for life in Canada:\n\nUse free pre-arrival services, which help you:\n• Find out more about living and working in Canada\n\nTake steps to get recognition in Canada for your:\n• Education\n• Professional licences/certificates\n\nRead about living and finding work in Canada\n\nWhen you arrive in Canada you must have\n\n• You should have valid passport and/or travel documents\n• Your Confirmation of Permanent Residence (COPR) and your permanent resident visa (if they  gave you one)\n• Proof that you have the funds to support yourself and your family after you arrive in Canada\n\nWhen you arrive in Canada, you’ll meet an officer from the Canada Border Services Agency (CBSA). The officer will:\n• Make sure you’re entering Canada before or on the expiry date shown on your COPR\n• Make sure that you are the same person who was approved to travel to Canada (we may use your biometrics to do this)\n• Ask to see your passport and other travel documents\n• Ask you a few questions to make sure you still meet the terms to immigrate to Canada and the questions will be similar to the ones you answered when you applied\n• You need to disclose to the CBSA officer if you are carrying more than CAN$10,000. If you don’t tell them, you could be fined, and your funds could be seized.", attributes: [
         .font: font,
         .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
         .kern: 0.05
       ])
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 69, length: 11))
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 211, length: 9))
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 223, length: 12))
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 270, length: 18))
       attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 305, length: 39))
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 665, length: 36))
       attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 1212, length: 10))
        
       self.detailedLabel.attributedText = attributedString
       let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
       gesture.numberOfTapsRequired = 1
       detailedLabel.addGestureRecognizer(gesture)
       detailedLabel.isUserInteractionEnabled = true
       detailedLabel.lineBreakMode = .byWordWrapping
        // Do any additional setup after loading the view.
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {

     if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 69, length: 11)){
        let webView = WebViewViewController()
         webView.setLinkURL(link: Constant.URLConstants.preArrival)
        self.navigationController?.pushViewController(webView, animated: true)

     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 211, length: 9)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.education)
         self.navigationController?.pushViewController(webView, animated: true)
     } else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 223, length: 12)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.certifications)
         self.navigationController?.pushViewController(webView, animated: true)
     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 270, length: 18)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.livingAndFinding)
         self.navigationController?.pushViewController(webView, animated: true)
     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 665, length: 36)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.cbsaLink)
         self.navigationController?.pushViewController(webView, animated: true)
     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1212, length: 10)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.moneyAmount)
         self.navigationController?.pushViewController(webView, animated: true)
     }else {
         print("Tapped none")
     }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func markAsComplete(_ sender: Any) {
           appData.isComplete = true
           let alert = UIAlertController(title: "TrekNation", message: "Are you sure you want to mark this section as Complete?", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
               self.navigationController?.popViewController(animated: true)
           }))
           alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
           self.present(alert, animated: true)
    }

}
