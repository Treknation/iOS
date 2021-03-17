//
//  MistakeTableViewCell.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 2/15/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

protocol MistakeDelegate: NSObjectProtocol {
    func didClickOnButton(mistake: CommonMistakeData)
}

class MistakeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var mistakeLabel: UILabel! {
        didSet {
            mistakeLabel.font = UIFont.ThinSemiBold18Font
            mistakeLabel.textColor = UIColor.darkSlateBlue
        }
    }
    @IBOutlet weak var mistakeDescriptionLabel: UILabel! {
        didSet {
            mistakeDescriptionLabel.font = UIFont.ThinRegular16Font
            mistakeDescriptionLabel.textColor = UIColor.darkSlateBlue
        }
    }
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = .darkSlateBlue
        }
    }
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 8
                   cellView.layer.borderColor = UIColor.darkGray.cgColor
                   cellView.layer.shadowOffset = CGSize(width: 3, height: 3)
                   cellView.layer.shadowRadius = 30
                   cellView.layer.shadowOpacity = 0.3
                   cellView.layer.shadowColor = UIColor.gray.cgColor
                   cellView.layer.masksToBounds = false
        }
    }

    static let cellIdentifier = "MistakeTableViewCell"
    weak var delegate: MistakeDelegate?
    var commonMistake: CommonMistakeData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func arrowButtonAction(_ sender: Any) {
        guard let mistake = commonMistake else { return }
        delegate?.didClickOnButton(mistake: mistake)
    }
    
    func configureCell(mistake: CommonMistakeData) {
        commonMistake = mistake
        mistakeLabel.text = mistake.title
        if mistake.isOpen {
            mistakeDescriptionLabel.text = mistake.detailedDescription
            separatorView.isHidden = false
            bottomConstraint.constant = 20
        } else {
            mistakeDescriptionLabel.text = nil
            separatorView.isHidden = true
            bottomConstraint.constant = 0
        }
        arrowButton.setImage(UIImage(named: mistake.isOpen ? "close" : "open"), for: .normal)
    }
}
