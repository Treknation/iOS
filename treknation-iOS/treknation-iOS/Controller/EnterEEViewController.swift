//
//  EnterEEViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class EnterEEViewController: UIViewController {
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
        
        
        let attributedString = NSMutableAttributedString(string: "Steps\n\n• Create GC key account by going to this page(Please do not choose sign in with partner account) . Please remember the 4 security questions and answers thoroughly since you will be asked each time you log in.\n\n• Once you create a GC key account click on an Express Entry button to begin filling your profile.\n\n• Enter personal preference code. This should pre-fill some of the details. Fill in the rest of personal.\n\n\nNote: You have 60 days to fill up and submit your profile.", attributes: [
          .font: UIFont.systemFont(ofSize: 15),
          .foregroundColor: UIColor(red: 90.0 / 255.0, green: 93.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttributes([
          .font: UIFont.boldSystemFont(ofSize: 15.0),
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0)
        ], range: NSRange(location: 0, length: 5))
        
        let conditionRange = (attributedString.string as NSString).range(of: "this page")
        attributedString.addAttribute(.link, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: conditionRange)

        
        self.detailedLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailedLabel.addGestureRecognizer(gesture)
        detailedLabel.isUserInteractionEnabled = true
        detailedLabel.lineBreakMode = .byWordWrapping
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
              guard let text = self.detailedLabel.attributedText?.string else
              {
                  return
              }

              let conditionRange = (text as NSString).range(of: "this page")

              if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:conditionRange){
                 let webView = WebViewViewController()
                  webView.setLinkURL(link: Constant.URLConstants.cgKeyPage)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
