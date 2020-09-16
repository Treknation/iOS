//
//  ViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-07-04.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var appData: [AppData] = []

    @IBOutlet weak var homeTableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return appData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let shadowView = UIView()
//        let gradient = CAGradientLayer()
//        gradient.frame.size = CGSize(width: tableView.bounds.width-20, height: 5)
//
//        let stopColor = UIColor.gray.cgColor
//        let startColor = UIColor.white.cgColor
//
//        gradient.colors = [stopColor, startColor]
//        gradient.locations = [0.0,0.8]
//
//        shadowView.layer.addSublayer(gradient)
//
//        return shadowView
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tempAppData = appData[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppData") as! HomrTableViewCell

        //cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 16, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
        cell.title.text = tempAppData.title
        cell.detailedOverview.text = tempAppData.overview
        cell.expandBtn.tag = indexPath.section
        if tempAppData.isComplete {
            cell.cellView.backgroundColor = UIColor.init(red: 20/255, green: 61/255, blue: 89/255, alpha: 1)
            cell.expandBtn.setImage(UIImage(named: "complete.png"), for: .normal)
            cell.expandBtn.isUserInteractionEnabled = false
            cell.title.textColor = UIColor.white
            cell.dividerView.isHidden = true
        }
        else{
            cell.cellView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            cell.expandBtn.addTarget(self, action: #selector(self.didExpand), for: .touchUpInside)
            cell.title.textColor = UIColor.init(red: 20/255, green: 61/255, blue: 89/255, alpha: 1)

            if tempAppData.isOpen {
                cell.expandBtn.setImage(UIImage(named: "close.png"), for: .normal)
                cell.dividerView.isHidden = false
            }else{
                cell.expandBtn.setImage(UIImage(named: "open.png"), for: .normal)
                cell.dividerView.isHidden = true
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
        if tempAppData.isComplete{
            return 60
        }
        if tempAppData.isOpen {
            height = UITableView.automaticDimension
        }
        else{
            height = 60
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
            let langVC = PrepareforLandingViewController()
            self.navigationController?.pushViewController(langVC, animated: true)
            langVC.setAppData(data: appData[indexPath.section])
        default:
            print("")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableView.backgroundColor = UIColor.clear
        self.homeTableView.backgroundView = nil;
        appData = createAppData()

        do{
            if let decoded = UserDefaults.standard.data(forKey: "AppData") {
                if let decodedTeams = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) {
                       appData = decodedTeams as! [AppData]
                   }
            } else {
                 appData = createAppData()
                   let defaults = UserDefaults.standard
                   let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: appData, requiringSecureCoding: false)
                      defaults.set(encodedData, forKey: "AppData")
                      defaults.synchronize()
               }
           }catch (let error){
               #if DEBUG
                   print("Failed to convert UIColor to Data : \(error.localizedDescription)")
               #endif
           }
        
        
//        let decoded  = defaults.data(forKey: "AppData")
//        let decodedTeams =  try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded!) as! [AppData]
//
//        if decodedTeams.count == 0  {
//        }else{
//            let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: appData, requiringSecureCoding: false)
//             defaults.set(encodedData, forKey: "AppData")
//             defaults.synchronize()
//        }
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


