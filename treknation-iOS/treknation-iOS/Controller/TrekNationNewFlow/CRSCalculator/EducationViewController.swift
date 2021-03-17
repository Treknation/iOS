//
//  EducationViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/18/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class EducationViewController: TNBaseViewController {
    
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
    
    @IBOutlet weak var educationTableView: UITableView!
    
    var marriedCRSCalculatorInfo: TNCRSCalculatorInfo?
    var educationCalculatorInfo: TNCRSCalculatorInfo?
    var selectedScoreInsideCanada: ScoreDetails?
    var selectedScoreOutsideCanada: ScoreDetails?
    var isSpouseSection = false
//    var languageScore:Int = 0
//    var experienceScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        educationTableView.register(UINib(nibName: SaveButtonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: SaveButtonTableViewCell.cellIdentifier)
        educationTableView.register(UINib(nibName: EducationHeaderTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EducationHeaderTableViewCell.cellIdentifier)
        educationTableView.register(UINib(nibName: EducationTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EducationTableViewCell.cellIdentifier)
        educationTableView.reloadData()
        educationTableView.rowHeight = UITableView.automaticDimension
        educationTableView.sectionHeaderHeight = UITableView.automaticDimension
        educationTableView.estimatedRowHeight = screenHeight * 50 / 667.0
        educationTableView.estimatedSectionHeaderHeight = 0.0//screenHeight * 0 / 667.0
    }
    
    private func setData() {
        screenTitleLabel.text = "CALCULATE CRS SCORE"
        sectionTitleLabel.text = educationCalculatorInfo?.factorTitle ?? ""
//        saveButton.setTitle("Add Education", for: .normal)

        presetData()
        setScore()
        educationTableView.reloadData()
    }
    
    private func presetData() {
        //Inside Canada
        
//        let clbValue = marriedCRSCalculatorInfo == nil ? AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel : AppContext.sharedAppContext.primarySingleLanguageCLBLevel
        
        let subSection = educationCalculatorInfo?.factorSaction[0]
        if let index = subSection?.value.firstIndex(where: { $0.isSelected == true }) {
            selectedScoreInsideCanada = subSection?.value[index]
//            AppContext.sharedAppContext.langEducationScore = Utility.getValueBasedOnCLBLevelInsideCanada(section: index, clbValue: clbValue)
//            if marriedCRSCalculatorInfo == nil {
//                AppContext.sharedAppContext.eduExperienceScore = Utility.getValueBasedOnCanadianExperienceForEducation(section: index, experience: AppContext.sharedAppContext.experienceScoreMarried)
//            } else {
//                AppContext.sharedAppContext.eduExperienceScore = Utility.getValueBasedOnCanadianExperienceForEducation(section: index, experience: AppContext.sharedAppContext.experienceScoreSingle)
//            }
        }
        if !isSpouseSection {
            //Outside Canada
            let subSectionOutside = educationCalculatorInfo?.factorSaction[1]
            if let index = subSectionOutside?.value.firstIndex(where: { $0.isSelected == true }) {
                selectedScoreOutsideCanada = subSectionOutside?.value[index]
            }
        }
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func setScore() {
        let totalValue = (selectedScoreInsideCanada?.score.toInt() ?? 0) + (selectedScoreOutsideCanada?.score.toInt() ?? 0)
        sectionValueLabel.text = "\(totalValue)"
        if isSpouseSection {
            AppContext.sharedAppContext.maxValueForBSectionEducation = totalValue
        } else {
            if marriedCRSCalculatorInfo != nil {
                AppContext.sharedAppContext.maxValueForASectionSingleEducation = (selectedScoreInsideCanada?.score.toInt() ?? 0)
            } else {
                AppContext.sharedAppContext.maxValueForASectionMarriedEducation = (selectedScoreInsideCanada?.score.toInt() ?? 0)
            }
            
            if marriedCRSCalculatorInfo != nil {
                AppContext.sharedAppContext.maxValueForDSectionCanadian_educationSingle = (selectedScoreOutsideCanada?.score.toInt() ?? 0)
            } else {
                AppContext.sharedAppContext.maxValueForDSectionCanadian_educationMarried = (selectedScoreOutsideCanada?.score.toInt() ?? 0)
            }
        }
        if isSpouseSection {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_spouse_education_score", eventProperties: ["value":"\(totalValue)"])
        } else {
            self.logAnalyticsEventsForActionForUserProperties(eventName: "crs_education_score", eventProperties: ["value":"\(totalValue)"])
        }
    }
}

extension EducationViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var clbValue = marriedCRSCalculatorInfo == nil ? AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel : AppContext.sharedAppContext.primarySingleLanguageCLBLevel
        
//        if isSpouseSection {
//            clbValue = 0
//        }
        
        let subSection = educationCalculatorInfo?.factorSaction[indexPath.section]
        if indexPath.row == (subSection?.value.count ?? 0) + 1 {
            return
        } else {
            if indexPath.section == 0 {
                if subSection?.value[indexPath.row-1].title == selectedScoreInsideCanada?.title {
                    selectedScoreInsideCanada = nil
//                    languageScore = 0
//                    experienceScore = 0
                } else {
                    selectedScoreInsideCanada = subSection?.value[indexPath.row-1]
//                    AppContext.sharedAppContext.langEducationScore = Utility.getValueBasedOnCLBLevelInsideCanada(section: indexPath.row-1, clbValue: clbValue)
                    
                    if !isSpouseSection {
                        if marriedCRSCalculatorInfo == nil {
                            AppContext.sharedAppContext.eduExperienceScoreMarried = Utility.getValueBasedOnCanadianExperienceForEducation(section: indexPath.row-1, experience: AppContext.sharedAppContext.experienceScoreMarried)
                        } else {
                            AppContext.sharedAppContext.eduExperienceScoreSingle = Utility.getValueBasedOnCanadianExperienceForEducation(section: indexPath.row-1, experience: AppContext.sharedAppContext.experienceScoreSingle)
                        }
                    }
                }
            } else {
                if subSection?.value[indexPath.row-1].title == selectedScoreOutsideCanada?.title {
                    selectedScoreOutsideCanada = nil
                } else {
                    selectedScoreOutsideCanada = subSection?.value[indexPath.row-1]
                }
            }
            setScore()
            tableView.reloadData()
        }
    }
}

