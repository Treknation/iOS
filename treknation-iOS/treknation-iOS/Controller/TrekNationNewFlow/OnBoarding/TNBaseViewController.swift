//
//  TNBaseViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit
import Amplitude

class TNBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .whiteColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    var statusBarHidden = true {
      didSet {
        setNeedsStatusBarAppearanceUpdate()
      }
    }

    override var prefersStatusBarHidden: Bool {
      return statusBarHidden
    }
    
    func navigateToEEDrawsScreenBasedOnNotificationFirebase() {
        let eeDrawMainViewController = EEDrawMainViewController(nibName: "EEDrawMainViewController", bundle:nil)
        self.navigationController?.pushViewController(eeDrawMainViewController, animated: true)
    }
    
    func logAnalyticsEventsForAction(eventName:String, eventProperties:[AnyHashable:Any]) {
        
        if !Utility.isDebugModeEnabled() {
            Amplitude.instance().logEvent(eventName, withEventProperties: eventProperties)
        }
    }
    
    func logAnalyticsEventsForActionForUserProperties(eventName:String, eventProperties:[AnyHashable:Any]) {
        
        if !Utility.isDebugModeEnabled() {
            Amplitude.instance().logEvent(eventName, withEventProperties: eventProperties)
            Amplitude.instance().setUserProperties(["name": AppContext.sharedAppContext.userName, "email": AppContext.sharedAppContext.email])
        }
    }
}
extension TNBaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if navigationController?.viewControllers.count ?? 0 > 1 {
            return true
        } else {
            return false
        }
    }
}

extension UIColor {

  @nonobjc class var yellow: UIColor {
    return UIColor(red: 244.0 / 255.0, green: 180.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightOrange: UIColor {
    return UIColor(red: 253.0 / 255.0, green: 189.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var peach: UIColor {
    return UIColor(red: 238.0 / 255.0, green: 103.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
  }
    
    @nonobjc class var darkSlateBlue: UIColor {
      return UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightBlue: UIColor {
      return UIColor(red: 213.0 / 255.0, green: 233.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var errorColor: UIColor {
      return UIColor(red: 217.0 / 255.0, green: 4.0 / 255.0, blue: 41.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var whiteColor: UIColor {
      return UIColor(red: 254.0 / 255.0, green: 252.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
    }

}

extension UIFont {
    
    class var ThinMedium18Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Medium", size: 18.0.scaledWidth())!
    }
    
    class var ThinMedium24Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Medium", size: 24.0.scaledWidth())!
    }
    
    class var ThinSemiBold18Font: UIFont {
        return UIFont(name: "Commissioner-Thin_SemiBold", size: 18.0.scaledWidth())!
    }
    
    class var ThinSemiBold14Font: UIFont {
        return UIFont(name: "Commissioner-Thin_SemiBold", size: 14.0.scaledWidth())!
    }
    
    class var ThinMedium14Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Medium", size: 14.0.scaledWidth())!
    }
    
    class var ThinRegular12Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Regular", size: 12.0.scaledWidth())!
    }
    
    class var ThinRegular14Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Regular", size: 14.0.scaledWidth())!
    }
    
    class var ThinRegular16Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Regular", size: 16.0.scaledWidth())!
    }
    
    class var ThinRegular18Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Regular", size: 18.0.scaledWidth())!
    }
    
    class var ThinRegular48Font: UIFont {
        return UIFont(name: "Commissioner-Thin_Regular", size: 48.0.scaledWidth())!
    }
    
    class var SourceSansProRegular14Font: UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: 14.0.scaledWidth())!
    }
    
    class var SourceSansProRegular11Font: UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: 11.0.scaledWidth())!
    }
    
    class var SourceSansProSemiBold24Font: UIFont {
        return UIFont(name: "SourceSansPro-SemiBold", size: 24.0.scaledWidth())!
    }

}

extension UIButton {
    func applyRoundedBG(backgroundColor:UIColor,borderWidth:CGFloat,borderColor:CGColor,tittleColor:UIColor) {
        self.backgroundColor = backgroundColor
        self.setCornerRadius()
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.setTitleColor(tittleColor, for: .normal)
    }
    
    func applySolidBG(backgroundColor:UIColor,borderWidth:CGFloat,borderColor:CGColor,tittleColor:UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.setTitleColor(tittleColor, for: .normal)
    }
    
    func applyHollowBG(backgroundColor:UIColor,borderWidth:CGFloat,borderColor:CGColor,tittleColor:UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.setTitleColor(tittleColor, for: .normal)
    }
}

extension UISlider {
    func setDefaultValue() {
        self.tintColor = .darkSlateBlue
           self.thumbTintColor = .darkSlateBlue
           self.maximumTrackTintColor = .lightBlue
        if let thumbImage = UIImage(named: "oval-1") {
            self.setThumbImage(thumbImage, for: .normal)
            self.setThumbImage(thumbImage, for: .highlighted)
            self.setThumbImage(thumbImage, for: .selected)
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
//        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
//        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension Date {
    func getFormattedDate() -> String {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "EST")!
        let dateComponents = calendar.component(.day, from: self)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal

        let day = numberFormatter.string(from: dateComponents as NSNumber)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.dateFormat = "MMM, yyyy"

        let dateString = "\(day!) \(dateFormatter.string(from: self))"
        return dateString
    }
    
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds))
    }
}

class CustomPageControl: UIPageControl {

    var borderColor: UIColor = .darkSlateBlue

    override var currentPage: Int {
        didSet {
            updateBorderColor()
        }
    }

    func updateBorderColor() {
        subviews.enumerated().forEach { index, subview in
            if index != currentPage {
                subview.layer.borderColor = borderColor.cgColor
                subview.layer.borderWidth = 1
            } else {
                subview.layer.borderWidth = 0
            }
        }
    }

}

extension UIView {
    /**
     Magically computes and sets an ideal corner radius.
     */
    public func setCornerRadius() {
        layer.cornerRadius = 0.488 * min(frame.width, frame.height)
        layer.masksToBounds = true
    }
    
    public func setCircleWithShadow() {
        backgroundColor = UIColor.yellow
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = frame.width*0.5
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 4.0
    }
    
    func shadowWithCornerRadius(radius: CGFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 0.0
    }
    
    func applyShadow() {
        clipsToBounds = false
        layer.shadowColor = UIColor(displayP3Red: 78/255, green: 78/255, blue: 78/255, alpha: 1.0).cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 5).cgPath
    }
}

extension Double {
    func scaledWidth() -> CGFloat {
        return  CGFloat(Double(screenWidth) * self / 375.0)
    }
    func scaledHeight() -> CGFloat {
        return  CGFloat(Double(screenHeight) * self / 667.0)
    }
}
