//
//  ViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-07-04.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return appData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tempAppData = appData[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppData") as! HomrTableViewCell

        cell.title.text = tempAppData.title
        cell.detailedOverview.text = tempAppData.overview
        cell.expandBtn.tag = indexPath.section
        if tempAppData.isComplete {
            cell.contentView.backgroundColor = UIColor.init(red: 20/255, green: 61/255, blue: 89/255, alpha: 1)
            cell.expandBtn.setImage(UIImage(named: "complete.png"), for: .normal)
            cell.title.textColor = UIColor.white
        }
        else{
            cell.contentView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            cell.expandBtn.addTarget(self, action: #selector(self.didExpand), for: .touchUpInside)
            cell.title.textColor = UIColor.init(red: 20/255, green: 61/255, blue: 89/255, alpha: 1)

            if tempAppData.isOpen {
                cell.expandBtn.setImage(UIImage(named: "close.png"), for: .normal)
            }else{
                cell.expandBtn.setImage(UIImage(named: "open.png"), for: .normal)
            }
        }
        return cell
    }
    
    @objc func didExpand(button: UIButton) {
        let section = button.tag
        let tempAppData = appData[section]
        if tempAppData.isOpen{
            tempAppData.isOpen = false
        } else{
            tempAppData.isOpen = true
        }
        homeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tempAppData = appData[indexPath.section]
        var height:CGFloat = CGFloat()
        if tempAppData.isOpen {
            height = UITableView.automaticDimension
        }
        else{
            height = 50
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.section {
        case 0:
            let overviewVC = OverviewViewController()
            self.navigationController?.pushViewController(overviewVC, animated: true)
            overviewVC.setAppData(data: appData[indexPath.section])
        case 1:
            let nocVC = NOCViewController()
            self.navigationController?.pushViewController(nocVC, animated: true)
            nocVC.setAppData(data: appData[indexPath.section])
        case 2:
            let ecaVC = ECAViewController()
            self.navigationController?.pushViewController(ecaVC, animated: true)
            ecaVC.setAppData(data: appData[indexPath.section])
        case 3:
            let langVC = LanguageTestViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 4:
            let langVC = EligibilityViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 5:
            let langVC = CRSScoreViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 6:
            let langVC = EnterEEViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 7:
            let langVC = ITAViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 8:
            let langVC = DocumentChecklistViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 9:
            let langVC = EPRViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 10:
            let langVC = PPRViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        case 11:
            let langVC = LanguageTestViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        default:
            print("")
        }
    }
    
    var appData: [AppData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        appData = createAppData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        homeTableView.reloadData()

    }
    
    
    func createAppData() -> [AppData]{
        var temp:[AppData] = []
        let overview = AppData.init(title:Constant.AppDetailsConstants.overviewTitle , overview: Constant.AppDetailsConstants.overviewDetails)
        let noc = AppData.init(title:Constant.AppDetailsConstants.fyNOCTitle , overview: Constant.AppDetailsConstants.fyNOCDetails)
        
        let eca = AppData.init(title: Constant.AppDetailsConstants.getECATitle , overview: Constant.AppDetailsConstants.getECADetails)
        
        let languageTests = AppData.init(title: Constant.AppDetailsConstants.languageTestTitle , overview: Constant.AppDetailsConstants.languageTestDetails)
        
        let checkEligibility = AppData.init(title:Constant.AppDetailsConstants.checkEligibilityTitle , overview: Constant.AppDetailsConstants.checkEligibilityDetails)
        
        let calculateCRS = AppData.init(title:Constant.AppDetailsConstants.checkCRSTitle , overview: Constant.AppDetailsConstants.checkCRSDetails)
        
        
        let enterEEPool = AppData.init(title:Constant.AppDetailsConstants.enterEETitle , overview: Constant.AppDetailsConstants.enterEEDetails)
        
        let getITA = AppData.init(title:Constant.AppDetailsConstants.getITATitle , overview: Constant.AppDetailsConstants.getITADetails)
    
        let documentChecklist = AppData.init(title:Constant.AppDetailsConstants.documentChecklistTitle , overview: Constant.AppDetailsConstants.documentChecklistDetails)
        
        let applicationFees = AppData.init(title:Constant.AppDetailsConstants.applicationFeesTitle , overview: Constant.AppDetailsConstants.applicationFeesDetails)
        
        let aorToPPR = AppData.init(title:Constant.AppDetailsConstants.aorToPPRTitle , overview: Constant.AppDetailsConstants.aorToPPRDetails)

        let landingPreparation = AppData.init(title:Constant.AppDetailsConstants.landingPreparationTitle , overview: Constant.AppDetailsConstants.landingPreparationDetails)
        
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
 
}


