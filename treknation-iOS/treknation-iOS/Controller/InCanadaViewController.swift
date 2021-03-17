//
//  InCanadaViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-09-07.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class InCanadaViewController: UIViewController {

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

        let attributedString = NSMutableAttributedString(string: "IRCC contact you and let you know what to do next.\nYou’ll need to have a short interview with an officer. You have two options for your interview:\n• Make an appointment at one of our offices in Canada (best option)\n• Go to a Canadian “port of entry” (border crossing), and present proof that you have the funds to support yourself and your family and your Confirmation of Permanent Residence (COPR) and your permanent resident visa (if applicable).\n\nDuring the interview the officer will:\n• Make sure all your documents are valid\n• Ask you a few questions to make sure you still meet the terms to immigrate to Canada\n• Confirm your Canadian mailing address, so we can mail your permanent resident card (PR card)\n\nIf you change your address within 180 days of getting your status, you must tell IRCC using the Webform.", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 157, length: 11))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 809, length: 7))
        
        self.detailedLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailedLabel.addGestureRecognizer(gesture)
        detailedLabel.isUserInteractionEnabled = true
        detailedLabel.lineBreakMode = .byWordWrapping
        // Do any additional setup after loading the view.
    }

    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {

     if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 157, length: 11)){
        let webView = WebViewViewController()
         webView.setLinkURL(link: Constant.URLConstants.inCanadaAppointment)
        self.navigationController?.pushViewController(webView, animated: true)

     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 809, length: 7)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.inCanadaWebForm)
         self.navigationController?.pushViewController(webView, animated: true)
     } else {
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
