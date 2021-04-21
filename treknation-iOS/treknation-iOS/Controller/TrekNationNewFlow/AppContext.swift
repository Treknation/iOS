//
//  AppContext.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 1/9/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class AppContext: NSObject {
    
    static let sharedAppContext = AppContext()
    
    private override init(){
        appData = Utility.createAppData()
        commonMistakesData = Utility.createCommonMistakesData()
    }
    
    var isFirstTimeUser: Bool {
        return (getIndexOfPreviousStep() == nil) ? true : false
    }
    
    var appData: [AppData] = []
    var commonMistakesData: [CommonMistakeData] = []

    var userName = ""
    var email = ""
    
    var primarySingleLanguageCLBLevel:Int = 0
    var primaryMarriedLanguageCLBLevel:Int = 0
        
    var experienceScoreSingle:Int = 0
    var experienceScoreMarried:Int = 0
    
    var maxValueForASectionSingle: Int = 0
    var maxValueForASectionSingleAge: Int = 0
    var maxValueForASectionSingleEducation: Int = 0
    var maxValueForASectionSingleLanguages: Int = 0
    var maxValueForASectionSingleCanadianWorkEx: Int = 0
    
    var maxValueForASectionMarried: Int = 0
    var maxValueForASectionMarriedAge: Int = 0
    var maxValueForASectionMarriedEducation: Int = 0
    var maxValueForASectionMarriedLanguage: Int = 0
    var maxValueForASectionMarriedCanadianWorkEx: Int = 0
    
    var maxValueForBSection: Int = 0
    var maxValueForBSectionEducation: Int = 0
    var maxValueForBSectionLanguage: Int = 0
    var maxValueForBSectionCanadianWorkEx: Int = 0
    
    var maxValueForCSection: Int = 0
    var maxValueForCSectionEducationSingle: Int = 0
    var maxValueForCSectionEducationMarried: Int = 0
        var langEducationScoreSingle: Int = 0
        var langEducationScoreMarried: Int = 0
        var eduExperienceScoreSingle: Int = 0
        var eduExperienceScoreMarried: Int = 0
    var langForeignExperienceScoreSingle: Int = 0
    var langForeignExperienceScoreMarried: Int = 0
    var canadianForeignExperienceScoreSingle: Int = 0
    var canadianForeignExperienceScoreMarried: Int = 0
    var experienceCertificateSingle: Int = 0
    var experienceCertificateMarried: Int = 0
    
    var maxValueForDSectionSingle: Int = 0
    var maxValueForDSectionPNPSingle: Int = 0
    var maxValueForDSectionBrother_sisterSingle: Int = 0
    var maxValueForDSectionLMIASingle: Int = 0
    var maxValueForDSectionCanadian_educationSingle: Int = 0
    
    var maxValueForDSectionMarried: Int = 0
    var maxValueForDSectionPNPMarried: Int = 0
    var maxValueForDSectionBrother_sisterMarried: Int = 0
    var maxValueForDSectionLMIAMarried: Int = 0
    var maxValueForDSectionCanadian_educationMarried: Int = 0
    
    // To Do
    var maxValueForDSectionFrench_Language_additional_pointsSingle: Int = 0
    var maxValueForDSectionFrench_Language_additional_pointsMarried: Int = 0

    var singleArray = [TNCRSCalculatorInfo]()
    var marriedArray = [TNCRSCalculatorInfo]()

    var yesCheckboxSelected: Bool = false
    
    func getIndexOfPreviousStep() -> Int? {
        if let index = appData.lastIndex(where: { $0.isComplete == true }) {
            return index
        }
        return nil
    }
    
    func previousCompletedStep() -> AppData? {
        if let index = getIndexOfPreviousStep() {
            return appData[index]
        }
        return nil
    }
    
    func inProgressStep() -> AppData? {
        if let index = getIndexOfInProgressStep(), index < appData.count {
            return appData[index]
        }
        return nil
    }
    
    func saveInfoToUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(userName, forKey: "name")
        userDefaults.set(email, forKey: "email")
    }
    
    func saveInfoToUserCanadaDefaults(value:String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: "canada")
    }
    
    func nextStep() -> AppData? {
        if let index = getIndexOfInProgressStep(), (index + 1) < appData.count {
            return appData[index + 1]
        }
        return nil
    }
    
    func getIndexOfInProgressStep() -> Int? {
        guard let index = getIndexOfPreviousStep() else { return 0 }
        return index + 1
    }
    
    func getIndexOf(appDataObj: AppData) -> Int? {
        return appData.firstIndex(where: { $0.title == appDataObj.title })
    }
    
    func canCompleteCurrentStep(appData: AppData, vc: UIViewController) -> Bool {
        guard let currentStepIndex = AppContext.sharedAppContext.getIndexOfInProgressStep(), let appDataIndex = AppContext.sharedAppContext.getIndexOf(appDataObj: appData) else { return true}
        
        if currentStepIndex < appDataIndex {
            let message = "Please complete the \"\(AppContext.sharedAppContext.inProgressStep()?.title ?? "")\" step first."
            let alert = UIAlertController(title: "TrekNation", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
                vc.navigationController?.popViewController(animated: true)
            }))
            vc.present(alert, animated: true)
            return false
        }
        return true
    }
    
    func getViewControllerForStep(atIndex: Int) -> UIViewController? {
        switch atIndex {
        case 0:
            let vc = OverviewViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc
            
        case 1:
            let vc = NOCViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc
            
        case 2:
            let vc = ECAViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc
            
        case 3:
            let vc = LanguageTestViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 4:
            let vc = EligibilityViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 5:
            let vc = CRSScoreViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 6:
            let vc = EnterEEViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 7:
            let vc = ITAViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 8:
            let vc = DocumentChecklistViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 9:
            let vc = EPRViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 10:
            let vc = PPRViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        case 11:
            let vc = PrepareforLandingViewController()
            vc.setAppData(data: AppContext.sharedAppContext.appData[atIndex])
            return vc

        default: break
        }
        return nil
    }
    
    func getCRSScoreForPrimaryLanguageSingle(clbLevel:Int) -> Int {
        var crsScore = 0
        
        switch clbLevel {
        case 0...3:
            crsScore = 0
        case 4...5:
            crsScore = 6
        case 6:
            crsScore = 9
        case 7:
            crsScore = 17
        case 8:
            crsScore = 23
        case 9:
            crsScore = 31
        case 10:
            crsScore = 34
        default:
            crsScore = 34
        }
        return crsScore
    }
    
    func getCRSScoreForPrimaryLanguageMarried(clbLevel:Int) -> Int {
        
        var crsScore = 0
        
        switch clbLevel {
        case 0...3:
            crsScore = 0
        case 4...5:
            crsScore = 6
        case 6:
            crsScore = 8
        case 7:
            crsScore = 16
        case 8:
            crsScore = 22
        case 9:
            crsScore = 29
        case 10:
            crsScore = 32
        default:
            crsScore = 32
        }
        return crsScore
    }
    
    func getCRSScoreForPrimaryLanguageSpouse(clbLevel:Int) -> Int {
        
        var crsScore = 0
        
        
        switch clbLevel {
        case 0,1,2,3,4:
            crsScore = 0
        case 5,6:
            crsScore = 1
        case 7,8:
            crsScore = 3
        case 9,10:
            crsScore = 5
        default:
            crsScore = 5
        }
        return crsScore
    }
    
    func getCRSScoreForSecondaryLanguageSingle(clbLevel:Int) -> Int {
        var crsScore = 0
        
        switch clbLevel {
        case 0...4:
            crsScore = 0
        case 5...6:
            crsScore = 1
        case 7...8:
            crsScore = 3
        case 9:
            crsScore = 6
        default:
            crsScore = 6
        }
        return crsScore
    }
    
    func getCRSScoreForSecondaryLanguageMarried(clbLevel:Int) -> Int {
        var crsScore = 0
        
        switch clbLevel {
        case 0...4:
            crsScore = 0
        case 5...6:
            crsScore = 1
        case 7...8:
            crsScore = 3
        case 9:
            crsScore = 6
        default:
            crsScore = 6
        }
        return crsScore
    }
}

