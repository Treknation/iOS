//
//  CRSScoreViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class CRSScoreViewController: UIViewController {
    var appData: AppData!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

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
        
        
        let overviewString = NSMutableAttributedString(string: "Express Entry is a competitive system that chooses applicants with the highest CRS score in the pool for giving ITA. You should try to achieve the highest points possible to increase your chances of getting an ITA. Use this link to check your CRS Score. Below are some of the ways of increasing your CRS score.", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        overviewString.addAttribute(.link, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 243, length: 9))
        
        overviewLabel.attributedText = overviewString
        let ogesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTapOverview(_:)))
        ogesture.numberOfTapsRequired = 1
        overviewLabel.addGestureRecognizer(ogesture)
        overviewLabel.isUserInteractionEnabled = true
        overviewLabel.lineBreakMode = .byWordWrapping
        
        
        
        
        let attributedString = NSMutableAttributedString(string: "Language Proficiency\n\n• Increasing the points with the language test is the easiest and surest way of increasing the CRS score. So, it\'s best if you give the language test after sufficient practice. For example, increasing your score from CLB 7 to CLB 9 in each section increases your score by 14 points per section. So, in total your points increase by a total of 56 (14 x 4).\n• You can also earn extra points for your Secondary language abilities. You can earn 4 additional points if you get the score in the below range:\n\n\t• Speaking, Listening and Writing: \n\tCLB 5 - CLB 9\n\t• Reading: CLB 4 - CLB 9\n\nEducation Points\n\n• If you have a master\'s degree or have more than 1 degree from outside Canada, it is beneficial to submit the education Assessment for all the degrees and not just for the highest degree as it gives you points for the additional degrees as well. This does not cost an additional amount if done in one take.\n• You can earn 15 points if you get a 1-year Canadian degree and 30 points if your Canadian degree is 2 years or more in duration.\n• You earn an additional 50 points if Canadian education combined with Canadian work experience.\n\nNon - Canadian Work Experience\n\n• If your work experience outside Canada is less than 3 years, you can wait till you have completed 3 years. This will help you gain additional points in work experience. Receiving CLB 9 in ECA, along with 3 years of work experience can also add additional points.\n\nSpouse Points\n\n• Depending on who is the primary applicant, your total points can change. If you are the primary applicant and your age is 40 years and your spouse’s age is 28 years, all other factors being the same, it could be beneficial to make your spouse the primary applicant since she gets additional points for age.\n\nJob Offer Points\n\n• You can earn 200 points if you have a job offer that belongs to NOC 00(Senior Management) and 50 points if have a job offer that belongs to NOC 0, A, or B.\n\nProvincial Nominee Programs\n\n• If you are short of points even after trying all the above methods, you should try to apply for PNP. Getting a nomination through PNP gives you an additional 600 points. You can find more information for PNP for each of the provinces at this link.", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 101.0 / 255.0, green: 104.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: 20))
//        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 90.0 / 255.0, green: 93.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0), range: NSRange(location: 252, length: 1))
//        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 80.0 / 255.0, green: 83.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0), range: NSRange(location: 257, length: 4))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 604, length: 16))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1159, length: 30))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1457, length: 13))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1782, length: 16))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1959, length: 27))
        attributedString.addAttribute(.link, value: UIColor(red: 5.0 / 255.0, green: 135.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0), range: NSRange(location: 2232, length: 4))
        
        
        detailLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailLabel.addGestureRecognizer(gesture)
        detailLabel.isUserInteractionEnabled = true
        detailLabel.lineBreakMode = .byWordWrapping

        
        
    }

    @objc func handleTapOverview(_ sender: UITapGestureRecognizer) {
        if sender.didTapAttributedTextInLabel(label: self.overviewLabel, inRange:NSRange(location: 243, length: 10)){
            let webView = WebViewViewController()
                webView.setLinkURL(link: Constant.URLConstants.crsOverview)
                self.navigationController?.pushViewController(webView, animated: true)
        } else {
            print("Tapped none")
        }
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let text = self.detailLabel.attributedText?.string else
               {
                   return
               }
        let conditionRange = (text as NSString).range(of: "link.")

           if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: conditionRange){
                let webView = WebViewViewController()
                 webView.setLinkURL(link: Constant.URLConstants.crsLink)
                self.navigationController?.pushViewController(webView, animated: true)
            } else {
                print("Tapped none")
            }
        }


        @IBAction func markAsComplete(_ sender: Any) {
            let alert = UIAlertController(title: "TrekNation", message: "Are you sure you want to mark this section as Complete?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.appData.isComplete = true
                self.navigationController?.popViewController(animated: true)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
        @IBAction func back(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
    

    
}
