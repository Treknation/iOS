//
//  DocumentChecklistViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-26.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class DocumentChecklistViewController: UIViewController {
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
        
        let attributedString = NSMutableAttributedString(string: "Once you fill out the post ITA application forms a personalized document checklist is created for you. Since you only have 60 days to gather all documents and to submit them we recommend starting the process ASAP so that you can avoid delays.\n\nThe document checklist is mostly made up of the following section. You would need to upload documents in each of these sections. You would need to make sure that the size of the file is no larger than 4 MB. The file formats you can upload are .tiff, .jpg, .png, .doc, .docx and .pdf.\n \nIdentification documents\n• Passport\n• Marriage Certificate / Common law proof/ Divorce-Proof\n• Dependent Children (Birth Certificate, LOE if you don\'t have the birth certificate, proof of adoption)\n• Digital Photograph (See specification - Link)\n\nMandatory documents\n• Police Certification\n• Medical Exam\n• Proof of funds\n\nOther documents as applicable\n• Work experience\n• Study\n• Canadian Job offer\n• Relatives\n• Certificate of qualification\n• Other names\n• Use of representative\n\nTips\n\nIf one of your documents is in a language other than English or French, you must also upload:\n• An English or French translation\n• A certified photocopy of the original document\n• An affidavit from the person who completed the translation (if they’re not a certified translator)\n\nIf a certified translator completed your translation:\n\n• The document must be stamped with the translator’s certification or registration number\n• You can indicate that you’re not providing an affidavit because a certified translator completed the translation (write a letter and scan it with your translated document)\n\nIf you feel like a document you are submitting might raise the slightest question from an immigration officer, you should add a Letter of Explanation (LoE) (sample in the link) to your documents. For example, if it concerns your passport section, then add your LoE to the PDF file that you will upload to the passport section.", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 112.0 / 255.0, green: 116.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 530, length: 24))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 777, length: 19))
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 837, length: 14))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 853, length: 29))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1012, length: 4))
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1151, length: 19))
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1201, length: 9))
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1275, length: 20))
        //attributedString.addAttribute(.foregroundColor, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1303, length: 20))
        attributedString.addAttribute(.link, value: UIColor(red: 2.0 / 255.0, green: 167.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0), range: NSRange(location: 1746, length: 21))
        
        
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

                 if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:NSRange(location: 837, length: 14)){
                    let webView = WebViewViewController()
                     webView.setLinkURL(link: Constant.URLConstants.documentProofOffunds)
                    self.navigationController?.pushViewController(webView, animated: true)

                 }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1151, length: 19)){
                     let webView = WebViewViewController()
                      webView.setLinkURL(link: Constant.URLConstants.checklistPhotocopy)
                     self.navigationController?.pushViewController(webView, animated: true)
                 } else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1201, length: 9)){
                     let webView = WebViewViewController()
                      webView.setLinkURL(link: Constant.URLConstants.checklistAffidavit)
                     self.navigationController?.pushViewController(webView, animated: true)
                 } else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1275, length: 20)){
                     let webView = WebViewViewController()
                      webView.setLinkURL(link: Constant.URLConstants.checklistTranslator)
                     self.navigationController?.pushViewController(webView, animated: true)
                 }
                 else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1303, length: 20)){
                     let webView = WebViewViewController()
                      webView.setLinkURL(link: Constant.URLConstants.checklistTranslator)
                     self.navigationController?.pushViewController(webView, animated: true)
                 }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: NSRange(location: 1746, length: 21)){
                     let webView = WebViewViewController()
                      webView.setLinkURL(link: Constant.URLConstants.checklistLOE)
                     self.navigationController?.pushViewController(webView, animated: true)
                 }
                 else {
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


}
