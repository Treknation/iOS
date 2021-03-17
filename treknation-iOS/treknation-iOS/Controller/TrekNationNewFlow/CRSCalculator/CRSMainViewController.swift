//
//  CRSMainViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 13/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class CRSMainViewController: TNBaseViewController {
    
    @IBOutlet weak var screenTitleLabel: UILabel! {
        didSet {
            screenTitleLabel.font = UIFont.ThinSemiBold18Font
            screenTitleLabel.textColor = .darkSlateBlue
            screenTitleLabel.text = "CALCULATE CRS SCORE"
        }
    }
    @IBOutlet weak var yellowView: UIView! {
        didSet {
            yellowView.setCircleWithShadow()
        }
    }
    @IBOutlet weak var countLabel: UILabel! {
        didSet {
            countLabel.textColor = UIColor.darkSlateBlue
            countLabel.font = UIFont.ThinMedium24Font
        }
    }
    @IBOutlet weak var yourCRSScoreLabel: UILabel! {
        didSet {
            yourCRSScoreLabel.textColor = UIColor.darkSlateBlue
            yourCRSScoreLabel.font = UIFont.ThinMedium24Font
        }
    }
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var singleButton: UIButton! {
        didSet {
            singleButton.titleLabel?.font = UIFont.ThinMedium18Font
            singleButton.setTitleColor(UIColor.darkSlateBlue, for: .normal)
            singleButton.tag = 1
        }
    }
    @IBOutlet weak var marriedButton: UIButton! {
        didSet {
            marriedButton.titleLabel?.font = UIFont.ThinMedium18Font
            marriedButton.setTitleColor(UIColor.darkSlateBlue, for: .normal)
        }
    }
    @IBOutlet weak var selectionView: UIView! {
        didSet {
            selectionView.backgroundColor = UIColor.darkSlateBlue
        }
    }
    
    @IBOutlet weak var selectionViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var crsCalculatorTableView: UITableView!
    
    var crsFactorsSignleArray = AppContext.sharedAppContext.singleArray
    var crsFactorsMarriedArray = AppContext.sharedAppContext.marriedArray

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        yellowView.setCircleWithShadow()
        crsCalculatorTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        crsCalculatorTableView.register(UINib(nibName: EducationHeaderTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EducationHeaderTableViewCell.cellIdentifier)
        crsCalculatorTableView.register(UINib(nibName: CRSInfoTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CRSInfoTableViewCell.cellIdentifier)
        
        setData()
    }
    
    func setData() {
//        crsFactorsSignleArray = Utility.getAllCRSCalculatorDataForSingle()
//        crsFactorsMarriedArray = Utility.getAllCRSCalculatorDataForMarried()
        reloadUI()
    }
    
    func reloadUI() {
        countLabel.text = getTotalScore()
        crsCalculatorTableView.reloadData()
    }
    
    @IBAction func singleButtonAction(_ sender: Any) {
        selectionViewLeadingConstraint.constant = singleButton.frame.width/2 + singleButton.frame.origin.x - selectionView.frame.size.width/2
        singleButton.tag = 1
        reloadUI()
        tableViewTopConstraint.constant = 60
        self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_relation_status", eventProperties: ["value":"single"])
    }
    
    @IBAction func marriedButtonAction(_ sender: Any) {
        selectionViewLeadingConstraint.constant = marriedButton.frame.width/2 + marriedButton.frame.origin.x - selectionView.frame.size.width/2
        singleButton.tag = 2
        reloadUI()
        tableViewTopConstraint.constant = 20
        self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_relation_status", eventProperties: ["value":"married"])
    }
    
    @IBAction func resetButtonClicked() {
        resetData()
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension CRSMainViewController {
    
    func getTotalScore() -> String {
        
        var total = 0
        if singleButton.tag == 1 {
//            _ = crsFactorsSignleArray.map({
//                total += Int($0.factorValue) ?? 0
//            })
//            total += AppContext.sharedAppContext.langEducationScoreSingle + AppContext.sharedAppContext.langForeignExperienceScoreSingle + AppContext.sharedAppContext.eduExperienceScoreSingle
            
            total += getMaxScoreForASectionSingle() + getMaxScoreForBSectionSpouse() + getMaxScoreForCSection(isSingle: true) + getMaxScoreForDSection(isSingle: true)
            print("Single:- \n Section A: \(getMaxScoreForASectionSingle()) \n Section B: \(getMaxScoreForBSectionSpouse()) \n Section C: \(getMaxScoreForCSection(isSingle: true)) \n Section D: \(getMaxScoreForDSection(isSingle: true))")
        } else {
//            _ = crsFactorsMarriedArray.map({
//                total += Int($0.factorValue) ?? 0
//            })
//            total += AppContext.sharedAppContext.langEducationScoreMarried + AppContext.sharedAppContext.langForeignExperienceScoreMarried + AppContext.sharedAppContext.eduExperienceScoreMarried
            total += getMaxScoreForASectionMarried() + getMaxScoreForBSectionSpouse() + getMaxScoreForCSection(isSingle: false) + getMaxScoreForDSection(isSingle: false)
            print("Married:- \n Section A: \(getMaxScoreForASectionMarried()) \n Section B: \(getMaxScoreForBSectionSpouse()) \n Section C: \(getMaxScoreForCSection(isSingle: false)) \n Section D: \(getMaxScoreForDSection(isSingle: false))")
        }
        self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_total_score", eventProperties: ["value":"\(total)"])
        
        return "\(total)"
    }
    
    // To Do
    func getMaxScoreForASectionSingle() -> Int {
        AppContext.sharedAppContext.maxValueForASectionSingle = AppContext.sharedAppContext.maxValueForASectionSingleAge + AppContext.sharedAppContext.maxValueForASectionSingleEducation +
            AppContext.sharedAppContext.maxValueForASectionSingleLanguages +
            AppContext.sharedAppContext.maxValueForASectionSingleCanadianWorkEx
        
        if AppContext.sharedAppContext.maxValueForASectionSingle > 500 {
            return 500
        }
        
        return AppContext.sharedAppContext.maxValueForASectionSingle
    }
    
    // To Do
    func getMaxScoreForASectionMarried() -> Int {
        AppContext.sharedAppContext.maxValueForASectionMarried = AppContext.sharedAppContext.maxValueForASectionMarriedAge + AppContext.sharedAppContext.maxValueForASectionMarriedEducation +
            AppContext.sharedAppContext.maxValueForASectionMarriedLanguage +
            AppContext.sharedAppContext.maxValueForASectionMarriedCanadianWorkEx
        
        if AppContext.sharedAppContext.maxValueForASectionMarried > 460 {
            return 460
        }
        
        return AppContext.sharedAppContext.maxValueForASectionMarried
    }
    
    // To Do
    func getMaxScoreForBSectionSpouse() -> Int {
        AppContext.sharedAppContext.maxValueForBSection = AppContext.sharedAppContext.maxValueForBSectionEducation + AppContext.sharedAppContext.maxValueForBSectionLanguage + AppContext.sharedAppContext.maxValueForBSectionCanadianWorkEx
        
        if AppContext.sharedAppContext.maxValueForBSection > 40 {
            return 40
        }
        
        return AppContext.sharedAppContext.maxValueForBSection
    }
    
    // To Do
    func getMaxScoreForCSection(isSingle:Bool) -> Int {
        if isSingle {
            AppContext.sharedAppContext.maxValueForCSectionEducationSingle = AppContext.sharedAppContext.langEducationScoreSingle + AppContext.sharedAppContext.eduExperienceScoreSingle
            
            AppContext.sharedAppContext.maxValueForCSection = (AppContext.sharedAppContext.maxValueForCSectionEducationSingle > 50 ? 50 : AppContext.sharedAppContext.maxValueForCSectionEducationSingle) + ((AppContext.sharedAppContext.langForeignExperienceScoreSingle + AppContext.sharedAppContext.canadianForeignExperienceScoreSingle) > 50 ? 50 : (AppContext.sharedAppContext.langForeignExperienceScoreSingle + AppContext.sharedAppContext.canadianForeignExperienceScoreSingle)) + AppContext.sharedAppContext.experienceCertificateSingle
            //AppContext.sharedAppContext.experienceScoreSingle +
            if AppContext.sharedAppContext.maxValueForCSection > 100 {
                return 100
            }
            return AppContext.sharedAppContext.maxValueForCSection
        } else {
            AppContext.sharedAppContext.maxValueForCSectionEducationMarried = AppContext.sharedAppContext.langEducationScoreMarried + AppContext.sharedAppContext.eduExperienceScoreMarried
            AppContext.sharedAppContext.maxValueForCSection = (AppContext.sharedAppContext.maxValueForCSectionEducationMarried > 50 ? 50 : AppContext.sharedAppContext.maxValueForCSectionEducationMarried) + ((AppContext.sharedAppContext.langForeignExperienceScoreMarried + AppContext.sharedAppContext.canadianForeignExperienceScoreMarried) > 50 ? 50 : (AppContext.sharedAppContext.langForeignExperienceScoreMarried + AppContext.sharedAppContext.canadianForeignExperienceScoreMarried)) + AppContext.sharedAppContext.experienceCertificateMarried
            //AppContext.sharedAppContext.experienceScoreMarried +
            if AppContext.sharedAppContext.maxValueForCSection > 100 {
                return 100
            }
            return AppContext.sharedAppContext.maxValueForCSection
        }
    }
    
    // To Do
    func getMaxScoreForDSection(isSingle:Bool) -> Int {
        if isSingle {
            AppContext.sharedAppContext.maxValueForDSectionSingle = AppContext.sharedAppContext.maxValueForDSectionPNPSingle + AppContext.sharedAppContext.maxValueForDSectionBrother_sisterSingle + AppContext.sharedAppContext.maxValueForDSectionLMIASingle + AppContext.sharedAppContext.maxValueForDSectionCanadian_educationSingle + AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsSingle
            
            if AppContext.sharedAppContext.maxValueForDSectionSingle > 600 {
                return 600
            }
            return AppContext.sharedAppContext.maxValueForDSectionSingle
        } else {
            AppContext.sharedAppContext.maxValueForDSectionMarried = AppContext.sharedAppContext.maxValueForDSectionPNPMarried + AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried + AppContext.sharedAppContext.maxValueForDSectionLMIAMarried + AppContext.sharedAppContext.maxValueForDSectionCanadian_educationMarried + AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsMarried
            
            if AppContext.sharedAppContext.maxValueForDSectionMarried > 600 {
                return 600
            }
            return AppContext.sharedAppContext.maxValueForDSectionMarried
        }
    }
    
    func resetData() {
        _ = crsFactorsSignleArray.map({
            $0.resetAll()
        })
        _ = crsFactorsMarriedArray.map({
            $0.resetAll()
        })
        AppContext.sharedAppContext.primarySingleLanguageCLBLevel = 0
        AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel = 0
        AppContext.sharedAppContext.yesCheckboxSelected = false
        //A
        AppContext.sharedAppContext.maxValueForASectionSingle = 0
        AppContext.sharedAppContext.maxValueForASectionSingleAge = 0
        AppContext.sharedAppContext.maxValueForASectionSingleEducation = 0
        AppContext.sharedAppContext.maxValueForASectionSingleLanguages = 0
        AppContext.sharedAppContext.maxValueForASectionSingleCanadianWorkEx = 0
        //B
        AppContext.sharedAppContext.maxValueForBSection = 0
        AppContext.sharedAppContext.maxValueForBSectionEducation = 0
        AppContext.sharedAppContext.maxValueForBSectionLanguage = 0
        AppContext.sharedAppContext.maxValueForBSectionCanadianWorkEx = 0
        //C
        AppContext.sharedAppContext.maxValueForCSectionEducationSingle = 0
        AppContext.sharedAppContext.langEducationScoreSingle = 0
        AppContext.sharedAppContext.maxValueForCSection = 0
        AppContext.sharedAppContext.langForeignExperienceScoreSingle = 0
        AppContext.sharedAppContext.canadianForeignExperienceScoreSingle = 0
        AppContext.sharedAppContext.experienceCertificateSingle = 0
        AppContext.sharedAppContext.eduExperienceScoreSingle = 0
        AppContext.sharedAppContext.experienceScoreSingle = 0
        //D
        AppContext.sharedAppContext.maxValueForDSectionSingle = 0
        AppContext.sharedAppContext.maxValueForDSectionPNPSingle = 0
        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterSingle = 0
        AppContext.sharedAppContext.maxValueForDSectionLMIASingle = 0
        AppContext.sharedAppContext.maxValueForDSectionCanadian_educationSingle = 0
        AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsSingle = 0
        
        //Married
        //A
        AppContext.sharedAppContext.maxValueForASectionMarried = 0
        AppContext.sharedAppContext.maxValueForASectionMarriedAge = 0
        AppContext.sharedAppContext.maxValueForASectionMarriedEducation = 0
        AppContext.sharedAppContext.maxValueForASectionMarriedLanguage = 0
        AppContext.sharedAppContext.maxValueForASectionMarriedCanadianWorkEx = 0
        //C
        AppContext.sharedAppContext.maxValueForCSectionEducationMarried = 0
        AppContext.sharedAppContext.langEducationScoreMarried = 0
        AppContext.sharedAppContext.eduExperienceScoreMarried = 0
        AppContext.sharedAppContext.experienceScoreMarried = 0
        AppContext.sharedAppContext.langForeignExperienceScoreMarried = 0
        AppContext.sharedAppContext.canadianForeignExperienceScoreMarried = 0
        AppContext.sharedAppContext.experienceCertificateMarried = 0
        AppContext.sharedAppContext.eduExperienceScoreMarried = 0
        AppContext.sharedAppContext.experienceScoreMarried = 0
        //D
        AppContext.sharedAppContext.maxValueForDSectionMarried = 0
        AppContext.sharedAppContext.maxValueForDSectionPNPMarried = 0
        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried = 0
        AppContext.sharedAppContext.maxValueForDSectionLMIAMarried = 0
        AppContext.sharedAppContext.maxValueForDSectionCanadian_educationMarried = 0
        AppContext.sharedAppContext.maxValueForDSectionFrench_Language_additional_pointsMarried = 0
                   
        reloadUI()
    }
}

extension CRSMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if singleButton.tag == 2 && indexPath.row == crsFactorsMarriedArray.count {
            return UITableView.automaticDimension
        } else {
            return screenHeight * 70.0 / 667.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if singleButton.tag == 2 && indexPath.row == crsFactorsMarriedArray.count { return }
        
        let crsSection = (singleButton.tag == 1) ? crsFactorsSignleArray[indexPath.row] : crsFactorsMarriedArray[indexPath.row]
        let marriedCRSSection = crsFactorsMarriedArray[indexPath.row]
        switch crsSection.factorTitle {
        case "Age":
            let ageSelectionViewController = AgeSelectionViewController(nibName: "AgeSelectionViewController", bundle:nil)
            ageSelectionViewController.ageCalculatorInfo = crsSection
            ageSelectionViewController.marriedCRSCalculatorInfo = (singleButton.tag == 1) ? marriedCRSSection : nil
            self.navigationController?.pushViewController(ageSelectionViewController, animated: true)

        case "Education":
            let educationSelectionViewController = EducationViewController(nibName: "EducationViewController", bundle:nil)
            educationSelectionViewController.educationCalculatorInfo = crsSection
            educationSelectionViewController.marriedCRSCalculatorInfo = (singleButton.tag == 1) ? marriedCRSSection : nil
            self.navigationController?.pushViewController(educationSelectionViewController, animated: true)
            
        case "Language":
            let languageViewController = LanguageViewController(nibName: "LanguageViewController", bundle:nil)
            languageViewController.languageCalculatorInfo = crsSection
            languageViewController.isMarried = (singleButton.tag == 2) ? true : false
            languageViewController.marriedCRSCalculatorInfo = (singleButton.tag == 1) ? marriedCRSSection : nil
            self.navigationController?.pushViewController(languageViewController, animated: true)
            
        case "Work Experience":
            let experienceViewController = ExperienceViewController(nibName: "ExperienceViewController", bundle:nil)
            experienceViewController.educationCalculatorInfo = crsSection
            experienceViewController.marriedCRSCalculatorInfo = (singleButton.tag == 1) ? marriedCRSSection : nil
            self.navigationController?.pushViewController(experienceViewController, animated: true)
            
            case "Additional Points":
            let additionalPntsViewController = AdditionalPointsViewController(nibName: "AdditionalPointsViewController", bundle:nil)
            additionalPntsViewController.additionalPointsCalculatorInfo = crsSection
            additionalPntsViewController.marriedCRSCalculatorInfo = (singleButton.tag == 1) ? marriedCRSSection : nil
            self.navigationController?.pushViewController(additionalPntsViewController, animated: true)
            
            case "Spouse Education":
                let educationSelectionViewController = EducationViewController(nibName: "EducationViewController", bundle:nil)
                educationSelectionViewController.educationCalculatorInfo = crsSection
                educationSelectionViewController.isSpouseSection = true
                self.navigationController?.pushViewController(educationSelectionViewController, animated: true)
                
            case "Spouse Language":
                let languageViewController = LanguageViewController(nibName: "LanguageViewController", bundle:nil)
                languageViewController.languageCalculatorInfo = crsSection
                languageViewController.isSpouseSection = true
                self.navigationController?.pushViewController(languageViewController, animated: true)
                
            case "Spouse Experience":
                let experienceViewController = ExperienceViewController(nibName: "ExperienceViewController", bundle:nil)
                experienceViewController.educationCalculatorInfo = crsSection
                experienceViewController.isSpouseSection = true
                self.navigationController?.pushViewController(experienceViewController, animated: true)
            
        default:
            break;
        }
    }
}

extension CRSMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleButton.tag == 1 ? crsFactorsSignleArray.count : (crsFactorsMarriedArray.count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if singleButton.tag == 2 && indexPath.row == crsFactorsMarriedArray.count { //footer cell
            if let cell = tableView.dequeueReusableCell(withIdentifier: EducationHeaderTableViewCell.cellIdentifier, for: indexPath) as? EducationHeaderTableViewCell {
                cell.configureCRSMarriedTableFooter()
                return cell
            }
            return UITableViewCell()
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CRSInfoTableViewCell.cellIdentifier, for: indexPath) as? CRSInfoTableViewCell {
                cell.configureCell(CRSCalculatorInfo: singleButton.tag == 1 ? crsFactorsSignleArray[indexPath.row] : crsFactorsMarriedArray[indexPath.row])
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }
    }
    
    
}
