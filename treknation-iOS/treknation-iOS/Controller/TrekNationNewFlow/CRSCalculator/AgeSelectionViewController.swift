//
//  AgeSelectionViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 13/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class AgeSelectionViewController: TNBaseViewController {
    
    @IBOutlet weak var screenTitleLabel: UILabel! {
        didSet {
            screenTitleLabel.font = UIFont.ThinSemiBold18Font
            screenTitleLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var sectionTitleView: UIView! {
        didSet {
            sectionTitleView.backgroundColor = .lightBlue
        }
    }
    @IBOutlet weak var sectionTitleLabel: UILabel! {
        didSet {
            sectionTitleLabel.textColor = .darkSlateBlue
            sectionTitleLabel.font = .ThinMedium18Font
        }
    }
    @IBOutlet weak var sectionValueLabel: UILabel! {
        didSet {
            sectionValueLabel.textColor = .white
            sectionValueLabel.font = .ThinMedium18Font
            sectionValueLabel.text = "0"
        }
    }
    @IBOutlet weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.textColor = .darkSlateBlue
            subTitleLabel.font = .ThinSemiBold18Font
        }
    }
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            saveButton.titleLabel?.font = UIFont.ThinSemiBold18Font
        }
    }
    
    @IBOutlet weak var agePickerView: UIPickerView! {
        didSet {
            agePickerView.tintColor = .darkSlateBlue
        }
    }
    var ageCalculatorInfo: TNCRSCalculatorInfo?
    var marriedCRSCalculatorInfo: TNCRSCalculatorInfo?
    var factorValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    private func setData() {
        screenTitleLabel.text = "CALCULATE CRS SCORE"
        sectionTitleLabel.text = ageCalculatorInfo?.factorTitle ?? ""
        subTitleLabel.text = ageCalculatorInfo?.factorSaction.first?.title ?? ""
        saveButton.setTitle("Add Age", for: .normal)
        presetData()
    }
    
    private func presetData() {
        sectionValueLabel.text = ageCalculatorInfo?.factorValue
        factorValue = ageCalculatorInfo?.factorValue ?? "0"
        if let index = ageCalculatorInfo?.factorSaction.first?.value.firstIndex(where: {$0.isSelected == true }) {
            agePickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let index = agePickerView.selectedRow(inComponent: 0)
        ageCalculatorInfo?.factorValue = factorValue
        if marriedCRSCalculatorInfo != nil {
            AppContext.sharedAppContext.maxValueForASectionSingleAge = factorValue.toInt() ?? 0
        } else {
            AppContext.sharedAppContext.maxValueForASectionMarriedAge = factorValue.toInt() ?? 0
        }
        self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_age_score", eventProperties: ["value":"\(factorValue)"])
        _ = ageCalculatorInfo?.factorSaction.first?.value.map({ $0.isSelected = false })
        ageCalculatorInfo?.factorSaction.first?.value[index].isSelected = true
        
        updateMarriedCRSInfo()
        navigationController?.popViewController(animated: true)
    }
    
    func updateMarriedCRSInfo() {
        if marriedCRSCalculatorInfo != nil {
            if let index = ageCalculatorInfo?.factorSaction.first?.value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorValue = marriedCRSCalculatorInfo?.factorSaction.first?.value[index].score ?? ""
                marriedCRSCalculatorInfo?.factorSaction.first?.value[index].isSelected = true
                
                AppContext.sharedAppContext.maxValueForASectionMarriedAge = Int(marriedCRSCalculatorInfo?.factorValue ?? "0") ?? 0
            }
        }
    }
}

extension AgeSelectionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ageCalculatorInfo?.factorSaction.first?.value.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews[1].backgroundColor = UIColor.darkSlateBlue
        pickerView.subviews[2].backgroundColor = UIColor.darkSlateBlue

        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.ThinMedium18Font
            pickerLabel?.textColor = .darkSlateBlue
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = ageCalculatorInfo?.factorSaction.first?.value[row].title ?? ""
        return pickerLabel!
    }

}

extension AgeSelectionViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        50.0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        ageCalculatorInfo?.factorSaction.first?.value[row].title ?? ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        factorValue = ageCalculatorInfo?.factorSaction.first?.value[row].score ?? ""
        sectionValueLabel.text = factorValue
    }
}
