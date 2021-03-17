//
//  LanguageProgressBarTableViewCell.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 2/3/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

protocol SliderDelegate: NSObjectProtocol {
    func sliderValueChanged(tag: Int, newValue: UISlider)
}

class LanguageProgressBarTableViewCell: UITableViewCell {
    @IBOutlet weak var languageLabel: UILabel! {
        didSet {
            languageLabel.textColor = .darkSlateBlue
            languageLabel.font = .ThinRegular18Font
        }
    }
    @IBOutlet weak var valueLabel: UILabel! {
        didSet {
            valueLabel.textColor = .darkSlateBlue
            valueLabel.font = .ThinMedium14Font
        }
    }
    @IBOutlet weak var slider: UISlider! {
        didSet {
         slider.setDefaultValue()
        }
    }
    weak var delegate: SliderDelegate?
    static let cellIdentifier = "LanguageProgressBarTableViewCell"
    var sliderTag = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(withTag: Int, sliderRange:(Float, Float), sliderValue: (Double)) {
        sliderTag = withTag
        
        var title = String()
        switch withTag {
        case 0:
            title = "Speaking"
        case 1:
            title = "Listening"
        case 2:
            title = "Reading"
        default:
            title = "Writing"
        }
        languageLabel.text = title
        slider.minimumValue = sliderRange.0
        slider.maximumValue = sliderRange.1
        
        slider.value = Float(sliderValue)
        valueLabel.text = "\(sliderValue.round(to: 1))"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        delegate?.sliderValueChanged(tag: sliderTag, newValue: sender as! UISlider)
    }
}
