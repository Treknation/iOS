//
//  convertTestViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-30.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class convertTestViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.layer.cornerRadius = 10
         self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
         self.backgroundView.layer.shadowOpacity = 1
         self.backgroundView.layer.shadowOffset = .zero
         self.backgroundView.layer.shadowRadius = 3
        // Do any additional setup after loading the view.
        
        let attributedString = NSMutableAttributedString(string: "For each test, there is a conversion table from the test mark per ability (speaking, reading, listening, writing) to the Canadian Level Benchmark (CLB). CLBs are the norm for assessing language ability by IRCC. You can check your conversion through this link.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 254, length: 4))
        
        detailLabel.attributedText = attributedString
               let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
               gesture.numberOfTapsRequired = 1
               detailLabel.addGestureRecognizer(gesture)
               detailLabel.isUserInteractionEnabled = true
               detailLabel.lineBreakMode = .byWordWrapping
        
    }

    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange:NSRange(location: 254, length: 5)){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.converResultsLink)
           self.navigationController?.pushViewController(webView, animated: true)

        }
        else {
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
