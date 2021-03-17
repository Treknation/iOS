//
//  EducationTableViewCell.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/18/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class EducationTableViewCell: UITableViewCell {
    @IBOutlet weak var educationTitleLabel: UILabel! {
        didSet {
            educationTitleLabel.textColor = UIColor.darkSlateBlue
            educationTitleLabel.font = UIFont.ThinRegular18Font
        }
    }
    
    @IBOutlet weak var selectionView: UIView! {
        didSet {
            selectionView.backgroundColor = UIColor.darkSlateBlue
            selectionView.isHidden = true
        }
    }
    
    @IBOutlet weak var selectionButton: UIButton! {
        didSet {
            selectionButton.backgroundColor = .clear
            selectionButton.layer.borderWidth = 1.0
            selectionButton.layer.borderColor = UIColor.darkSlateBlue.cgColor
            selectionButton.tag = 1
        }
    }
    
    static let cellIdentifier = "EducationTableViewCell"
    var score: ScoreDetails?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(educationDict: ScoreDetails?, defaultSelected: ScoreDetails?) {
        if educationDict?.title == defaultSelected?.title {
            selectionView.isHidden = false
        } else {
            selectionView.isHidden = true
        }
        educationTitleLabel.text = educationDict?.title
    }
}
