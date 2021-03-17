//
//  AdditionalPointsViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/19/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class AdditionalPointsViewController: TNBaseViewController {

    
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
    
    @IBOutlet weak var additionalPointsTableView: UITableView!
    
    var marriedCRSCalculatorInfo: TNCRSCalculatorInfo?
    var additionalPointsCalculatorInfo: TNCRSCalculatorInfo?
    var nocScore: ScoreDetails?
    var prScore: ScoreDetails?
    var nominationScore: ScoreDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        additionalPointsTableView.register(UINib(nibName: SaveButtonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: SaveButtonTableViewCell.cellIdentifier)
        additionalPointsTableView.register(UINib(nibName: EducationHeaderTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EducationHeaderTableViewCell.cellIdentifier)
        additionalPointsTableView.register(UINib(nibName: EducationTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EducationTableViewCell.cellIdentifier)
        additionalPointsTableView.reloadData()
        additionalPointsTableView.rowHeight = UITableView.automaticDimension
        additionalPointsTableView.estimatedRowHeight = 40.0
    }
    
    private func setData() {
        screenTitleLabel.text = "CALCULATE CRS SCORE"
        sectionTitleLabel.text = additionalPointsCalculatorInfo?.factorTitle ?? ""
        presetData()
        setScore()
        additionalPointsTableView.reloadData()
    }
    
    private func presetData() {
        //noc Score
        let nocSubSection = additionalPointsCalculatorInfo?.factorSaction[0]
        if let index = nocSubSection?.value.firstIndex(where: { $0.isSelected == true }) {
            nocScore = nocSubSection?.value[index]
        }

        //pr Score
        let prSubSectionOutside = additionalPointsCalculatorInfo?.factorSaction[1]
        if let index = prSubSectionOutside?.value.firstIndex(where: { $0.isSelected == true }) {
            prScore = prSubSectionOutside?.value[index]
        }
        
        //nomination Score
        let nominiSubSectionOutside = additionalPointsCalculatorInfo?.factorSaction[2]
        if let index = nominiSubSectionOutside?.value.firstIndex(where: { $0.isSelected == true }) {
            nominationScore = nominiSubSectionOutside?.value[index]
        }
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateMarriedCRSInfo() {
        if marriedCRSCalculatorInfo != nil && marriedCRSCalculatorInfo?.factorValue == "0" {
            var scoreTotal: Int = 0
            if let index = additionalPointsCalculatorInfo!.factorSaction[0].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[0].value[index].isSelected = true
                AppContext.sharedAppContext.maxValueForDSectionPNPMarried = marriedCRSCalculatorInfo?.factorSaction[0].value[index].score.toInt() ?? 0
                scoreTotal = (marriedCRSCalculatorInfo?.factorSaction[0].value[index].score.toInt())!
            }
            if let index = additionalPointsCalculatorInfo!.factorSaction[1].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[1].value[index].isSelected = true
                AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried = marriedCRSCalculatorInfo?.factorSaction[1].value[index].score.toInt() ?? 0
                scoreTotal += (marriedCRSCalculatorInfo?.factorSaction[1].value[index].score.toInt())!
            }
            if let index = additionalPointsCalculatorInfo!.factorSaction[2].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[2].value[index].isSelected = true
                AppContext.sharedAppContext.maxValueForDSectionLMIAMarried = marriedCRSCalculatorInfo?.factorSaction[2].value[index].score.toInt() ?? 0
                scoreTotal += (marriedCRSCalculatorInfo?.factorSaction[2].value[index].score.toInt())!
            }
            marriedCRSCalculatorInfo?.factorValue = scoreTotal > 0 ? "\(scoreTotal)" : "0"
        }
    }
    
    func setScore() {
        let totalValue = (nocScore?.score.toInt() ?? 0) + (prScore?.score.toInt() ?? 0) + (nominationScore?.score.toInt() ?? 0)
        sectionValueLabel.text = "\(totalValue)"
    }
}

