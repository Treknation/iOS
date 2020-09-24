//
//  PrivacyPolicyViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-09-11.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit
import MessageUI

class PrivacyPolicyViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
         
        // Do any additional setup after loading the view.
        let font = UIFont.systemFont(ofSize: 15)
        let boldFont = UIFont.boldSystemFont(ofSize: 15.0)
        let attributedString = NSMutableAttributedString(string: "Privacy Policy\n\nTrekNation Technologies built the TrekNation app as a Free app. This SERVICE is provided by TrekNation Technologies at no cost and is intended for use as is.\n\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at TrekNation unless otherwise defined in this Privacy Policy.\n\nInformation Collection and Use\n\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.\n\nThe app does use third-party services that may collect information used to identify you.\n\nLink to the privacy policy of third party service providers used by the app\n\n• Google Play Services\n\nLog Data\n\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n\nCookies\n\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device\'s internal memory.\n\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\nService Providers\n\nWe may employ third-party companies and individuals due to the following reasons:\n\n• To facilitate our Service;\n• To provide the Service on our behalf;\n• To perform Service-related services; or\n• To assist us in analyzing how our Service is used.\n\nWe want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\nSecurity\n\nWe value your trust in providing us with your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n\nLinks to Other Sites\n\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\nChildren’s Privacy\n\nThese Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.\n\nChanges to This Privacy Policy\n\nWe may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\n\nThis policy is effective as of 2020-09-07\n\nContact Us\n\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at support@treknation.ca ", attributes: [
          .font: font,
          .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
          .kern: 0.05
        ])
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: 14))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 823, length: 30))
        attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 1259, length: 20))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1281, length: 8))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 1732, length: 7))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 2347, length: 17))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 2879, length: 8))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 3205, length: 20))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 3622, length: 18))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 4099, length: 30))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 4381, length: 10))
        attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 4493, length: 21))
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

        let conditionRange = (text as NSString).range(of: "Google Play Services")
        let cancellationRange = (text as NSString).range(of: "support@treknation.ca")
        
        
    if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange:conditionRange){
       let webView = WebViewViewController()
        webView.setLinkURL(link: Constant.URLConstants.googlePlay)
       self.navigationController?.pushViewController(webView, animated: true)

    }else if sender.didTapAttributedTextInLabel(label: self.detailedLabel, inRange: cancellationRange){
        self.sendEmail()
        }
    }
    @IBAction func sendEmail() {
        // Modify following variables with your text / recipient
        let recipientEmail = "support@treknation.ca"
        let subject = "TrekNation App Privacy Policy"
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
    
    @IBAction func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
