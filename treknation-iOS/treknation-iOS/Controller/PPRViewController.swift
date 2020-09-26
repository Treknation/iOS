//
//  PPRViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class PPRViewController: UIViewController {
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
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
        
        let font = UIFont.systemFont(ofSize: 15)
        //let boldFont = UIFont.boldSystemFont(ofSize: 16.0)
        let attributedString = NSMutableAttributedString(string: "After you submit your e-APR you get an AOR which is a confirmation that your application was received by IRCC and they have created a file with your application number. After you submit your application, you can use this Webform if you need to report important changes to your application such as:\n\n• Changes in address, telephone number, email or other contact information\n• Births or deaths in your immediate family                   • Marriages or divorces\n• Adoptions\n• Changes to your job or job offer\n• A new educational credential\n• Updated language test results\n\nIRCC will communicate with you through your online account to:\n\n• Tell you to give your biometrics and medical\n• Confirm that they have reviewed your application\n• Send you updates on the status of your application\n• Ask you for more documents, if necessary\n• Set up an interview, if necessary\n• Tell you what you need to do and what will happen next\n\nIRCC will decide on your application depending on:\n\n• Whether you meet the eligibility criteria for the program\n• Whether you’re admissible to Canada, based on the results of your\n\t• Medical exam\n\t• Police certificates\n\t• Background checks\n\nIf your application is Rejected and you would like to be considered for future rounds, then:\n\n• Fill out and submit a new Express Entry profile\n• Meet the eligibility criteria\n• Be accepted into the pool again\n\nIf your application is approved then you would need to send your passport to IRCC, who will then mail you a:\n\n• Confirmation of Permanent Residence (COPR)\n• A permanent resident visa (if you\'re from a country that requires a visa)\n\nYour COPR will have information about who you are, as well as your photograph. Your COPR is valid for a limited time so use it before it expires.", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 112.0 / 255.0, green: 116.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 4.0 / 255.0, green: 146.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0), range: NSRange(location: 221, length: 7))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 3.0 / 255.0, green: 157.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0), range: NSRange(location: 1273, length: 34))
        
        self.detailedLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailedLabel.addGestureRecognizer(gesture)
        detailedLabel.isUserInteractionEnabled = true
        detailedLabel.lineBreakMode = .byWordWrapping
        
        if appData.isComplete {
            self.isCompletedBtn.setTitle("Completed", for: .normal)
        } else {
            self.isCompletedBtn.setTitle("Mark as Complete", for: .normal)
        }
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {

     if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 221, length: 7)){
        let webView = WebViewViewController()
         webView.setLinkURL(link: Constant.URLConstants.aorWebForm)
        self.navigationController?.pushViewController(webView, animated: true)

     }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1273, length: 34)){
         let webView = WebViewViewController()
          webView.setLinkURL(link: Constant.URLConstants.submitProfile)
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
            UserDefaults.standard.setValue(true, forKey: self.appData.title)

           }))
           alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
           self.present(alert, animated: true)
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
