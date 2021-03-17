//
//  EducationHeaderTableViewCell.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 2/2/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class EducationHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.font = UIFont.ThinSemiBold18Font
            headerLabel.textColor = .darkSlateBlue
        }
    }
    static let cellIdentifier = "EducationHeaderTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(headerTitle: String) {
        isUserInteractionEnabled = false
        selectionStyle = .none
        leadingConstraint.constant = 47.5.scaledWidth()
        trailingConstraint.constant = 20.0.scaledWidth()
        headerLabel.text = headerTitle
    }
    
    func configureCRSMarriedTableFooter() {
        selectionStyle = .none
        leadingConstraint.constant = 0
        trailingConstraint.constant = 0
        headerLabel.font = UIFont.ThinMedium14Font
        headerLabel.text = "Note: If your Spouse is not coming with you to Canada, or they are Canadian citizen or PR, you will earn points as if you don’t have a spouse. Please use the single section for calculating score in this case."
    }
}