extension AdditionalPointsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == additionalPointsCalculatorInfo?.factorSaction.count {
            return
        } else {
            let subSection = additionalPointsCalculatorInfo?.factorSaction[indexPath.section]
        
            switch indexPath.section {
            case 0:
                if subSection?.value[indexPath.row - 1].title == nocScore?.title {
                    nocScore = nil
//                    if marriedCRSCalculatorInfo != nil {
//                        AppContext.sharedAppContext.maxValueForDSectionPNPSingle = 0
//                    } else {
//                        AppContext.sharedAppContext.maxValueForDSectionPNPMarried = 0
//                    }
                } else {
                    nocScore = subSection?.value[indexPath.row - 1]
//                    if marriedCRSCalculatorInfo != nil {
//                        AppContext.sharedAppContext.maxValueForDSectionPNPSingle = nocScore?.score.toInt() ?? 0
//                    } else {
//                        AppContext.sharedAppContext.maxValueForDSectionPNPMarried = nocScore?.score.toInt() ?? 0
//                    }
                }
            case 1:
                if subSection?.value[indexPath.row - 1].title == prScore?.title {
                    prScore = nil
//                    if marriedCRSCalculatorInfo != nil {
//                        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterSingle = 0
//                    } else {
//                        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried = 0
//                    }
                } else {
                    prScore = subSection?.value[indexPath.row - 1]
//                    if marriedCRSCalculatorInfo != nil {
//                        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterSingle = prScore?.score.toInt() ?? 0
//                    } else {
//                        AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried = prScore?.score.toInt() ?? 0
//                    }
                }
            case 2:
                if subSection?.value[indexPath.row - 1].title == nominationScore?.title {
                    nominationScore = nil
                } else {
                    nominationScore = subSection?.value[indexPath.row - 1]
//                    if marriedCRSCalculatorInfo != nil {
//                        AppContext.sharedAppContext.maxValueForDSectionLMIASingle = nominationScore?.score.toInt() ?? 0
//                    } else {
//                        AppContext.sharedAppContext.maxValueForDSectionLMIAMarried = nominationScore?.score.toInt() ?? 0
//                    }
                }
            default:
                break;
            }
            setScore()
            tableView.reloadData()
        }
    }
}

extension AdditionalPointsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        (additionalPointsCalculatorInfo?.factorSaction.count ?? 0) + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == additionalPointsCalculatorInfo?.factorSaction.count {
            return 1
        } else {
            let subSection = additionalPointsCalculatorInfo?.factorSaction[section]
            return (subSection?.value.count ?? 0) + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == additionalPointsCalculatorInfo?.factorSaction.count { //add language button
            if let cell = tableView.dequeueReusableCell(withIdentifier: SaveButtonTableViewCell.cellIdentifier, for: indexPath) as? SaveButtonTableViewCell {
                cell.configureSaveButtonCell(buttonTitle: "Add Additional Points")
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        } else {
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: EducationHeaderTableViewCell.cellIdentifier, for: indexPath) as? EducationHeaderTableViewCell {
                    cell.configureCell(headerTitle: additionalPointsCalculatorInfo?.factorSaction[indexPath.section].title ?? "")
                    return cell
                }
                return UITableViewCell()
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableViewCell.cellIdentifier, for: indexPath) as? EducationTableViewCell {
                    let subSection = additionalPointsCalculatorInfo?.factorSaction[indexPath.section]
                    cell.configureCell(educationDict: subSection?.value[indexPath.row-1], defaultSelected: getDefaultObject(section: indexPath.section))
                    cell.selectionStyle = .none
                    return cell
                }
                return UITableViewCell()
            }
        }
    }
    func getDefaultObject(section: Int) -> ScoreDetails? {
        switch section {
        case 0:
            return nocScore
        case 1:
            return prScore
        default:
            return nominationScore
        }
    }
}

extension AdditionalPointsViewController: SaveButtonCellDelegate {
    func didClickOnSaveButton() {
        additionalPointsCalculatorInfo?.resetAll()
        nocScore?.isSelected = true
        prScore?.isSelected = true
        nominationScore?.isSelected = true
        if marriedCRSCalculatorInfo != nil {
            AppContext.sharedAppContext.maxValueForDSectionPNPSingle = nocScore?.score.toInt() ?? 0
            AppContext.sharedAppContext.maxValueForDSectionBrother_sisterSingle = prScore?.score.toInt() ?? 0
            AppContext.sharedAppContext.maxValueForDSectionLMIASingle = nominationScore?.score.toInt() ?? 0
        } else {
            AppContext.sharedAppContext.maxValueForDSectionPNPMarried = nocScore?.score.toInt() ?? 0
            AppContext.sharedAppContext.maxValueForDSectionBrother_sisterMarried = prScore?.score.toInt() ?? 0
            AppContext.sharedAppContext.maxValueForDSectionLMIAMarried = nominationScore?.score.toInt() ?? 0
        }
        setScore()
        additionalPointsCalculatorInfo?.factorValue = sectionValueLabel.text ?? "0"
        
        updateMarriedCRSInfo()
        
        navigationController?.popViewController(animated: true)
    }
}
