//
//  ExperienceViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/19/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class ExperienceViewController: TNBaseViewController {
    
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
        }
    }
    
    @IBOutlet weak var canadianExperienceLabel: UILabel! {
        didSet {
            canadianExperienceLabel.font = UIFont.ThinSemiBold18Font
            canadianExperienceLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var canadianExperienceValueLabel: UILabel! {
        didSet {
            canadianExperienceValueLabel.font = UIFont.ThinMedium14Font
            canadianExperienceValueLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var canadianExperienceSlider: UISlider! {
        didSet {
            canadianExperienceSlider.setDefaultValue()
        }
    }
    
    @IBOutlet weak var foreignExperienceLabel: UILabel! {
        didSet {
            foreignExperienceLabel.font = UIFont.ThinSemiBold18Font
            foreignExperienceLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var foreignExperienceValueLabel: UILabel! {
        didSet {
            foreignExperienceValueLabel.font = UIFont.ThinMedium14Font
            foreignExperienceValueLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var foreignExperienceSlider: UISlider! {
        didSet {
            foreignExperienceSlider.setDefaultValue()
        }
    }
    
    @IBOutlet weak var yesSelectionView: UIView! {
        didSet {
            yesSelectionView.backgroundColor = UIColor.darkSlateBlue
            yesSelectionView.isHidden = true
        }
    }
    
    @IBOutlet weak var yesSelectionButton: UIButton! {
        didSet {
            yesSelectionButton.titleLabel?.font = UIFont.ThinSemiBold18Font
            yesSelectionButton.backgroundColor = .clear
            yesSelectionButton.layer.borderWidth = 1.0
            yesSelectionButton.layer.borderColor = UIColor.darkSlateBlue.cgColor
            yesSelectionButton.tag = 2
        }
    }
    
    @IBOutlet weak var yesLabel: UILabel! {
        didSet {
            yesLabel.font = UIFont.ThinRegular18Font
            yesLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var noSelectionView: UIView! {
        didSet {
            noSelectionView.backgroundColor = UIColor.darkSlateBlue
            noSelectionView.isHidden = false
        }
    }
    
    @IBOutlet weak var noSelectionButton: UIButton! {
        didSet {
            noSelectionButton.titleLabel?.font = UIFont.ThinSemiBold18Font
            noSelectionButton.backgroundColor = .clear
            noSelectionButton.layer.borderWidth = 1.0
            noSelectionButton.layer.borderColor = UIColor.darkSlateBlue.cgColor
            noSelectionButton.tag = 1
        }
    }
    
    @IBOutlet weak var noLabel: UILabel! {
        didSet {
            noLabel.font = UIFont.ThinRegular18Font
            noLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel! {
        didSet {
            questionLabel.font = UIFont.ThinSemiBold18Font
            questionLabel.textColor = .darkSlateBlue
        }
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            saveButton.titleLabel?.font = UIFont.ThinSemiBold18Font
        }
    }
    var marriedCRSCalculatorInfo: TNCRSCalculatorInfo?
    var educationCalculatorInfo: TNCRSCalculatorInfo?
    var selectedCanadianExperience: ScoreDetails?
    var selectedForeignExperience: ScoreDetails?
    var isSpouseSection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setData()
        if isSpouseSection {
            foreignExperienceLabel.isHidden = true
            foreignExperienceValueLabel.isHidden = true
            foreignExperienceSlider.isHidden = true
            yesSelectionView.isHidden = true
            yesSelectionButton.isHidden = true
            yesLabel.isHidden = true
            noSelectionView.isHidden = true
            noSelectionButton.isHidden = true
            noLabel.isHidden = true
            questionLabel.isHidden = true
        }
    }
    
    private func setData() {
        screenTitleLabel.text = "CALCULATE CRS SCORE"
        sectionTitleLabel.text = educationCalculatorInfo?.factorTitle ?? ""
        saveButton.setTitle("Add Experience", for: .normal)
        
        presetData()
        
        canadianExperienceValueLabel.text = ""
        foreignExperienceValueLabel.text = ""
        if !isSpouseSection {
            if let _ = selectedCanadianExperience, let _ = selectedForeignExperience {
                
            } else {
                canadianExperienceSlider.value = 0.0
                foreignExperienceSlider.value = 0.0
            }
        } else {
            if selectedCanadianExperience == nil {
                canadianExperienceSlider.value = 0.0
            }
        }
        
        if AppContext.sharedAppContext.yesCheckboxSelected {
            yesSelectionButtonAction(yesSelectionButton as Any)
        }
        
        canadianExperienceSliderValueChanged(canadianExperienceSlider!)
        foreignExperienceSliderValueChanged(foreignExperienceSlider!)
    }
    
    private func presetData() {
        let subSection = educationCalculatorInfo?.factorSaction[0]
        if let index = subSection?.value.firstIndex(where: { $0.isSelected == true }) {
            selectedCanadianExperience = subSection?.value[index]
            if isSpouseSection {
                switch selectedCanadianExperience?.score {
                case "0":
                    canadianExperienceSlider.value = 0
                case "5":
                    canadianExperienceSlider.value = 1
                case "7":
                    canadianExperienceSlider.value = 2
                case "8":
                    canadianExperienceSlider.value = 3
                case "9":
                    canadianExperienceSlider.value = 4
                case "10":
                    canadianExperienceSlider.value = 5
                default:
                    canadianExperienceSlider.value = 0
                }

            } else {
            if marriedCRSCalculatorInfo == nil { //married section experience score
                switch selectedCanadianExperience?.score {
                case "0":
                    canadianExperienceSlider.value = 0
                case "35":
                    canadianExperienceSlider.value = 1
                case "46":
                    canadianExperienceSlider.value = 2
                case "56":
                    canadianExperienceSlider.value = 3
                case "63":
                    canadianExperienceSlider.value = 4
                case "70":
                    canadianExperienceSlider.value = 5
                default:
                    canadianExperienceSlider.value = 0
                }
            } else { //single experience score
                switch selectedCanadianExperience?.score {
                case "0":
                    canadianExperienceSlider.value = 0
                case "40":
                    canadianExperienceSlider.value = 1
                case "53":
                    canadianExperienceSlider.value = 2
                case "64":
                    canadianExperienceSlider.value = 3
                case "72":
                    canadianExperienceSlider.value = 4
                case "80":
                    canadianExperienceSlider.value = 5
                default:
                    canadianExperienceSlider.value = 0
                }
            }
            }
        }

        let subSectionOutside = educationCalculatorInfo?.factorSaction[1]
        if let index = subSectionOutside?.value.firstIndex(where: { $0.isSelected == true }) {
            selectedForeignExperience = subSectionOutside?.value[index]
            
            switch selectedForeignExperience?.score {
            case "0":
                foreignExperienceSlider.value = 0
            case "13":
                foreignExperienceSlider.value = 2
            case "25":
                foreignExperienceSlider.value = 3
            default:
                foreignExperienceSlider.value = 0
            }
        }
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesSelectionButtonAction(_ sender: Any) {
        yesSelectionButton.tag = yesSelectionButton.tag == 1 ? 2 : 1
        noSelectionButton.tag = noSelectionButton.tag == 1 ? 2 : 1
        
        if yesSelectionButton.tag == 1 {
            yesSelectionView.isHidden = false
            noSelectionView.isHidden = true
        }
        else {
            yesSelectionView.isHidden = true
            noSelectionView.isHidden = false
        }
        setScore()
    }
    
    @IBAction func noSelectionButtonAction(_ sender: Any) {
        yesSelectionButton.tag = yesSelectionButton.tag == 1 ? 2 : 1
        noSelectionButton.tag = noSelectionButton.tag == 1 ? 2 : 1
        
        if noSelectionButton.tag == 1 {
            noSelectionView.isHidden = false
            yesSelectionView.isHidden = true
        }
        else {
            noSelectionView.isHidden = true
            yesSelectionView.isHidden = false
        }
        setScore()
    }
    
    @IBAction func canadianExperienceSliderValueChanged(_ sender: Any) {
        
        canadianExperienceSlider.setValue((round(canadianExperienceSlider.value / 1.0) * 1.0), animated: false)
        
        switch canadianExperienceSlider.value {
        case 0..<1:
            canadianExperienceValueLabel.text = "0 yr"
        case 1..<2:
            canadianExperienceValueLabel.text = "1 yr"
        case 2..<3:
            canadianExperienceValueLabel.text = "2 yrs"
        case 3..<4:
            canadianExperienceValueLabel.text = "3 yrs"
        case 4..<5:
            canadianExperienceValueLabel.text = "4 yrs"
        case 5:
            canadianExperienceValueLabel.text = "5 or more yrs"
        default:
            canadianExperienceValueLabel.text = "0 yr"
        }
        setScore()
    }
    
    @IBAction func foreignExperienceSliderValueChanged(_ sender: Any) {
        
        foreignExperienceSlider.setValue((round(foreignExperienceSlider.value / 1.0) * 1.0), animated: false)
        
        switch foreignExperienceSlider.value {
        case 0..<1:
            foreignExperienceValueLabel.text = "0 yr"
        case 1..<2:
            foreignExperienceValueLabel.text = "1 yr"
        case 2..<3:
            foreignExperienceValueLabel.text = "2 yrs"
//        case 3..<4:
//            foreignExperienceValueLabel.text = "3 or more yrs"
//        case 4..<5:
//            foreignExperienceValueLabel.text = "3 or more yrs"
        case 3:
            foreignExperienceValueLabel.text = "3 or more yrs"
        default:
            foreignExperienceValueLabel.text = "0 yr"
        }
        setScore()
    }
    var additonalPointsValueForForeignExperience:Int = 0

    func setScore() {
        var totalValue:Int = 0
        additonalPointsValueForForeignExperience = 0
        
        var clbValue = marriedCRSCalculatorInfo == nil ? AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel : AppContext.sharedAppContext.primarySingleLanguageCLBLevel
        
        if isSpouseSection {
            clbValue = 0
        }
        
        if let scoreDetail = educationCalculatorInfo?.factorSaction[0] {
            switch canadianExperienceSlider.value {
            case 0..<1:
               let scoreDetail = scoreDetail.value[0]
               totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
               selectedCanadianExperience = scoreDetail
            case 1..<2:
                let scoreDetail = scoreDetail.value[1]
                totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                selectedCanadianExperience = scoreDetail
            case 2..<3:
                let scoreDetail = scoreDetail.value[2]
                totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                selectedCanadianExperience = scoreDetail
                additonalPointsValueForForeignExperience = 12
            case 3..<4:
                let scoreDetail = scoreDetail.value[3]
                totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                selectedCanadianExperience = scoreDetail
                additonalPointsValueForForeignExperience = 12
            case 4..<5:
                let scoreDetail = scoreDetail.value[4]
                totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                selectedCanadianExperience = scoreDetail
                additonalPointsValueForForeignExperience = 25
            case 5:
                let scoreDetail = scoreDetail.value[5]
                totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                selectedCanadianExperience = scoreDetail
                additonalPointsValueForForeignExperience = 25
            default:
                break
            }
        }
        if !isSpouseSection {
            if let scoreDetail = educationCalculatorInfo?.factorSaction[1] {
                switch foreignExperienceSlider.value {
                case 0..<1:
                    let scoreDetail = scoreDetail.value[0]
                    var value:Int = 0
                    if marriedCRSCalculatorInfo == nil {
                        AppContext.sharedAppContext.langForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 0, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreMarried
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreMarried
                    } else {
                        AppContext.sharedAppContext.langForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 0, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreSingle
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreSingle
                    }
                    totalValue = totalValue + value
                    selectedForeignExperience = scoreDetail
                case 1..<3:
                    let scoreDetail = scoreDetail.value[1]
                    var value:Int = 0
                    if marriedCRSCalculatorInfo == nil {
                        AppContext.sharedAppContext.langForeignExperienceScoreMarried = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 2, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreMarried
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreMarried
                    } else {
                        AppContext.sharedAppContext.langForeignExperienceScoreSingle = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 2, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreSingle
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreSingle
                    }
                    
                    totalValue = totalValue + value
                    selectedForeignExperience = scoreDetail
                case 3...5:
                    let scoreDetail = scoreDetail.value[2]
                    var value:Int = 0
                    if marriedCRSCalculatorInfo == nil {
                        AppContext.sharedAppContext.langForeignExperienceScoreMarried = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 3, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreMarried
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreMarried
                    } else {
                        AppContext.sharedAppContext.langForeignExperienceScoreSingle = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: clbValue)
                        AppContext.sharedAppContext.canadianForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section: 3, clbValue: canadianExperienceSlider.value)
                        value = AppContext.sharedAppContext.langForeignExperienceScoreSingle
                            //+ AppContext.sharedAppContext.canadianForeignExperienceScoreSingle
                    }
                    totalValue = totalValue + value
                    selectedForeignExperience = scoreDetail
                default:
                    break
                }
            }
            
            AppContext.sharedAppContext.yesCheckboxSelected = yesSelectionButton.tag == 1 ? true : false
            
            if yesSelectionButton.tag == 1 {
                if marriedCRSCalculatorInfo == nil { //married
                    AppContext.sharedAppContext.experienceCertificateMarried = Utility.getCertificateScore(clbValue: clbValue)
                    //AppContext.sharedAppContext.langForeignExperienceScoreMarried += Utility.getCertificateScore(clbValue: clbValue)
                } else { //single
                    AppContext.sharedAppContext.experienceCertificateSingle = Utility.getCertificateScore(clbValue: clbValue)
                    //AppContext.sharedAppContext.langForeignExperienceScoreSingle += Utility.getCertificateScore(clbValue: clbValue)
                }
            }
        }
        
        sectionValueLabel.text = "\(totalValue)"
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        educationCalculatorInfo?.resetAll()
        setScore()
        selectedCanadianExperience?.isSelected = true
        selectedForeignExperience?.isSelected = true
        educationCalculatorInfo?.factorValue = sectionValueLabel.text ?? "0"
        
        if isSpouseSection {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_spouse_experience_score", eventProperties: ["value":sectionValueLabel.text ?? "0"])
        } else {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_experience_score", eventProperties: ["value":sectionValueLabel.text ?? "0"])
        }
               
        if !isSpouseSection {
            if marriedCRSCalculatorInfo != nil {
                AppContext.sharedAppContext.maxValueForASectionSingleCanadianWorkEx = selectedCanadianExperience?.score.toInt() ?? 0
                
                AppContext.sharedAppContext.experienceScoreSingle = educationCalculatorInfo?.factorValue.toInt() ?? 0
                
                Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: marriedCRSCalculatorInfo, educationCalculatorInfo: educationCalculatorInfo, score: selectedCanadianExperience?.score ?? "", isSingle: true)
                Utility.setScoreForEducation(isSingle: true)
                
                //to update married factor value
                var marriedTotal = 0
                let canadianOfMarried = AppContext.sharedAppContext.marriedArray[3].factorSaction[0].value.filter({$0.isSelected == true }).first
                
                marriedTotal += canadianOfMarried?.score.toInt() ?? 0
                
                let foreignOfMarried = AppContext.sharedAppContext.marriedArray[3].factorSaction[1].value.filter({$0.isSelected == true }).first
                switch foreignOfMarried?.score {
                case "0":
                    marriedTotal += Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel)
                    
                case "13":
                    marriedTotal += Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel)
                    marriedTotal += additonalPointsValueForForeignExperience
                case "25":
                    marriedTotal += Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel)
                    marriedTotal += additonalPointsValueForForeignExperience

                default:
                    marriedTotal += Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel)
                }
                marriedCRSCalculatorInfo?.factorValue = "\(marriedTotal)"
            } else {
                AppContext.sharedAppContext.maxValueForASectionMarriedCanadianWorkEx = selectedCanadianExperience?.score.toInt() ?? 0
                AppContext.sharedAppContext.experienceScoreMarried = educationCalculatorInfo?.factorValue.toInt() ?? 0
                Utility.setScoreForEducation(isSingle: false)
            }
        } else {
            AppContext.sharedAppContext.maxValueForBSectionCanadianWorkEx = selectedCanadianExperience?.score.toInt() ?? 0
        }
        
        navigationController?.popViewController(animated: true)
    }
    
//    func updateMarriedCRSInfo(marriedCRSCalculatorInfo:TNCRSCalculatorInfo?, educationCalculatorInfo:TNCRSCalculatorInfo?, score: String) {
//        if marriedCRSCalculatorInfo != nil && marriedCRSCalculatorInfo?.factorValue == "0" {
//            var scoreTotal: Int = 0
//            var additonalPointsValueForForeignExperience:Int = 0
//
//            if let index = educationCalculatorInfo!.factorSaction[0].value.firstIndex(where: {$0.isSelected == true }) {
//                marriedCRSCalculatorInfo?.factorSaction[0].value[index].isSelected = true
//                scoreTotal = (marriedCRSCalculatorInfo?.factorSaction[0].value[index].score.toInt()) ?? 0
//                if let scoreDetail = marriedCRSCalculatorInfo?.factorSaction[0].value[index].score {
//                    if marriedCRSCalculatorInfo == nil { //married section experience score
//                        switch scoreDetail {
//                        case "56", "63":
//                            additonalPointsValueForForeignExperience = 12
//                        case "70":
//                            additonalPointsValueForForeignExperience = 25
//                        default:
//                            break;
//                        }
//                    } else { //single experience score
//                        switch score {
//                        case "64", "72":
//                            additonalPointsValueForForeignExperience = 12
//                        case "80":
//                            additonalPointsValueForForeignExperience = 25
//                        default:
//                            break;
//                        }
//                    }
//                }
//            }
//            if let index = educationCalculatorInfo!.factorSaction[1].value.firstIndex(where: {$0.isSelected == true }) {
//                marriedCRSCalculatorInfo?.factorSaction[1].value[index].isSelected = true
//                scoreTotal += (marriedCRSCalculatorInfo?.factorSaction[1].value[index].score.toInt()) ?? 0
//                switch marriedCRSCalculatorInfo?.factorSaction[1].value[index].score {
//                case "13", "25":
//                    scoreTotal += additonalPointsValueForForeignExperience
//                default:
//                    break
//                }
//            }
//            marriedCRSCalculatorInfo?.factorValue = scoreTotal > 0 ? "\(scoreTotal)" : "0"
//            AppContext.sharedAppContext.experienceScoreMarried = marriedCRSCalculatorInfo?.factorValue.toInt() ?? 0
//
//            Utility.setScoreForEducation(isSingle: false)
//
//        }
//    }
}













