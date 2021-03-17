//
//  EEDrawTableViewCell.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 14/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit
import FirebaseFirestore

class EEDrawTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "EEDrawTableViewCell"
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.backgroundColor = UIColor.darkSlateBlue
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.ThinRegular14Font
            dateLabel.textColor = UIColor.white
        }
    }
    @IBOutlet weak var crsScoreLabel: UILabel! {
        didSet {
            crsScoreLabel.font = UIFont.ThinRegular14Font
            crsScoreLabel.textColor = UIColor.white
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(eeDrawDict: NSDictionary) {
        guard let postTimestamp = eeDrawDict.object(forKey: "dateTime") as? Timestamp else { return }
                
        dateLabel.text = Date(milliseconds: postTimestamp.seconds).getFormattedDate()
        
        if let crsScoreLabelText = eeDrawDict.object(forKey: "crsScoreOfTheLowestRank") as? NSNumber {
                crsScoreLabel.text = "\(crsScoreLabelText)"
        }
        
        if let categoryText = eeDrawDict.object(forKey: "category") as? String, categoryText != "" {
            crsScoreLabel.text = (crsScoreLabel.text ?? "") + " " + "(\(categoryText))"
        }
    }
    
}
