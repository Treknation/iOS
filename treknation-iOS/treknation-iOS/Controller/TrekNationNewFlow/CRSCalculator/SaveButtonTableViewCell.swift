//
//  SaveButtonTableViewCell.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 2/4/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

protocol SaveButtonCellDelegate: NSObjectProtocol {
    func didClickOnSaveButton()
}

class SaveButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var saveButtonWidthConstraint: NSLayoutConstraint!

    static let cellIdentifier = "SaveButtonTableViewCell"
    weak var delegate: SaveButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureSaveButtonCell(buttonTitle: String) {
        saveButtonWidthConstraint.constant = 240.0.scaledWidth()

        saveButton.layoutIfNeeded()
        saveButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
        saveButton.titleLabel?.font = UIFont.ThinSemiBold18Font
        saveButton.setTitle(buttonTitle, for: .normal)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        delegate?.didClickOnSaveButton()
    }
}
