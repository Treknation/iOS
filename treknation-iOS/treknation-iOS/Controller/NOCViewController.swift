//
//  NOCViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-09.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class NOCViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var appData: AppData!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var isCompletedBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: 320, height: 960)
        let font = UIFont.systemFont(ofSize: 15)
        let boldFont = UIFont.boldSystemFont(ofSize: 15.0)

 let attributedString = NSMutableAttributedString(string: "For immigration purposes, the main job groups are:\n\n• Skill Type 0: Management jobs, such as restaurant managers, mine managers, shore captains (fishing), etc. \n\n• Skill Type A: Professional jobs that usually call for a degree from a university, such as doctors, dentists, architects, etc.\n\n• Skill Type B: Technical jobs and skilled trades that usually call for a college diploma or training as an apprentice, such as chefs, plumbers, electricians, etc.\n\n• Skill Type C: Intermediate jobs that usually call for high school and/or job-specific training, such as industrial butchers, long-haul truck drivers, food and beverage servers, etc. \n\n• Skill Type D: Labour jobs that usually give on-the-job training, such as fruit pickers, cleaning staff, oil field workers, etc. \n\nIf you are applying for Express Entry, your job and the work you have done in the past must be Skill Type 0 or level A or B.\n\nYou can use this site for finding your correct NOC code.\n\nAnother option would be to use the Job Bank website. Find a job opening that matches your current job (or any previous job) and whose job duties match yours. On the job opening page, you can find the corresponding NOC code in the \"Job Market Information\" page.", attributes: [
   .font: font,
   .foregroundColor: UIColor(red: 70.0 / 255.0, green: 73.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0),
   .kern: 0.05
 ])
        
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 54, length: 13))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 164, length: 13))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 293, length: 13))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 458, length: 13))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 642, length: 15))
        attributedString.addAttribute(.font, value: boldFont, range: NSRange(location: 869, length: 29))
        
        attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 912, length: 4))
        attributedString.addAttribute(.link, value: UIColor(red: 7.0 / 255.0, green: 124.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0), range: NSRange(location: 993, length: 8))
        
        detailLabel.attributedText = attributedString
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap(_:)))
        gesture.numberOfTapsRequired = 1
        detailLabel.addGestureRecognizer(gesture)
        detailLabel.isUserInteractionEnabled = true
        detailLabel.lineBreakMode = .byWordWrapping

        self.navigationController?.navigationBar.isHidden = true
        //self.scrollView.contentSize = CGSize(width: 320, height: 960)
        self.tabBarController?.tabBar.isHidden = true
        
        self.isCompletedBtn.layer.cornerRadius = 10
        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        self.backgroundView.layer.shadowOpacity = 1
        self.backgroundView.layer.shadowOffset = .zero
        self.backgroundView.layer.shadowRadius = 3
       
        
        if appData.isComplete {
            self.isCompletedBtn.setTitle("Completed", for: .normal)
        } else {
            self.isCompletedBtn.setTitle("Mark as Complete", for: .normal)
        }
    }

    func setAppData(data : AppData) {
        appData = data
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let text = self.detailLabel.attributedText?.string else
        {
            return
        }

        let conditionRange = (text as NSString).range(of: "this")
        let cancellationRange = (text as NSString).range(of: "Job Bank")

        if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange:conditionRange){
           let webView = WebViewViewController()
            webView.setLinkURL(link: Constant.URLConstants.this)
           self.navigationController?.pushViewController(webView, animated: true)

        } else if sender.didTapAttributedTextInLabel(label: self.detailLabel, inRange: cancellationRange){
            let webView = WebViewViewController()
             webView.setLinkURL(link: Constant.URLConstants.JobBank)
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
            UserDefaults.standard.setValue(true, forKey: self.appData.title)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}



extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)

        guard let attributedString = label.attributedText else { return false }

        let mutableAttribString = NSMutableAttributedString(attributedString: label.attributedText!)
        // Add font so the correct range is returned for multi-line labels
        mutableAttribString.addAttributes([NSAttributedString.Key.font: label.font!], range: NSRange(location: 0, length: attributedString.length))

        let textStorage = NSTextStorage(attributedString: mutableAttribString)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        //indexOfCharacter = indexOfCharacter + 1
        print(indexOfCharacter)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}







//protocol AtMentionsLabelTapDelegate: class {
//  func labelWasTappedForUsername(_ username: String)
//}
//
//class AtMentionsLabel: UILabel {
//  private var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//  weak var tapDelegate: AtMentionsLabelTapDelegate?
//
//  var mentions: [String] = [] // usernames to style
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    commonInit()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    commonInit()
//  }
//
//  func commonInit() {
//    isUserInteractionEnabled = true
//
//    lineBreakMode = .byWordWrapping
//    tapGesture = UITapGestureRecognizer()
//    tapGesture.addTarget(self, action: #selector(handleLabelTap(recognizer:)))
//    tapGesture.numberOfTapsRequired = 1
//    tapGesture.isEnabled = true
//    addGestureRecognizer(tapGesture)
//  }
//
//@objc func handleLabelTap(recognizer: UITapGestureRecognizer) {
//  let tapLocation = recognizer.location(in: self)
//  let tapIndex = indexOfAttributedTextCharacterAtPoint(point: tapLocation)
//
//  for username in mentions {
//    if let ranges = self.attributedText?.rangesOf(subString: username) {
//      for range in ranges {
//        if tapIndex > range.location && tapIndex < range.location + range.length {
//          tapDelegate?.labelWasTappedForUsername(username)
//          return
//        }
//      }
//    }
//  }
//}
//
//func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
//    guard let attributedString = self.attributedText else { return -1 }
//
//    let mutableAttribString = NSMutableAttributedString(attributedString: attributedString)
//    // Add font so the correct range is returned for multi-line labels
//    mutableAttribString.addAttributes([NSAttributedString.Key.font: font], range: NSRange(location: 0, length: attributedString.length))
//
//    let textStorage = NSTextStorage(attributedString: mutableAttribString)
//
//    let layoutManager = NSLayoutManager()
//    textStorage.addLayoutManager(layoutManager)
//
//    let textContainer = NSTextContainer(size: frame.size)
//    textContainer.lineFragmentPadding = 0
//    textContainer.maximumNumberOfLines = numberOfLines
//    textContainer.lineBreakMode = lineBreakMode
//    layoutManager.addTextContainer(textContainer)
//
//    let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//    return index
//  }
//}
//
//
//
//extension NSAttributedString {
//  func rangesOf(subString: String) -> [NSRange] {
//    var nsRanges: [NSRange] = []
//    let ranges = string.ranges(of: subString, options: .caseInsensitive, locale: nil)
//
//    for range in ranges {
//      nsRanges.append(range.nsRange)
//    }
//
//    return nsRanges
//  }
//}
//
//extension String {
//  func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
//    var ranges: [Range<Index>] = []
//    while let range = self.range(of: substring, options: options, range: (ranges.last?.upperBound ?? self.startIndex) ..< self.endIndex, locale: locale) {
//      ranges.append(range)
//    }
//    return ranges
//  }
//}
