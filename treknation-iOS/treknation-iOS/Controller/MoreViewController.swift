//
//  MoreViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-27.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit
import MessageUI

class MoreViewController: TNBaseViewController , UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.textLabel?.textColor = UIColor(red: 20/256, green: 61/256, blue: 89/256, alpha: 1.0)
        if indexPath.section == 0 {
            cell.textLabel?.text = "About Us"

        } else if indexPath.section == 1 {
            cell.textLabel?.text = "Feedback"

        } else if indexPath.section == 2 {
            cell.textLabel?.text = "Disclaimer"

        } else if indexPath.section == 3 {
            cell.textLabel?.text = "Privacy Policy"

        } else if indexPath.section == 4 {
            cell.textLabel?.text = "Common mistakes to Avoid"
        } else {
            cell.textLabel?.text = "CIC Contact Info"
        }
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let overviewVC = DetailedViewController()
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(overviewVC, animated: true)
            overviewVC.setTitle(title: "About Us")
            overviewVC.setDescription(description: Constant.AppDetailsConstants.aboutUs)
           } else if indexPath.section == 1 {
            self.sendEmail()
           } else if indexPath.section == 2 {
            self.navigationController?.pushViewController(overviewVC, animated: true)
            overviewVC.setTitle(title: "Disclamer")
            overviewVC.setDescription(description:
                Constant.AppDetailsConstants.disclamerPolicy)
           } else if indexPath.section == 3 {
            let privacyPolicy = PrivacyPolicyViewController()
            self.navigationController?.pushViewController(privacyPolicy, animated: true)
        } else if indexPath.section == 4 {
            let commonMistakes = CommonMistakesToAvoidViewController()
            self.navigationController?.pushViewController(commonMistakes, animated: true)
        } else {
            let contactVC = ContactCICViewController()
            self.navigationController?.pushViewController(contactVC, animated: true)

           }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
        @IBAction func sendEmail() {
            // Modify following variables with your text / recipient
            let recipientEmail = "support@treknation.ca"
            let subject = "TrekNation App Feedback"
            let body = "Please enter your feedback here: /n"

            // Show default mail composer
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([recipientEmail])
                mail.setSubject(subject)
                mail.setMessageBody(body, isHTML: false)

                present(mail, animated: true)

            // Show third party email composer if default Mail app is not present
            } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
                UIApplication.shared.open(emailUrl)
            }
        }

        private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
            let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

            let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
            let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

            if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
                return gmailUrl
            } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
                return outlookUrl
            } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
                return yahooMail
            } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
                return sparkUrl
            }

            return defaultUrl
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }

}
