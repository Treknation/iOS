//
//  CRSInfoTableViewCell.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 13/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class CRSInfoTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "CRSInfoTableViewCell"
    
    @IBOutlet weak var containerView: UIView! 
    @IBOutlet weak var countView: UIView! {
        didSet {
            countView.shadowWithCornerRadius(radius: 2.0)
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.darkSlateBlue
            titleLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.textColor = UIColor.white
            scoreLabel.font = UIFont.ThinMedium18Font
            
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(CRSCalculatorInfo: TNCRSCalculatorInfo) {
        titleLabel.text = CRSCalculatorInfo.factorTitle
        scoreLabel.text = "\(CRSCalculatorInfo.factorValue)"
    }
    
}