class Utility: NSObject {
    
    class func isDebugModeEnabled() -> Bool {
        return false
    }
    
    class func completeStageWithSteps(stepsComplete:Int) {
        
        for item in 0...stepsComplete {
            let appDataItems = AppContext.sharedAppContext.appData[item]
            appDataItems.isComplete = true
        }
    }
    
    class func createCommonMistakesData() -> [CommonMistakeData] {
        
        var temp:[CommonMistakeData] = []
        let mistake1 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle1, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails1)
        
        let mistake2 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle2, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails2)
        
        let mistake3 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle3, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails3)
        
        let mistake4 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle4, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails4)
        
        let mistake5 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle5, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails5)
        
        let mistake6 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle6, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails6)

        let mistake7 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle7, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails7)

        let mistake8 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle8, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails8)

        let mistake9 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle9, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails9)

        let mistake10 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle10, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails10)

        let mistake11 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle11, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails11)

        let mistake12 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle12, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails12)

        let mistake13 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle13, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails13)

        let mistake14 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle14, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails14)

        let mistake15 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle15, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails15)

        let mistake16 = CommonMistakeData.init(title:Constant.AppDetailsConstants.commonMistakesTitle16, detailedDescription: Constant.AppDetailsConstants.commonMistakesDetails16)


        temp.append(mistake1)
        temp.append(mistake2)
        temp.append(mistake3)
        temp.append(mistake4)
        temp.append(mistake5)
        temp.append(mistake6)
        temp.append(mistake7)
        temp.append(mistake8)
        temp.append(mistake9)
        temp.append(mistake10)
        temp.append(mistake11)
        temp.append(mistake12)
        temp.append(mistake13)
        temp.append(mistake14)
        temp.append(mistake15)
        temp.append(mistake16)
        
        return temp
    }
    
    class func createAppData() -> [AppData] {
        
        var temp:[AppData] = []
        let overview = AppData.init(title:Constant.AppDetailsConstants.overviewTitle, onCompletionTitle: Constant.AppDetailsConstants.overviewTitle, overview: Constant.AppDetailsConstants.overviewDetails, longDesc: Constant.AppDetailsConstants.overviewDetailsDesc)
        
        let noc = AppData.init(title:Constant.AppDetailsConstants.fyNOCTitle, onCompletionTitle: Constant.AppDetailsConstants.fyNOCCompletionTitle, overview: Constant.AppDetailsConstants.fyNOCDetails, longDesc: Constant.AppDetailsConstants.fyNOCDetailsDesc)
        
        let eca = AppData.init(title: Constant.AppDetailsConstants.getECATitle, onCompletionTitle: Constant.AppDetailsConstants.getECACompletionTitle, overview: Constant.AppDetailsConstants.getECADetails, longDesc: Constant.AppDetailsConstants.getECADetailsDesc)
        
        let languageTests = AppData.init(title: Constant.AppDetailsConstants.languageTestTitle, onCompletionTitle: Constant.AppDetailsConstants.languageTestCompletionTitle, overview: Constant.AppDetailsConstants.languageTestDetails, longDesc: Constant.AppDetailsConstants.languageTestDetailsDesc)
        
        let checkEligibility = AppData.init(title:Constant.AppDetailsConstants.checkEligibilityTitle, onCompletionTitle: Constant.AppDetailsConstants.checkEligibilityCompletionTitle, overview: Constant.AppDetailsConstants.checkEligibilityDetails, longDesc: Constant.AppDetailsConstants.checkEligibilityDetailsDesc)
        
        let calculateCRS = AppData.init(title:Constant.AppDetailsConstants.checkCRSTitle, onCompletionTitle: Constant.AppDetailsConstants.checkCRSCompletionTitle, overview: Constant.AppDetailsConstants.checkCRSDetails, longDesc: Constant.AppDetailsConstants.checkCRSDetailsDesc)
        
        
        let enterEEPool = AppData.init(title:Constant.AppDetailsConstants.enterEETitle, onCompletionTitle: Constant.AppDetailsConstants.enterEECompletionTitle, overview: Constant.AppDetailsConstants.enterEEDetails, longDesc: Constant.AppDetailsConstants.enterEEDetailsDesc)
        
        let getITA = AppData.init(title:Constant.AppDetailsConstants.getITATitle, onCompletionTitle: Constant.AppDetailsConstants.getITACompletionTitle, overview: Constant.AppDetailsConstants.getITADetails, longDesc: Constant.AppDetailsConstants.getITADetailsDesc)
    
        let documentChecklist = AppData.init(title:Constant.AppDetailsConstants.documentChecklistTitle, onCompletionTitle: Constant.AppDetailsConstants.documentChecklistCompletionTitle, overview: Constant.AppDetailsConstants.documentChecklistDetails, longDesc: Constant.AppDetailsConstants.documentChecklistDetailsDesc)
        
        let applicationFees = AppData.init(title:Constant.AppDetailsConstants.applicationFeesTitle, onCompletionTitle: Constant.AppDetailsConstants.applicationFeesCompletionTitle, overview: Constant.AppDetailsConstants.applicationFeesDetails, longDesc: Constant.AppDetailsConstants.applicationFeesDetailsDesc)
        
        let aorToPPR = AppData.init(title:Constant.AppDetailsConstants.aorToPPRTitle, onCompletionTitle: Constant.AppDetailsConstants.aorToPPRCompletionTitle, overview: Constant.AppDetailsConstants.aorToPPRDetails, longDesc: Constant.AppDetailsConstants.aorToPPRDetailsDesc)

        let landingPreparation = AppData.init(title:Constant.AppDetailsConstants.landingPreparationTitle, onCompletionTitle: Constant.AppDetailsConstants.landingPreparationCompletionTitle, overview: Constant.AppDetailsConstants.landingPreparationDetails, longDesc: Constant.AppDetailsConstants.landingPreparationDetailsDesc)
        
        temp.append(overview)
        temp.append(noc)
        temp.append(eca)
        temp.append(languageTests)
        temp.append(checkEligibility)
        temp.append(calculateCRS)
        temp.append(enterEEPool)
        temp.append(getITA)
        temp.append(documentChecklist)
        temp.append(applicationFees)
        temp.append(aorToPPR)
        temp.append(landingPreparation)

        return temp
    }
    
    class func getAllCRSCalculatorDataForSingle() -> [TNCRSCalculatorInfo] {
        guard let path = Bundle.main.path(forResource: "CRSCalculator_single", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path), let dataArray = dict.object(forKey: "CRS Calculator") as? [NSDictionary] else {
            return [TNCRSCalculatorInfo]()
        }
        
        var allCRSDataArray = [TNCRSCalculatorInfo]()
        
        for crsDict in dataArray {
            let CRSCalculatorInfo = TNCRSCalculatorInfo(factorTitle: crsDict.object(forKey: "factorTitle") as? String ?? "")
            var factorSactionArray = [ItemDetails]()
            if let factorSaction = crsDict.object(forKey: "factorSactions") as? [NSDictionary] {
                for factorSactionDict in factorSaction {
                    var itemDetails = ItemDetails(title: factorSactionDict.object(forKey: "title") as? String ?? "")
                    
                    var scoreDetailsArray = [ScoreDetails]()
                    if let value = factorSactionDict.object(forKey: "value") as? [NSDictionary] {
                        for valueDict in value {
                            let scoreDetails = ScoreDetails(title: valueDict.object(forKey: "title") as? String ?? "", score: valueDict.object(forKey: "score") as? String ?? "")
                            scoreDetailsArray.append(scoreDetails)
                            
                        }
                    }
                    
                    itemDetails.value = scoreDetailsArray
                    
                    factorSactionArray.append(itemDetails)
                    
                }
            }
            CRSCalculatorInfo.factorSaction = factorSactionArray
            
            allCRSDataArray.append(CRSCalculatorInfo)
        }
        
        return allCRSDataArray
    }
    
    class func getAllCRSCalculatorDataForMarried() -> [TNCRSCalculatorInfo] {
        guard let path = Bundle.main.path(forResource: "CRSCalculator_married", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path), let dataArray = dict.object(forKey: "CRS Calculator") as? [NSDictionary] else {
            return [TNCRSCalculatorInfo]()
        }
        
        var allCRSDataArray = [TNCRSCalculatorInfo]()
        
        for crsDict in dataArray {
            let CRSCalculatorInfo = TNCRSCalculatorInfo(factorTitle: crsDict.object(forKey: "factorTitle") as? String ?? "")
            var factorSactionArray = [ItemDetails]()
            if let factorSaction = crsDict.object(forKey: "factorSactions") as? [NSDictionary] {
                for factorSactionDict in factorSaction {
                    var itemDetails = ItemDetails(title: factorSactionDict.object(forKey: "title") as? String ?? "")
                    
                    var scoreDetailsArray = [ScoreDetails]()
                    if let value = factorSactionDict.object(forKey: "value") as? [NSDictionary] {
                        for valueDict in value {
                            let scoreDetails = ScoreDetails(title: valueDict.object(forKey: "title") as? String ?? "", score: valueDict.object(forKey: "score") as? String ?? "")
                            scoreDetailsArray.append(scoreDetails)
                            
                        }
                    }
                    itemDetails.value = scoreDetailsArray
                    factorSactionArray.append(itemDetails)
                }
            }
            CRSCalculatorInfo.factorSaction = factorSactionArray
            
            allCRSDataArray.append(CRSCalculatorInfo)
        }
        
        return allCRSDataArray
    }
    
    class func getFrenchLangScore(isSingle: Bool) -> Int {
        let langInfo = isSingle ? AppContext.sharedAppContext.singleArray[2] : AppContext.sharedAppContext.marriedArray[2]
        if langInfo.languageInfoData.primaryLanguage == "TEF Canada" || langInfo.languageInfoData.primaryLanguage == "TCF Canada" {
            var scoreArray = [Int]()
            if langInfo.languageInfoData.primaryLanguage == "TCF Canada" {
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Speaking(value: Int(langInfo.languageInfoData.primaryspeakingSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Listening(value: Int(langInfo.languageInfoData.primarylisteningSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Reading(value: Int(langInfo.languageInfoData.primaryreadingSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TCF_Canada_Writing(value: Int(langInfo.languageInfoData.primarywritingSliderValue)))
            } else {
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Speaking(value: Int(langInfo.languageInfoData.primaryspeakingSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Listening(value: Int(langInfo.languageInfoData.primarylisteningSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Reading(value: Int(langInfo.languageInfoData.primaryreadingSliderValue)))
                scoreArray.append(Utility.getCLBLevel_TEF_Canada_Writing(value: Int(langInfo.languageInfoData.primarywritingSliderValue)))
            }
            if scoreArray.contains(where: { $0 < 7 }) {
                return 0
            } else {
                var englishScoreArray = [Int]()
                if langInfo.languageInfoData.secondaryLanguage == "IELTS" {
                    
                    englishScoreArray.append(Utility.getCLBLevel_IELTS_Speaking(value: Float(langInfo.languageInfoData.secondaryspeakingSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_IELTS_Listening(value: Float(langInfo.languageInfoData.secondarylisteningSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_IELTS_Reading(value: Float(langInfo.languageInfoData.secondaryreadingSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_IELTS_Writing(value: Float(langInfo.languageInfoData.secondarywritingSliderValue)))
                } else { //CELPIP
                    englishScoreArray.append(Utility.getCLBLevel_CELPIP_Speaking(value: Int(langInfo.languageInfoData.secondaryspeakingSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_CELPIP_Listening(value: Int(langInfo.languageInfoData.secondarylisteningSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_CELPIP_Reading(value: Int(langInfo.languageInfoData.secondaryreadingSliderValue)))
                    englishScoreArray.append(Utility.getCLBLevel_CELPIP_Writing(value: Int(langInfo.languageInfoData.secondarywritingSliderValue)))
                }
                if englishScoreArray.contains(where: { $0 <= 4 }) {
                    return 25
                } else if !englishScoreArray.contains(where: { $0 < 5 }) { //all are greater than or equal to 5
                    return 50
                }
            }
        }
        return 0
    }
    
    class func getCertificateScore(clbValue:Int) -> Int {
        if clbValue > 5 && clbValue < 7 {
            return 25
        } else if clbValue > 7 {
            return 50
        }
        return 0
    }
    
    class func getValueBasedOnCLBLevelInsideCanada(section:Int, clbValue:Int) -> Int {
        
        if clbValue < 7 {
            return 0
        }
        
        switch section {
        case 5...10:
            return clbValue >= 9 ? 50 : 25
        case 2...4:
            return clbValue >= 9 ? 25 : 13
        default:
            return 0
        }
    }
    
    class func getValueBasedOnCLBLevelCanadianExperience(section:Int, clbValue:Int) -> Int {

        if clbValue < 7 {
            return 0
        }

        switch section {
        case 3:
            return clbValue >= 9 ? 50 : 25
        case 2:
            return clbValue >= 9 ? 25 : 13
        default:
            return 0
        }
    }
    
    class func getValueBasedOnCLBLevelCanadianExperienceForForeignExperience(section:Int, clbValue:Float) -> Int {

        switch section {
        case 3:
            return clbValue >= 2 ? 50 : 25
        case 2:
            return clbValue >= 2 ? 25 : 13
        default:
            return 0
        }
    }
    
    class func getValueBasedOnCanadianExperienceForEducation(section:Int, experience:Int) -> Int {

        if experience < 1 {
            return 0
        }

        switch section {
        case 5...10:
            return experience >= 2 ? 50 : 25
        case 2...4:
            return experience >= 2 ? 25 : 13
        default:
            return 0
        }
    }
    
    class func setScoreForEducation(isSingle:Bool) {
        var selectedScoreInsideCanada:ScoreDetails?
        var selectedScoreOutsideCanada:ScoreDetails?
        
        if isSingle {
            let educationInfo = AppContext.sharedAppContext.singleArray[1]
            
            if educationInfo.factorSaction[0].value.contains(where: { $0.isSelected == true }) || educationInfo.factorSaction[1].value.contains(where: { $0.isSelected == true }) {
                
                let clbValue = !isSingle ? AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel : AppContext.sharedAppContext.primarySingleLanguageCLBLevel

                let subSection = AppContext.sharedAppContext.singleArray[1].factorSaction[0]
                if let index = subSection.value.firstIndex(where: { $0.isSelected == true }) {
                    selectedScoreInsideCanada = subSection.value[index]
                    AppContext.sharedAppContext.langEducationScoreSingle = Utility.getValueBasedOnCLBLevelInsideCanada(section: index, clbValue: clbValue)
                    
                    if isSingle {
                        AppContext.sharedAppContext.eduExperienceScoreSingle = Utility.getValueBasedOnCanadianExperienceForEducation(section: index, experience: AppContext.sharedAppContext.experienceScoreSingle)
                    } else {
                        AppContext.sharedAppContext.eduExperienceScoreMarried = Utility.getValueBasedOnCanadianExperienceForEducation(section: index, experience: AppContext.sharedAppContext.experienceScoreMarried)
                    }
                }
                
                //Outside Canada
                let subSectionOutside = AppContext.sharedAppContext.singleArray[1].factorSaction[1]
                if let index = subSectionOutside.value.firstIndex(where: { $0.isSelected == true }) {
                    selectedScoreOutsideCanada = subSectionOutside.value[index]
                }
                
                let totalValue = (selectedScoreInsideCanada?.score.toInt() ?? 0) + (selectedScoreOutsideCanada?.score.toInt() ?? 0)
                
                educationInfo.factorValue = "\(totalValue)"
                
                Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: AppContext.sharedAppContext.marriedArray[1],educationCalculatorInfo: educationInfo)
            }
        } else {
           Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: AppContext.sharedAppContext.marriedArray[1],educationCalculatorInfo: AppContext.sharedAppContext.marriedArray[1])
       }

    }
    
    class func updateMarriedCRSInfo(marriedCRSCalculatorInfo: TNCRSCalculatorInfo?, educationCalculatorInfo: TNCRSCalculatorInfo?) {
        let clbValue = AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel
        
        if marriedCRSCalculatorInfo != nil {
            var scoreTotal: Int = 0
            if let index = educationCalculatorInfo!.factorSaction[0].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[0].value[index].isSelected = true
                scoreTotal = (marriedCRSCalculatorInfo?.factorSaction[0].value[index].score.toInt()) ?? 0
                AppContext.sharedAppContext.maxValueForASectionMarriedEducation = scoreTotal

                AppContext.sharedAppContext.langEducationScoreMarried = Utility.getValueBasedOnCLBLevelInsideCanada(section: index, clbValue: clbValue)
                
                AppContext.sharedAppContext.eduExperienceScoreMarried = Utility.getValueBasedOnCanadianExperienceForEducation(section: index, experience: AppContext.sharedAppContext.experienceScoreMarried)
            }
            if let index = educationCalculatorInfo!.factorSaction[1].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[1].value[index].isSelected = true
                scoreTotal += (marriedCRSCalculatorInfo?.factorSaction[1].value[index].score.toInt()) ?? 0
            }
            marriedCRSCalculatorInfo?.factorValue = scoreTotal > 0 ? "\(scoreTotal)" : "0"
        }
    }
    
    class func setScoreForExperience(isSingle: Bool, experienceInfo:TNCRSCalculatorInfo) {
        
        let value = Utility.presetData(isSingle: isSingle)
        
        if isSingle {
            if experienceInfo.factorSaction[0].value.contains(where: { $0.isSelected == true }) || experienceInfo.factorSaction[1].value.contains(where: { $0.isSelected == true }) || experienceInfo.factorSaction[2].value.contains(where: { $0.isSelected == true }) {
            
                let clbValue = !isSingle ? AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel : AppContext.sharedAppContext.primarySingleLanguageCLBLevel
                
                var totalValue:Int = 0
                var additonalPointsValueForForeignExperience:Int = 0
                var selectedCanadianExperience:ScoreDetails?
                var selectedForeignExperience:ScoreDetails?

                let scoreDetail = experienceInfo.factorSaction[0]
                    switch value.0 {
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

                let scoreDetail2 = experienceInfo.factorSaction[1]
                    switch value.1 {
                    case 0..<1:
                       let scoreDetail = scoreDetail2.value[0]
                       if isSingle {
                            AppContext.sharedAppContext.langForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: clbValue)
                       } else {
                        AppContext.sharedAppContext.langForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 0, clbValue: clbValue)
                       }
                       totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                       selectedForeignExperience = scoreDetail
                    case 1..<3:
                        let scoreDetail = scoreDetail2.value[1]
                       if isSingle {
                            AppContext.sharedAppContext.langForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: clbValue)
                       } else {
                            AppContext.sharedAppContext.langForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: clbValue)
                        }
                        totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                        selectedForeignExperience = scoreDetail
                    case 3...5:
                        let scoreDetail = scoreDetail2.value[2]
                        if isSingle {
                            AppContext.sharedAppContext.langForeignExperienceScoreSingle = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: clbValue) + additonalPointsValueForForeignExperience
                        } else {
                            AppContext.sharedAppContext.langForeignExperienceScoreMarried = Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: clbValue) + additonalPointsValueForForeignExperience
                        }
                        totalValue = totalValue + (scoreDetail.score.toInt() ?? 0)
                        selectedForeignExperience = scoreDetail
                    default:
                        break
                    }
                
//                if AppContext.sharedAppContext.yesCheckboxSelected == true {
//                    if isSingle {
//                        AppContext.sharedAppContext.langForeignExperienceScoreSingle += Utility.getCertificateScore(clbValue: clbValue)
//                    } else {
//                        AppContext.sharedAppContext.langForeignExperienceScoreMarried += Utility.getCertificateScore(clbValue: clbValue)
//                    }
//                }
                
                experienceInfo.factorValue = "\(totalValue)"
                
                Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: AppContext.sharedAppContext.marriedArray[3], educationCalculatorInfo: experienceInfo, score: "\(value.0)", isSingle: true)
            }
        } else {
            Utility.updateMarriedCRSInfo(marriedCRSCalculatorInfo: AppContext.sharedAppContext.marriedArray[3], educationCalculatorInfo: AppContext.sharedAppContext.marriedArray[3], score: "\(value.0)", isSingle: false)
        }
        
    }
    
    class func updateMarriedCRSInfo(marriedCRSCalculatorInfo:TNCRSCalculatorInfo?, educationCalculatorInfo:TNCRSCalculatorInfo?, score: String, isSingle: Bool) {
        
        let clbValue = AppContext.sharedAppContext.primaryMarriedLanguageCLBLevel
        
        if marriedCRSCalculatorInfo != nil {
            var additonalPointsValueForForeignExperience:Int = 0
            
            if let index = educationCalculatorInfo!.factorSaction[0].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[0].value[index].isSelected = true
                    if !isSingle { //married section experience score
                        switch score {
                        case "56", "63":
                            additonalPointsValueForForeignExperience = 12
                        case "70":
                            additonalPointsValueForForeignExperience = 25
                        default:
                            break;
                        }
                    } else { //single experience score
                        switch score {
                        case "64", "72":
                            additonalPointsValueForForeignExperience = 12
                        case "80":
                            additonalPointsValueForForeignExperience = 25
                        default:
                            break;
                        }
                    }
//                }
                AppContext.sharedAppContext.maxValueForASectionMarriedCanadianWorkEx = (marriedCRSCalculatorInfo?.factorSaction[0].value[index].score.toInt()) ?? 0
            }
            
            if let index = educationCalculatorInfo!.factorSaction[1].value.firstIndex(where: {$0.isSelected == true }) {
                marriedCRSCalculatorInfo?.factorSaction[1].value[index].isSelected = true
                
                switch marriedCRSCalculatorInfo?.factorSaction[1].value[index].score {
                case "13":
                    AppContext.sharedAppContext.langForeignExperienceScoreMarried = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 2, clbValue: clbValue)
                case "25":
                    AppContext.sharedAppContext.langForeignExperienceScoreMarried = additonalPointsValueForForeignExperience + Utility.getValueBasedOnCLBLevelCanadianExperience(section: 3, clbValue: clbValue)
                default:
                    break
                }
            }
            AppContext.sharedAppContext.experienceScoreMarried = marriedCRSCalculatorInfo?.factorValue.toInt() ?? 0
        }
    }
    
    class func presetData(isSingle: Bool) -> (Float, Float) {
        
        var canadianExperienceSlider:Float = 0.0
        var foreignExperienceSlider:Float = 0.0
        
        var subSection: ItemDetails? = nil
        if isSingle {
           subSection = AppContext.sharedAppContext.singleArray[3].factorSaction[0]
        } else {
            subSection = AppContext.sharedAppContext.marriedArray[3].factorSaction[0]
        }
        if let index = subSection?.value.firstIndex(where: { $0.isSelected == true }) {
            let selectedCanadianExperience = subSection?.value[index]
            if !isSingle { //married section experience score
                switch selectedCanadianExperience?.score {
                case "0":
                    canadianExperienceSlider = 0.9
                case "35":
                    canadianExperienceSlider = 1
                case "46":
                    canadianExperienceSlider = 2
                case "56":
                    canadianExperienceSlider = 3
                case "63":
                    canadianExperienceSlider = 4
                case "70":
                    canadianExperienceSlider = 5
                default:
                    canadianExperienceSlider = 1.1
                }
            } else { //single experience score
                switch selectedCanadianExperience?.score {
                case "0":
                    canadianExperienceSlider = 0.9
                case "40":
                    canadianExperienceSlider = 1
                case "53":
                    canadianExperienceSlider = 2
                case "64":
                    canadianExperienceSlider = 3
                case "72":
                    canadianExperienceSlider = 4
                case "80":
                    canadianExperienceSlider = 5
                default:
                    canadianExperienceSlider = 1.1
                }
            }
        }
        var subSectionOutside: ItemDetails? = nil
        if isSingle {
            subSectionOutside = AppContext.sharedAppContext.singleArray[3].factorSaction[1]
        } else {
            subSectionOutside = AppContext.sharedAppContext.marriedArray[3].factorSaction[1]
        }
        if let index = subSectionOutside?.value.firstIndex(where: { $0.isSelected == true }) {
            let selectedForeignExperience = subSectionOutside?.value[index]
            
            switch selectedForeignExperience?.score {
            case "0":
                foreignExperienceSlider = 0
            case "13":
                foreignExperienceSlider = 2
            case "25":
                foreignExperienceSlider = 3
            default:
                foreignExperienceSlider = 0
            }
        }
        
        return (canadianExperienceSlider, foreignExperienceSlider)
    }
    
    class func getCLBLevel_CELPIP_Reading(value:Int) -> Int {
        
        switch value {
        case 10...20:
            return 10
        case 9:
            return 9
        case 8:
            return 8
        case 7:
            return 7
        case 6:
            return 6
        case 5:
            return 5
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_CELPIP_Writing(value:Int) -> Int {
        
        switch value {
        case 10...20:
            return 10
        case 9:
            return 9
        case 8:
            return 8
        case 7:
            return 7
        case 6:
            return 6
        case 5:
            return 5
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_CELPIP_Listening(value:Int) -> Int {
        
        switch value {
        case 10...20:
            return 10
        case 9:
            return 9
        case 8:
            return 8
        case 7:
            return 7
        case 6:
            return 6
        case 5:
            return 5
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_CELPIP_Speaking(value:Int) -> Int {
        
        switch value {
        case 10...20:
            return 10
        case 9:
            return 9
        case 8:
            return 8
        case 7:
            return 7
        case 6:
            return 6
        case 5:
            return 5
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_IELTS_Reading(value:Float) -> Int {
        
        switch value {
        case 8.0...20.0:
            return 10
        case 7.0..<7.9:
            return 9
        case 6.5:
            return 8
        case 6.0:
            return 7
        case 5.0..<5.9:
            return 6
        case 4.0..<4.9:
            return 5
        case 3.5:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_IELTS_Writing(value:Float) -> Int {
        
        switch value {
        case 7.5...20.0:
            return 10
        case 7.0:
            return 9
        case 6.5:
            return 8
        case 6.0:
            return 7
        case 5.5:
            return 6
        case 5.0:
            return 5
        case 4.0..<4.9:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_IELTS_Listening(value:Float) -> Int {
        
        switch value {
        case 8.5...20.0:
            return 10
        case 8.0:
            return 9
        case 7.5:
            return 8
        case 6.0..<7.4:
            return 7
        case 5.5:
            return 6
        case 5.0:
            return 5
        case 4.5:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_IELTS_Speaking(value:Float) -> Int {
        
        switch value {
        case 7.5...20.0:
            return 10
        case 7.0:
            return 9
        case 6.5:
            return 8
        case 6.0:
            return 7
        case 5.5:
            return 6
        case 5.0:
            return 5
        case 4.0..<4.9:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TEF_Canada_Reading(value:Int) -> Int {
        
        switch value {
        case 263..<451:
            return 10
        case 248..<263:
            return 9
        case 233..<248:
            return 8
        case 207..<233:
            return 7
        case 181..<207:
            return 6
        case 151..<181:
            return 5
        case 121..<151:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TEF_Canada_Writing(value:Int) -> Int {
        
        switch value {
        case 393..<451:
            return 10
        case 371..<393:
            return 9
        case 349..<371:
            return 8
        case 310..<349:
            return 7
        case 271..<310:
            return 6
        case 226..<271:
            return 5
        case 181..<226:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TEF_Canada_Listening(value:Int) -> Int {
        
        switch value {
        case 316..<451:
            return 10
        case 298..<316:
            return 9
        case 280..<298:
            return 8
        case 249..<280:
            return 7
        case 217..<249:
            return 6
        case 181..<217:
            return 5
        case 145..<181:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TEF_Canada_Speaking(value:Int) -> Int {
        
        switch value {
        case 393..<451:
            return 10
        case 371..<393:
            return 9
        case 349..<371:
            return 8
        case 310..<349:
            return 7
        case 271..<310:
            return 6
        case 226..<271:
            return 5
        case 181..<226:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TCF_Canada_Reading(value:Int) -> Int {
        
        switch value {
        case 549..<700:
            return 10
        case 524..<549:
            return 9
        case 499..<524:
            return 8
        case 453..<499:
            return 7
        case 406..<453:
            return 6
        case 375..<406:
            return 5
        case 342..<375:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TCF_Canada_Writing(value:Int) -> Int {
        
        switch value {
        case 16..<21:
            return 10
        case 14..<16:
            return 9
        case 12..<14:
            return 8
        case 10..<12:
            return 7
        case 7..<10:
            return 6
        case 6:
            return 5
        case 4..<6:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TCF_Canada_Listening(value:Int) -> Int {
        
        switch value {
        case 549..<700:
            return 10
        case 523..<549:
            return 9
        case 503..<523:
            return 8
        case 458..<503:
            return 7
        case 398..<458:
            return 6
        case 369..<398:
            return 5
        case 331..<369:
            return 4
        default:
            return 0
        }
    }
    
    class func getCLBLevel_TCF_Canada_Speaking(value:Int) -> Int {
        
        switch value {
        case 16..<21:
            return 10
        case 14..<16:
            return 9
        case 12..<14:
            return 8
        case 10..<12:
            return 7
        case 7..<10:
            return 6
        case 6:
            return 5
        case 4..<6:
            return 4
        default:
            return 0
        }
    }
}

class TNCRSCalculatorInfo:NSObject {
    var factorTitle = ""
    var factorValue = "0"
    var factorSaction = [ItemDetails]()
    var languageInfoData = LanguageInfoData()
    
    init(factorTitle:String) {
        self.factorTitle = factorTitle
    }
    
    func resetPrimaryLanguage() {
        languageInfoData.primaryLanguage = ""
        languageInfoData.primaryspeakingSliderValue = 0.0
        languageInfoData.primarylisteningSliderValue = 0.0
        languageInfoData.primaryreadingSliderValue = 0.0
        languageInfoData.primarywritingSliderValue = 0.0
    }
    func resetSecondaryLanguage() {
        languageInfoData.secondaryLanguage = ""
        languageInfoData.secondaryspeakingSliderValue = 0.0
        languageInfoData.secondarylisteningSliderValue = 0.0
        languageInfoData.secondaryreadingSliderValue = 0.0
        languageInfoData.secondarywritingSliderValue = 0.0
    }
    
    func resetAll() {
        resetPrimaryLanguage()
        resetSecondaryLanguage()
        factorValue = "0"
        _ = factorSaction.map({
            $0.value.map({
                $0.isSelected = false
            })
        })
    }
}

class ItemDetails: NSObject {
    var title = ""
    var value = [ScoreDetails]()
    
    init(title:String) {
        self.title = title
    }
}

class ScoreDetails: NSObject {
    var title = ""
    var score = ""
    var isSelected = false
    
    init(title:String, score:String) {
        self.title = title
        self.score = score
    }
}

class LanguageInfoData: NSObject {
    var primaryLanguage = ""
    var primaryspeakingSliderValue:Double = 0.0
    var primarylisteningSliderValue:Double = 0.0
    var primaryreadingSliderValue:Double = 0.0
    var primarywritingSliderValue:Double = 0.0
    
    var secondaryLanguage = ""
    var secondaryspeakingSliderValue:Double = 0.0
    var secondarylisteningSliderValue:Double = 0.0
    var secondaryreadingSliderValue:Double = 0.0
    var secondarywritingSliderValue:Double = 0.0
    
}


// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
