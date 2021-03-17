//
//  ListTableViewCell.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 1/9/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftIconImageView: UIImageView!
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var sectionTitleLabel: UILabel! {
        didSet {
            sectionTitleLabel.textColor = .darkSlateBlue
            sectionTitleLabel.font = UIFont.ThinSemiBold14Font
        }
    }
    static let cellIdentifier = "ListTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(forIndexPath: IndexPath) {
        rightArrowImageView.image = UIImage(named: "iconBack")
        if forIndexPath.row == 0 {
            leftIconImageView.image = UIImage(named: "iconCalculator")
            sectionTitleLabel.text = "CRS Calculator"
        } else if forIndexPath.row == 1 {
            leftIconImageView.image = UIImage(named: "iconDraws")
            sectionTitleLabel.text = "Express Entry Draws"
        } else {
            leftIconImageView.image = UIImage(named: "iconBlog")
            sectionTitleLabel.text = "Latest Blogs"
        }
    }
}
