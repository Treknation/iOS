//
//  LanguageViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/19/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class LanguageViewController: TNBaseViewController {
    
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
    
    @IBOutlet weak var primaryButton: UIButton! {
           didSet {
            primaryButton.applySolidBG(backgroundColor:.darkSlateBlue , borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .whiteColor)
                primaryButton.tag = 1
               primaryButton.titleLabel?.font = UIFont.ThinMedium18Font
           }
       }
    
    @IBOutlet weak var secondaryButton: UIButton! {
              didSet {
                secondaryButton.applyHollowBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
                    secondaryButton.tag = 2
                  secondaryButton.titleLabel?.font = UIFont.ThinMedium18Font
              }
          }
    
    @IBOutlet weak var languageLabel: UILabel! {
        didSet {
            languageLabel.font = UIFont.ThinRegular18Font
        }
    }
    
    @IBOutlet weak var languageSelectionBaseView: UIView! {
        didSet {
            languageSelectionBaseView.backgroundColor = .clear
            languageSelectionBaseView.layer.borderWidth = 1
            languageSelectionBaseView.layer.borderColor = UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor
        }
    }
    
    @IBOutlet weak var dropDownButton: UIButton!

    @IBOutlet weak var speakingSlider: UISlider!
    @IBOutlet weak var listeningSlider: UISlider!
    @IBOutlet weak var readingSlider: UISlider!
    @IBOutlet weak var writingSlider: UISlider!
    
    @IBOutlet weak var languagePickerView: UIPickerView! {
           didSet {
               languagePickerView.tintColor = .darkSlateBlue
            languagePickerView.backgroundColor = .white
           }
       }
    
    @IBOutlet weak var progressBarTableView: UITableView!
    
    var marriedCRSCalculatorInfo: TNCRSCalculatorInfo?
    var languageCalculatorInfo: TNCRSCalculatorInfo?
    var primaryArray = [ScoreDetails]()
    var secondaryArray = [ScoreDetails]()
    var primaryLanguageArray = [String]()
    var secondaryLanguageArray = [String]()
    var selectedPrimaryLanguage:ScoreDetails?
    var selectedSecondaryLanguage:ScoreDetails?
    var clbLevelForPrimaryLanguage:Int = 0
    var clbLevelForSecondaryLanguage:Int = 0
    
    var primaryspeakingSliderValue:Double = 0.0
    var primarylisteningSliderValue:Double = 0.0
    var primaryreadingSliderValue:Double = 0.0
    var primarywritingSliderValue:Double = 0.0
    
    var secondaryspeakingSliderValue:Double = 0.0
    var secondarylisteningSliderValue:Double = 0.0
    var secondaryreadingSliderValue:Double = 0.0
    var secondarywritingSliderValue:Double = 0.0

    var isMarried = false
    var isSpouseSection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarTableView.register(UINib(nibName: SaveButtonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: SaveButtonTableViewCell.cellIdentifier)
        progressBarTableView.register(UINib(nibName: LanguageProgressBarTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: LanguageProgressBarTableViewCell.cellIdentifier)
        progressBarTableView.reloadData()
        progressBarTableView.rowHeight = UITableView.automaticDimension
        progressBarTableView.estimatedRowHeight = 50//screenHeight * 50 / 667.0
        
        secondaryButton.isHidden = isSpouseSection
        
//        if isMarried {
//            marriedCRSCalculatorInfo = languageCalculatorInfo
//        } else {
//            marriedCRSCalculatorInfo = nil
//        }
        // Do any additional setup after loading the view.
        selectedPrimaryLanguage = languageCalculatorInfo?.factorSaction[0].value.first(where: { $0.isSelected == true && $0.title == languageCalculatorInfo?.languageInfoData.primaryLanguage})
        selectedSecondaryLanguage = languageCalculatorInfo?.factorSaction[1].value.first(where: { $0.isSelected == true && $0.title == languageCalculatorInfo?.languageInfoData.secondaryLanguage})
        
        setData()
        languagePickerView.isHidden = true
        
        if selectedPrimaryLanguage == nil {
            selectedPrimaryLanguage = languageCalculatorInfo?.factorSaction[0].value.first
            selectedPrimaryLanguage?.isSelected = true
        }
        
        if selectedSecondaryLanguage == nil {
            selectedSecondaryLanguage = languageCalculatorInfo?.factorSaction[0].value.last
            selectedSecondaryLanguage?.isSelected = true
        }
        
        languageCalculatorInfo?.languageInfoData.primaryLanguage = selectedPrimaryLanguage?.title ?? ""
        languageCalculatorInfo?.languageInfoData.secondaryLanguage = selectedSecondaryLanguage?.title ?? ""
        
        setLanguageValue()
        updateLanguageArray()
        
        primaryspeakingSliderValue = languageCalculatorInfo?.languageInfoData.primaryspeakingSliderValue ?? 0.0
        primarylisteningSliderValue = languageCalculatorInfo?.languageInfoData.primarylisteningSliderValue ?? 0.0
         primaryreadingSliderValue = languageCalculatorInfo?.languageInfoData.primaryreadingSliderValue ?? 0.0
         primarywritingSliderValue = languageCalculatorInfo?.languageInfoData.primarywritingSliderValue ?? 0.0
        
         secondaryspeakingSliderValue = languageCalculatorInfo?.languageInfoData.secondaryspeakingSliderValue ?? 0.0
        secondarylisteningSliderValue = languageCalculatorInfo?.languageInfoData.secondarylisteningSliderValue ?? 0.0
        secondaryreadingSliderValue = languageCalculatorInfo?.languageInfoData.secondaryreadingSliderValue ?? 0.0
        secondarywritingSliderValue = languageCalculatorInfo?.languageInfoData.secondarywritingSliderValue ?? 0.0
        resetSliders()
        updateSliderRange()
        calculateCLB()
    }
    
    private func setData() {
        primaryLanguageArray = ["IELTS", "CELPIP", "TEF Canada", "TCF Canada"]//languageCalculatorInfo?.factorSaction[0].value.map({ $0.title }) ?? [""]
        secondaryLanguageArray = ["IELTS", "CELPIP", "TEF Canada", "TCF Canada"] //languageCalculatorInfo?.factorSaction[1].value.map({ $0.title }) ?? [""]

        screenTitleLabel.text = "CALCULATE CRS SCORE"
        sectionTitleLabel.text = languageCalculatorInfo?.factorTitle ?? ""
        sectionValueLabel.text = "100"
        
        if let itemDetailsArray = languageCalculatorInfo?.factorSaction, !itemDetailsArray.isEmpty, let firstItemDetails = itemDetailsArray.first, let lastItemDetails = itemDetailsArray.last {
            primaryArray = firstItemDetails.value
            secondaryArray = lastItemDetails.value
        }
        
        setLanguageValue()
        updateSliderRange()
        resetSliders()
        calculateCLB()
    }
    
    func resetSliders() {
        speakingSlider.value = 1.0
        listeningSlider.value = 1.0
        readingSlider.value = 1.0
        writingSlider.value = 1.0
        
        if primaryButton.tag == 1 {
            speakingSlider?.value = Float(primaryspeakingSliderValue)
            listeningSlider?.value = Float(primarylisteningSliderValue )
            readingSlider?.value = Float(primaryreadingSliderValue )
            writingSlider?.value = Float(primarywritingSliderValue )
        } else if secondaryButton.tag == 1 {
            speakingSlider?.value = Float(secondaryspeakingSliderValue)
            listeningSlider?.value = Float(secondarylisteningSliderValue)
            readingSlider?.value = Float(secondaryreadingSliderValue)
            writingSlider?.value = Float(secondarywritingSliderValue)
        }
    }
    
    func setLanguageValue() {
//        selectedPrimaryLanguage = languageCalculatorInfo?.factorSaction[0].value.first(where: { $0.isSelected == true && $0.title == languageCalculatorInfo?.languageInfoData.primaryLanguage})
//        selectedSecondaryLanguage = languageCalculatorInfo?.factorSaction[1].value.first(where: { $0.isSelected == true && $0.title == languageCalculatorInfo?.languageInfoData.secondaryLanguage})
        
        if primaryButton.tag == 1 {
            if let language = selectedPrimaryLanguage?.title, language != "" {
                languageLabel.text = language
            } else {
                if !primaryArray.isEmpty, let itemDetail = primaryArray.first {
                    languageLabel.text = itemDetail.title
                }
            }
        } else if secondaryButton.tag == 1 {
            if let language = selectedSecondaryLanguage?.title, language != "" {
                languageLabel.text = language
            } else {
                if !secondaryArray.isEmpty, let itemDetail = secondaryArray.first {
                    languageLabel.text = itemDetail.title
                }
            }
        }
    }
    
    func updateSliderRange() {
        
        var selectedLanguageTitle = ""
        
        if primaryButton.tag == 1 {
            selectedLanguageTitle = selectedPrimaryLanguage?.title ?? ""
        }
        
        if secondaryButton.tag == 1 {
            selectedLanguageTitle = selectedSecondaryLanguage?.title ?? ""
        }
        
        switch selectedLanguageTitle {
        case "IELTS":
            speakingSlider.minimumValue = 3
            speakingSlider.maximumValue = 9
            listeningSlider.minimumValue = 3
            listeningSlider.maximumValue = 9
            readingSlider.minimumValue = 3
            readingSlider.maximumValue = 9
            writingSlider.minimumValue = 3
            writingSlider.maximumValue = 9
            break
        case "CELPIP":
            speakingSlider.minimumValue = 0
            speakingSlider.maximumValue = 12
            listeningSlider.minimumValue = 0
            listeningSlider.maximumValue = 12
            readingSlider.minimumValue = 0
            readingSlider.maximumValue = 12
            writingSlider.minimumValue = 0
            writingSlider.maximumValue = 12
            break
        case "TEF Canada":
            speakingSlider.minimumValue = 180
            speakingSlider.maximumValue = 450
            listeningSlider.minimumValue = 144
            listeningSlider.maximumValue = 360
            readingSlider.minimumValue = 120
            readingSlider.maximumValue = 300
            writingSlider.minimumValue = 180
            writingSlider.maximumValue = 450
            break
        case "TCF Canada":
            speakingSlider.minimumValue = 4
            speakingSlider.maximumValue = 20
            listeningSlider.minimumValue = 331
            listeningSlider.maximumValue = 699
            readingSlider.minimumValue = 342
            readingSlider.maximumValue = 699
            writingSlider.minimumValue = 4
            writingSlider.maximumValue = 20
            break
        default:
            break
        }
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        progressBarTableView.setContentOffset(.zero, animated: true)
        if primaryButton.tag == 2 {
            primaryButton.applySolidBG(backgroundColor:.darkSlateBlue , borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .whiteColor)
            primaryButton.tag = 1
            
            secondaryButton.applyHollowBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            secondaryButton.tag = 2
            updateLanguageArray()
            setLanguageValue()
            updateSliderRange()
            resetSliders()
            calculateCLB()
            languagePickerView.reloadAllComponents()
        }
    }
    
    @IBAction func secondaryButtonAction(_ sender: Any) {
        progressBarTableView.setContentOffset(.zero, animated: true)
        if secondaryButton.tag == 2 {
            secondaryButton.applySolidBG(backgroundColor:.darkSlateBlue , borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .whiteColor)
            secondaryButton.tag = 1
            
            primaryButton.applyHollowBG(backgroundColor: .whiteColor, borderWidth: 1, borderColor: UIColor(red: 20.0 / 255.0, green: 61.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0).cgColor, tittleColor: .darkSlateBlue)
            primaryButton.tag = 2
            
            updateLanguageArray()
            setLanguageValue()
            updateSliderRange()
            resetSliders()
            calculateCLB()
            languagePickerView.reloadAllComponents()
        }
    }
    
    @IBAction func dropDownButtonAction(_ sender: Any) {
        languagePickerView.isHidden = false
        languagePickerView.reloadAllComponents()
    }
    
    func speakingSliderValueChanged(_ sender: Any) {
        if primaryButton.tag == 1 {
            if let title = selectedPrimaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                speakingSlider.setValue((round(speakingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                speakingSlider.setValue((round(speakingSlider.value / 1.0) * 1.0), animated: false)
            }
            primaryspeakingSliderValue = Double(speakingSlider?.value ?? 0.0)
        }
        
        if secondaryButton.tag == 1 {
            if let title = selectedSecondaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                speakingSlider.setValue((round(speakingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                speakingSlider.setValue((round(speakingSlider.value / 1.0) * 1.0), animated: false)
            }
            secondaryspeakingSliderValue = Double(speakingSlider?.value ?? 0.0)
        }
        calculateCLB()
    }
    
    func listeningSliderValueChanged(_ sender: Any) {
        if primaryButton.tag == 1 {
            if let title = selectedPrimaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                listeningSlider.setValue((round(listeningSlider.value / 0.5) * 0.5), animated: false)
            } else {
                listeningSlider.setValue((round(listeningSlider.value / 1.0) * 1.0), animated: false)
            }
            primarylisteningSliderValue = Double(listeningSlider?.value ?? 0.0)
        }
        
        if secondaryButton.tag == 1 {
            if let title = selectedSecondaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                listeningSlider.setValue((round(listeningSlider.value / 0.5) * 0.5), animated: false)
            } else {
                listeningSlider.setValue((round(listeningSlider.value / 1.0) * 1.0), animated: false)
            }
            secondarylisteningSliderValue = Double(listeningSlider?.value ?? 0.0)
        }
        calculateCLB()
    }
    
    func readingSliderValueChanged(_ sender: Any) {
        if primaryButton.tag == 1 {
            if let title = selectedPrimaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                readingSlider.setValue((round(readingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                readingSlider.setValue((round(readingSlider.value / 1.0) * 1.0), animated: false)
            }
            primaryreadingSliderValue = Double(readingSlider?.value ?? 0.0)
        }
        
        if secondaryButton.tag == 1 {
            if let title = selectedSecondaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                readingSlider.setValue((round(readingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                readingSlider.setValue((round(readingSlider.value / 1.0) * 1.0), animated: false)
            }
            secondaryreadingSliderValue = Double(readingSlider?.value ?? 0.0)
        }
        calculateCLB()
    }
    
    func writingSliderValueChanged(_ sender: Any) {
        if primaryButton.tag == 1 {
            if let title = selectedPrimaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                writingSlider.setValue((round(writingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                writingSlider.setValue((round(writingSlider.value / 1.0) * 1.0), animated: false)
            }
            primarywritingSliderValue = Double(writingSlider?.value ?? 0.0)
        }
        
        if secondaryButton.tag == 1 {
            if let title = selectedSecondaryLanguage?.title, !title.isEmpty, title == "IELTS" {
                writingSlider.setValue((round(writingSlider.value / 0.5) * 0.5), animated: false)
            } else {
                writingSlider.setValue((round(writingSlider.value / 1.0) * 1.0), animated: false)
            }
            secondarywritingSliderValue = Double(writingSlider?.value ?? 0.0)
        }
        calculateCLB()
    }
    
    func calculateCLB() {
        progressBarTableView.reloadData()
        
        let primaryRatingArray = [primaryspeakingSliderValue,primarylisteningSliderValue,primaryreadingSliderValue,primarywritingSliderValue]
        if let minimumValue = primaryRatingArray.min() {
            clbLevelForPrimaryLanguage = calculateCLBForPrimary(minValue: minimumValue)
            if !isSpouseSection {
                if marriedCRSCalculatorInfo == nil {
                    AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel = Int(clbLevelForPrimaryLanguage)
                } else {
                    AppContext.sharedAppContext.primarySingleLanguageCLBLevel = Int(clbLevelForPrimaryLanguage)
                }
            }
        }
    
        let secondaryRatingArray = [secondaryspeakingSliderValue,secondarylisteningSliderValue,secondaryreadingSliderValue,secondarywritingSliderValue]
        if let minimumValue = secondaryRatingArray.min() {
            clbLevelForSecondaryLanguage = calculateCLBForSecondary(minValue: minimumValue)
            //AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel = Int(clbLevelForSecondaryLanguage)
        }
    
        let totalCRSSCore = calculateCRSScoreForPrimary(minValue: 0) + calculateCRSScoreForSecondary(minValue: 0)
        sectionValueLabel.text = "\(totalCRSSCore)"
    }
}

extension LanguageViewController: SaveButtonCellDelegate {
    func didClickOnSaveButton() {
        languageCalculatorInfo?.languageInfoData.primaryLanguage = selectedPrimaryLanguage?.title ?? ""
        languageCalculatorInfo?.languageInfoData.primaryspeakingSliderValue = primaryspeakingSliderValue
        languageCalculatorInfo?.languageInfoData.primarylisteningSliderValue = primarylisteningSliderValue
        languageCalculatorInfo?.languageInfoData.primaryreadingSliderValue = primaryreadingSliderValue
        languageCalculatorInfo?.languageInfoData.primarywritingSliderValue = primarywritingSliderValue
        
        languageCalculatorInfo?.languageInfoData.secondaryLanguage = selectedSecondaryLanguage?.title ?? ""
        languageCalculatorInfo?.languageInfoData.secondaryspeakingSliderValue = secondaryspeakingSliderValue
        languageCalculatorInfo?.languageInfoData.secondarylisteningSliderValue = secondarylisteningSliderValue
        languageCalculatorInfo?.languageInfoData.secondaryreadingSliderValue = secondaryreadingSliderValue
        languageCalculatorInfo?.languageInfoData.secondarywritingSliderValue = secondarywritingSliderValue
        
        languageCalculatorInfo?.factorValue = sectionValueLabel.text ?? ""
        if !isSpouseSection {
            if marriedCRSCalculatorInfo != nil { //single section
                AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsSingle = Utility.getFrenchLangScore(isSingle: true)
                AppContext.sharedAppContext.maxValueForASectionSingleLanguages = Int(sectionValueLabel.text ?? "") ?? 0
                
                marriedCRSCalculatorInfo?.languageInfoData.primaryLanguage = selectedPrimaryLanguage?.title ?? ""
                marriedCRSCalculatorInfo?.languageInfoData.primaryspeakingSliderValue = primaryspeakingSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.primarylisteningSliderValue = primarylisteningSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.primaryreadingSliderValue = primaryreadingSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.primarywritingSliderValue = primarywritingSliderValue
                
                marriedCRSCalculatorInfo?.languageInfoData.secondaryLanguage = selectedSecondaryLanguage?.title ?? ""
                marriedCRSCalculatorInfo?.languageInfoData.secondaryspeakingSliderValue = secondaryspeakingSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.secondarylisteningSliderValue = secondarylisteningSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.secondaryreadingSliderValue = secondaryreadingSliderValue
                marriedCRSCalculatorInfo?.languageInfoData.secondarywritingSliderValue = secondarywritingSliderValue
                
                let totalCRSSCore = calculateCRSScoreForPrimary1(minValue: 0) + calculateCRSScoreForSecondary1(minValue: 0)
                AppContext.sharedAppContext.maxValueForASectionMarriedLanguage = totalCRSSCore
                
                marriedCRSCalculatorInfo?.factorValue = "\(totalCRSSCore)"
                //Utility.setScoreForEducation(isSingle: false)
                //Utility.setScoreForExperience(isSingle: false, experienceInfo: AppContext.sharedAppContext.marriedArray[3])
                AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel = AppContext.sharedAppContext.primarySingleLanguageCLBLevel
                AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsMarried = Utility.getFrenchLangScore(isSingle: false)
            } else {//married section
                AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsMarried = Utility.getFrenchLangScore(isSingle: false)
                AppContext.sharedAppContext.maxValueForASectionMarriedLanguage = Int(sectionValueLabel.text ?? "") ?? 0
            }
        }
        if !isSpouseSection {
            if marriedCRSCalculatorInfo != nil {
                Utility.setScoreForEducation(isSingle: true)
                Utility.setScoreForExperience(isSingle: true, experienceInfo: AppContext.sharedAppContext.singleArray[3])
            } else {
                Utility.setScoreForEducation(isSingle: false)
                Utility.setScoreForExperience(isSingle: false, experienceInfo: AppContext.sharedAppContext.marriedArray[3])
            }
        } else {
            AppContext.sharedAppContext.maxValueForBSectionLanguage = Int(sectionValueLabel.text ?? "") ?? 0
        }
        
        //updateMarriedCRSInfo()
        if isSpouseSection {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_spouse_language_score", eventProperties: ["value":sectionValueLabel.text ?? "0"])
        } else {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_language_score", eventProperties: ["value":sectionValueLabel.text ?? "0"])
        }
        navigationController?.popViewController(animated: true)
    }
}

extension LanguageViewController: SliderDelegate {
    func sliderValueChanged(tag: Int, newValue: UISlider) {
        switch tag {
        case 0:
            speakingSlider = newValue
            speakingSliderValueChanged(newValue)
        case 1:
            listeningSlider = newValue
            listeningSliderValueChanged(newValue)
        case 2:
            readingSlider = newValue
            readingSliderValueChanged(newValue)
        case 3:
            writingSlider = newValue
            writingSliderValueChanged(newValue)
        default:
            break
        }
    }
}

extension LanguageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension LanguageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 { //add language button
            if let cell = tableView.dequeueReusableCell(withIdentifier: SaveButtonTableViewCell.cellIdentifier, for: indexPath) as? SaveButtonTableViewCell {
                cell.configureSaveButtonCell(buttonTitle: "Add Language")
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LanguageProgressBarTableViewCell.cellIdentifier, for: indexPath) as? LanguageProgressBarTableViewCell {
                cell.configureCell(withTag: indexPath.row, sliderRange: getSliderRange(forRow: indexPath.row), sliderValue: getSliderValue(forRow: indexPath.row))
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }
    }
    
    func getSliderRange(forRow: Int) -> (Float, Float) {
        switch forRow {
        case 0:
            return (speakingSlider.minimumValue, speakingSlider.maximumValue)
        case 1:
            return (listeningSlider.minimumValue, listeningSlider.maximumValue)
        case 2:
            return (readingSlider.minimumValue, readingSlider.maximumValue)
        case 3:
            return (writingSlider.minimumValue, writingSlider.maximumValue)
        default:
            return (0.0, 0.0)
        }
    }
    
    func getSliderValue(forRow: Int) -> (Double) {
        switch forRow {
        case 0:
            return (primaryButton.tag == 1 ? primaryspeakingSliderValue : secondaryspeakingSliderValue)
        case 1:
            return (primaryButton.tag == 1 ? primarylisteningSliderValue : secondarylisteningSliderValue)
        case 2:
            return (primaryButton.tag == 1 ? primaryreadingSliderValue : secondaryreadingSliderValue)
        case 3:
            return (primaryButton.tag == 1 ? primarywritingSliderValue : secondarywritingSliderValue)
        default:
            return (0.0)
        }
    }
}

extension LanguageViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if primaryButton.tag == 1 {
           return primaryLanguageArray.count
        }
        return secondaryLanguageArray.count
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
        if primaryButton.tag == 1 {
            pickerLabel?.text = primaryLanguageArray[row]
        } else if secondaryButton.tag == 1 {
            pickerLabel?.text = secondaryLanguageArray[row]
        }
        
        return pickerLabel!
    }
}

extension LanguageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        50.0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        primaryLanguageArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if primaryButton.tag == 1 {
            primaryspeakingSliderValue = 0.0
            primarylisteningSliderValue = 0.0
             primaryreadingSliderValue = 0.0
             primarywritingSliderValue = 0.0
            
            resetSliders()
            
            languageLabel.text = primaryLanguageArray[row]
            let selectedLanguageObject = primaryArray.filter{($0.title == primaryLanguageArray[row])}
            if !selectedLanguageObject.isEmpty {
                selectedPrimaryLanguage = selectedLanguageObject.first
                selectedPrimaryLanguage?.isSelected = true
            }
        } else if secondaryButton.tag == 1 {
            secondaryspeakingSliderValue = 0.0
            secondarylisteningSliderValue = 0.0
            secondaryreadingSliderValue = 0.0
            secondarywritingSliderValue = 0.0
            
            resetSliders()
            
            languageLabel.text = secondaryLanguageArray[row]
            
            let selectedLanguageObject = secondaryArray.filter{($0.title == secondaryLanguageArray[row])}
            if !selectedLanguageObject.isEmpty {
                selectedSecondaryLanguage = selectedLanguageObject.first
                selectedSecondaryLanguage?.isSelected = true
            }
        }
        updateLanguageArray()
        updateSliderRange()
        calculateCLB()
        languagePickerView.isHidden = true
    }
    
    func updateLanguageArray() {
        
        if let language = selectedPrimaryLanguage {
            if language.title == "IELTS" || language.title == "CELPIP" {
                secondaryLanguageArray = ["TEF Canada", "TCF Canada"]
                if let itemDetailsArray = languageCalculatorInfo?.factorSaction, !itemDetailsArray.isEmpty {
                    secondaryArray = [itemDetailsArray[1].value[2], itemDetailsArray[1].value[3]]
                    selectedSecondaryLanguage = secondaryArray.first
                }
                
            } else if language.title == "TEF Canada" || language.title == "TCF Canada" {
                secondaryLanguageArray = ["IELTS", "CELPIP"]
                if let itemDetailsArray = languageCalculatorInfo?.factorSaction, !itemDetailsArray.isEmpty {
                    secondaryArray = [itemDetailsArray[1].value[0], itemDetailsArray[1].value[1]]
                    selectedSecondaryLanguage = secondaryArray.first
                }
            }
        }
        
//        if let language = selectedSecondaryLanguage {
//            if language.title == "IELTS" || language.title == "CELPIP" {
//                primaryLanguageArray = ["TEF Canada", "TCF Canada"]
//
//                if let itemDetailsArray = languageCalculatorInfo?.factorSaction, !itemDetailsArray.isEmpty {
//                    primaryArray = [itemDetailsArray[0].value[2], itemDetailsArray[0].value[3]]
//                }
//            } else if language.title == "TEF Canada" || language.title == "TCF Canada" {
//                primaryLanguageArray = ["IELTS", "CELPIP"]
//
//                if let itemDetailsArray = languageCalculatorInfo?.factorSaction, !itemDetailsArray.isEmpty {
//                    primaryArray = [itemDetailsArray[0].value[0], itemDetailsArray[0].value[1]]
//                }
//            }
//        }
    }
    
    func calculateCLBForPrimary(minValue: Double) -> Int {
                
        var scoreArray = [Int]()
        
        if selectedPrimaryLanguage?.title == "IELTS" {
            if primaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Speaking(value: Float(minValue)))
            }
            if primarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Listening(value: Float(minValue)))
            }
            if primaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Reading(value: Float(minValue)))
            }
            if primarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Writing(value: Float(minValue)))
            }
            return scoreArray.min() ?? 0
        } else if selectedPrimaryLanguage?.title == "CELPIP" {
            
            if primaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Speaking(value: Int(minValue)))
            }
            if primarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Listening(value: Int(minValue)))
            }
            if primaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Reading(value: Int(minValue)))
            }
            if primarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        } else if selectedPrimaryLanguage?.title == "TEF Canada" {
            
            if primaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(minValue)))
            }
            if primarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Listening(value: Int(minValue)))
            }
            if primaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Reading(value: Int(minValue)))
            }
            if primarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        }  else if selectedPrimaryLanguage?.title == "TCF Canada" {
            
            if primaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(minValue)))
            }
            if primarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Listening(value: Int(minValue)))
            }
            if primaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Reading(value: Int(minValue)))
            }
            if primarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        }
        return 0
    }
    
    func calculateCLBForSecondary(minValue: Double) -> Int {
                
        var scoreArray = [Int]()
        
        if selectedSecondaryLanguage?.title == "IELTS" {
            if secondaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Speaking(value: Float(minValue)))
            }
            if secondarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Listening(value: Float(minValue)))
            }
            if secondaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Reading(value: Float(minValue)))
            }
            if secondarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_IELTS_Writing(value: Float(minValue)))
            }
            return scoreArray.min() ?? 0
        } else if selectedSecondaryLanguage?.title == "CELPIP" {
            
            if secondaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Speaking(value: Int(minValue)))
            }
            if secondarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Listening(value: Int(minValue)))
            }
            if secondaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Reading(value: Int(minValue)))
            }
            if secondarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_CELPIP_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        } else if selectedSecondaryLanguage?.title == "TEF Canada" {
            
            if secondaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(minValue)))
            }
            if secondarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Listening(value: Int(minValue)))
            }
            if secondaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Reading(value: Int(minValue)))
            }
            if secondarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        }  else if selectedSecondaryLanguage?.title == "TCF Canada" {
            
            if secondaryspeakingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(minValue)))
            }
            if secondarylisteningSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Listening(value: Int(minValue)))
            }
            if secondaryreadingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Reading(value: Int(minValue)))
            }
            if secondarywritingSliderValue == minValue {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Writing(value: Int(minValue)))
            }
            return scoreArray.min() ?? 0
        }
        return 0
    }
    
    func calculateCRSScoreForPrimary(minValue: Double) -> Int {
        
        /*
         if marriedCRSCalculatorInfo != nil {
         scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
         } else {
         scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
         }
         */
                
        var scoreArray = [Int]()
        
        if selectedPrimaryLanguage?.title == "IELTS" {
            
            if isSpouseSection {
                
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(primarywritingSliderValue))))
            } else {
                
                if marriedCRSCalculatorInfo == nil {
                    
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(primarywritingSliderValue))))
            } else {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(primarywritingSliderValue))))
                }
            }
            
            return scoreArray.reduce(0, +)

        } else if selectedPrimaryLanguage?.title == "CELPIP" {
            
            
            if isSpouseSection {
                
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(primarywritingSliderValue))))
            } else {
                if marriedCRSCalculatorInfo == nil {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(primarywritingSliderValue))))
                } else {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(primarywritingSliderValue))))
                }
            }
            

            
            return scoreArray.reduce(0, +)
            
        } else if selectedPrimaryLanguage?.title == "TEF Canada" {
            
            if isSpouseSection {
                
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(primarywritingSliderValue))))
            } else {
                if marriedCRSCalculatorInfo == nil {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(primarywritingSliderValue))))
                } else {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(primarywritingSliderValue))))
                }
            }
            
            return scoreArray.reduce(0, +)
            
        }  else if selectedPrimaryLanguage?.title == "TCF Canada" {
            
            if isSpouseSection {
                
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSpouse(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(primarywritingSliderValue))))
            } else {
                
                if marriedCRSCalculatorInfo == nil {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(primarywritingSliderValue))))
                } else {
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(primarylisteningSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(primaryreadingSliderValue))))
                    scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(primarywritingSliderValue))))
                }
            }

            
            return scoreArray.reduce(0, +)
            
        }
        return 0
    }
    
    func calculateCRSScoreForPrimary1(minValue: Double) -> Int {
        var scoreArray = [Int]()
        
        if selectedPrimaryLanguage?.title == "IELTS" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(primaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(primarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(primaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(primarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)

        } else if selectedPrimaryLanguage?.title == "CELPIP" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(primaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(primarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(primaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(primarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        } else if selectedPrimaryLanguage?.title == "TEF Canada" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(primarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(primaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(primarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        }  else if selectedPrimaryLanguage?.title == "TCF Canada" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(primaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(primarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(primaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForPrimaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(primarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        }
        return 0
    }
    func calculateCRSScoreForSecondary(minValue: Double) -> Int {
                
        var scoreArray = [Int]()
        
        if selectedSecondaryLanguage?.title == "IELTS" {
            
            if marriedCRSCalculatorInfo == nil {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(secondarywritingSliderValue))))
            } else {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(secondarywritingSliderValue))))
            }
            
            return scoreArray.reduce(0, +)

        } else if selectedSecondaryLanguage?.title == "CELPIP" {
            
            if marriedCRSCalculatorInfo == nil {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(secondarywritingSliderValue))))
            } else {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(secondarywritingSliderValue))))
            }
            
            return scoreArray.reduce(0, +)
            
        } else if selectedSecondaryLanguage?.title == "TEF Canada" {
            
            if marriedCRSCalculatorInfo == nil {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            } else {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            }
            
            return scoreArray.reduce(0, +)
            
        }  else if selectedSecondaryLanguage?.title == "TCF Canada" {
            
            if marriedCRSCalculatorInfo == nil {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            } else {
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
                scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageSingle(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            }
            
            return scoreArray.reduce(0, +)
            
        }
        return 0
    }
    
    func calculateCRSScoreForSecondary1(minValue: Double) -> Int {
        
        var scoreArray = [Int]()
        
        if selectedSecondaryLanguage?.title == "IELTS" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Speaking(value: Float(secondaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Listening(value: Float(secondarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Reading(value: Float(secondaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_IELTS_Writing(value: Float(secondarywritingSliderValue))))
            return scoreArray.reduce(0, +)
            
        } else if selectedSecondaryLanguage?.title == "CELPIP" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Speaking(value: Int(secondaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Listening(value: Int(secondarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Reading(value: Int(secondaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_CELPIP_Writing(value: Int(secondarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        } else if selectedSecondaryLanguage?.title == "TEF Canada" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TEF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        }  else if selectedSecondaryLanguage?.title == "TCF Canada" {
            
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(secondaryspeakingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Listening(value: Int(secondarylisteningSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Reading(value: Int(secondaryreadingSliderValue))))
            scoreArray.append(AppContext.sharedAppContext.getCRSScoreForSecondaryLanguageMarried(clbLevel: Utility.getCLBLevel_TCF_Canada_Writing(value: Int(secondarywritingSliderValue))))
            
            return scoreArray.reduce(0, +)
            
        }
        return 0
    }
}