extension EducationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if !isSpouseSection {
            return educationCalculatorInfo?.factorSaction.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let subSection = educationCalculatorInfo?.factorSaction[section]
        if !isSpouseSection {
            if section == 0 {
                var totalrows = subSection?.value.count ?? 0
                totalrows += 1 //section header
                return totalrows
            } else {
                var totalrows = subSection?.value.count ?? 0
                totalrows += 1 //section header
                totalrows += 1 //for save button
                return totalrows
            }
        } else {
            var totalrows = subSection?.value.count ?? 0
                totalrows += 1 //section header
                totalrows += 1 //for save button
                return totalrows
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: EducationHeaderTableViewCell.cellIdentifier, for: indexPath) as? EducationHeaderTableViewCell {
                cell.configureCell(headerTitle: educationCalculatorInfo?.factorSaction[indexPath.section].title ?? "")
                return cell
            }
            return UITableViewCell()

        } else {
            let subSection = educationCalculatorInfo?.factorSaction[indexPath.section]
            
            if (subSection?.value.count ?? 0) + 1 == indexPath.row {
                if let cell = tableView.dequeueReusableCell(withIdentifier: SaveButtonTableViewCell.cellIdentifier, for: indexPath) as? SaveButtonTableViewCell {
                    cell.configureSaveButtonCell(buttonTitle: "Add Education")
                    cell.delegate = self
                    cell.selectionStyle = .none
                    return cell
                }
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableViewCell.cellIdentifier, for: indexPath) as? EducationTableViewCell {
                    cell.configureCell(educationDict: subSection?.value[indexPath.row-1], defaultSelected: indexPath.section == 0 ? selectedScoreInsideCanada : selectedScoreOutsideCanada)
                    cell.selectionStyle = .none
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}

extension EducationViewController: SaveButtonCellDelegate {
    func didClickOnSaveButton() {
        educationCalculatorInfo?.resetAll()
        selectedScoreOutsideCanada?.isSelected = true
        selectedScoreInsideCanada?.isSelected = true
        setScore()
        educationCalculatorInfo?.factorValue = sectionValueLabel.text ?? "0"
        
        if marriedCRSCalculatorInfo != nil {
            Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: marriedCRSCalculatorInfo,educationCalculatorInfo: educationCalculatorInfo)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension String {
    //Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
}
