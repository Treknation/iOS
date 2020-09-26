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
    @IBOutlet weak var cicLabel: UILabel!

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
        let boldFont = UIFont.boldSystemFont(ofSize: 15.0)
        // Do any additional setup after loading the view.
        
        let attributedString = NSMutableAttributedString(string: "Phone Number\n+1 888 242 2100\n\nYou can get in touch with CIC by calling the above provided number. If you are calling from outside Canada, you may require international calling services enabled. You can also try using apps like TextNow, if you are not inside Canada.\n\nWebform\n\nUse the following link to fill out a webform for enquiries and for updating any change in your information - Webform.\n", attributes: [.font: font,
          .foregroundColor: UIColor(red: 101.0 / 255.0, green: 104.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0), .kern: 0.05])
       
//        attributedString.addAttributes([
//          .font: boldFont,
//          .foregroundColor: UIColor(red: 123.0 / 255.0, green: 127.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
//        ], range: NSRange(location: 0, length: 12))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: 12))

        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 13, length: 15))
        
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 267, length: 7))
        
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 385, length: 7))
        
        self.cicLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        cicLabel.addGestureRecognizer(gesture)
        cicLabel.isUserInteractionEnabled = true
        cicLabel.lineBreakMode = .byWordWrapping
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
        
        guard let text = self.cicLabel.attributedText?.string else
        {
            return
        }
        
        let webForm = (text as NSString).range(of: "Webform.")
        
        if sender.didTapAttributedTextInLabel(label: self.cicLabel, inRange:webForm){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.contactWebForm)
           self.navigationController?.pushViewController(webView, animated: true)

        } else  if sender.didTapAttributedTextInLabel(label: self.cicLabel, inRange:NSRange(location: 13, length: 15)){
            let phonenumber = "18882422100"
            guard let number = URL(string: "telprompt://\(phonenumber)") else {
                print("telprompt://\(phonenumber)")
                return }
            UIApplication.shared.open(number)

        }
    }

    @IBAction func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
     }


}
