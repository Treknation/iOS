//
//  EPRViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class EPRViewController: UIViewController {
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
        let boldFont = UIFont.boldSystemFont(ofSize: 16.0)
        let attributedString = NSMutableAttributedString(string: "There are 3 types of fees that you would need to pay for your e-APR:\n\n• Processing fees: You need to pay a processing fee for yourself and your dependents who are part of the application. Usually, the fee is around 825 CAD per person and 225 CAD for a dependent child\n\n• Right of Permanent Residence fee: You would need to pay 500 CAD for the Right to Permanent residence fee. You can pay the fee along with the processing fee to avoid delays or wait until IRCC approves your application. We recommend you pay this fee along with the Processing Fee. Note that this fee is paid per application hence you will not be required to pay for each individual in your application. This fee can be refunded if your application is rejected\n\n• Biometrics fees: In most cases, you must pay a biometrics fee when you submit your application. Otherwise, you may experience delays. The biometrics fee covers the cost of collecting fingerprints and a digital photo and usually costs 85 CAD per person. After you pay the biometrics fee with a complete application, IRCC will send you a letter confirming that you need to give your biometrics and where you can go. You must show this letter when you give your biometrics. You must give your biometrics in person. Make sure to book an appointment if this service is offered. Find a collection point close to you.\n\nYou can see the complete fee list here \n\nRefunds\nIf your application isn’t complete, you can get a refund for:\n• Processing fee\n• Right of permanent residence fee (if you’ve paid it)\nYou won’t get a refund of the processing fee once IRCC starts processing your application. \n\nAfter you submit your application, you can use this Webform if you need to report important changes in your application", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 123.0 / 255.0, green: 127.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 1.0 / 255.0, green: 185.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0), range: NSRange(location: 1378, length: 4))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1385, length: 7))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 4.0 / 255.0, green: 146.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0), range: NSRange(location: 1672, length: 7))
        
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

        if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 1378, length: 4)){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.feelist)
           self.navigationController?.pushViewController(webView, animated: true)

        }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1672, length: 7)){
            let webView = WebViewViewController()
             webView.setLinkURL(link: Constant.URLConstants.webform)
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
