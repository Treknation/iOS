//
//  ContactCICViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-09-11.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class ContactCICViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailedLabel: UILabel!
    
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
        // let boldFont = UIFont.boldSystemFont(ofSize: 16.0)
        // Do any additional setup after loading the view.
        
        let attributedString = NSMutableAttributedString(string: "Use the following link to fill out a webform for enquiries and for updating any change in your information - Webform", attributes: [
          .font: font,
          .link: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.link, value: 1, range: NSRange(location: 109, length: 7))
        self.detailedLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailedLabel.addGestureRecognizer(gesture)
        detailedLabel.isUserInteractionEnabled = true
        detailedLabel.lineBreakMode = .byWordWrapping
    }
   
    @IBAction func callCIC(_ sender: Any) {
         if let phoneCallURL = URL(string: "tel://+1 888 242 2100") {
           let application:UIApplication = UIApplication.shared
           if (application.canOpenURL(phoneCallURL)) {
               application.open(phoneCallURL, options: [:], completionHandler: nil)
           }
         }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
    if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 109, length: 7)){
       let webView = WebViewViewController()
        webView.setLinkURL(link: Constant.URLConstants.contactWebForm)
       self.navigationController?.pushViewController(webView, animated: true)

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
