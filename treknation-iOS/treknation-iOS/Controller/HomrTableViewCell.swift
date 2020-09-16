//
//  HomrTableViewCell.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-02.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class HomrTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detailedOverview: UILabel!
    @IBOutlet weak var expandBtn: UIButton!
    @IBOutlet weak var textViewConstraints : NSLayoutConstraint!
    @IBOutlet weak var cellView: ShadowView!
    @IBOutlet weak var dividerView: UIView!

}


//extension UITableViewCell {
//    func addShadow(backgroundColor: UIColor = .white, cornerRadius: CGFloat = 12, shadowRadius: CGFloat = 5, shadowOpacity: Float = 0.1, shadowPathInset: (dx: CGFloat, dy: CGFloat), shadowPathOffset: (dx: CGFloat, dy: CGFloat)) {
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = true
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        layer.shadowRadius = shadowRadius
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = UIBezierPath(roundedRect: bounds.insetBy(dx: shadowPathInset.dx, dy: shadowPathInset.dy).offsetBy(dx: shadowPathOffset.dx, dy: shadowPathOffset.dy), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
//
//        let whiteBackgroundView = UIView()
//        whiteBackgroundView.backgroundColor = backgroundColor
//        whiteBackgroundView.layer.cornerRadius = cornerRadius
//        whiteBackgroundView.layer.masksToBounds = true
//        whiteBackgroundView.clipsToBounds = false
//
//        whiteBackgroundView.frame = bounds.insetBy(dx: shadowPathInset.dx, dy: shadowPathInset.dy)
//        insertSubview(whiteBackgroundView, at: 0)
//    }
//}
////
////
////extension UIView {
////    func addShadow(){
////        self.layer.shadowColor = UIColor.black.cgColor
////        self.layer.shadowOpacity = 0.5
////        self.layer.shadowRadius = 2.0
////        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
////    }
////}

class ShadowView: UIView {

    var setupShadowDone: Bool = false
    
    public func setupShadow() {
        if setupShadowDone { return }
        print("Setup shadow!")
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 30
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
//byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
//8)).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
//
        setupShadowDone = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }
}
