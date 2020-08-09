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
        cell.expandBtn.addTarget(self, action: #selector(self.didExpand), for: .touchUpInside)
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
            height = 150
        }
        else{
            height = 50
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    var appData: [AppData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        appData = createAppData()
    }
    
    
    func createAppData() -> [AppData]{
        var temp:[AppData] = []
        let overview = AppData.init(title:"Overview" , overview: "Express Entry is an electronic immigration selection system for selecting applicants for permanent residence under the 3 programs Federal Skilled Worker, Canadian Experience Class, and Federal Skilled Trades. You can also apply through express entry if you have received a nomination from a province or territory. This nomination is also called PNP which stands for Provincial Nominee Program.")
        let noc = AppData.init(title:"Find your NOC" , overview: "NOC stands for National Occupation Classification. It helps to determine your job code which you will need while creating your EE profile. There are 5 types of NOC groups: NOC 0, A, B, C and D")
        
        let eca = AppData.init(title:"Get your ECA" , overview: "An Educational Credential Assessment (ECA) is used to verify that your foreign degree, diploma, or certificate (or other proof of your credential) is valid and equal to a Canadian one. You would need an ECA only if you have a non-Canadian degree and must be issued for Immigration purposes")
        
        let languageTests = AppData.init(title:"Language Tests" , overview: "In this step, you will be required to take a language test in English and/or French and score a number of points to be eligible for Express Entry programs. Express Entry uses CLB(Canadian Language Benchmark) as a method of checking your language level based on your test results. ")
        
        let checkEligibility = AppData.init(title:"Check Eligibility" , overview: "Express Entry uses CLB(Canadian Language Benchmark) as a method of checking your language level based on your test results.")
        
        let calculateCRS = AppData.init(title:"Calculate CRS score" , overview: "CRS Score is the score used by IRCC to rank candidates in the Express Entry pool. Applicants with the highest CRS score in the pool above a certain cutoff are given the ITA.")
        
        
        let enterEEPool = AppData.init(title:"Enter Express Entry Pool" , overview: "In this step, you will now create your IRCC secure account and get into the pool of applicants for your EE program.")
        
        let getITA = AppData.init(title:"Receiving ITA" , overview: "Once you have created your online profile you would need to wait for an ITA(Invitation to Apply). You will get an invite if your CRS score is greater than or equal to the cut-off of the draw.")
    
        let documentChecklist = AppData.init(title:"Document Checklist" , overview: "Once you get the ITA and fill out the post-ITA application forms, a personalized document checklist will be generated for your profile. You will have 60 days to gather all documents and upload the scanned copies.")
        
        let applicationFees = AppData.init(title:"E-APR Fees" , overview: "Once you fill out the online form and upload the documents in the last step, you will be shown fees you need to pay for your e-APR (Electronic Application for Permanent Residence).")
        
        let aorToPPR = AppData.init(title:"AoR to PoR" , overview: "After submitting your e-APR, you will receive an Acknowledgement of Receipt (AOR). This is the AOR date and is the date from when your 6 months intended processing time begins. Once IRCC has reviewed your biometrics, background checks, and medical examinations evaluations you will get a golden email for Passport Request (PPR).")

        let landingPreparation = AppData.init(title:"Prepare for Landing" , overview: "Congratulations!! now that you have received your COPR you are just one step away from getting your PR card. The next steps will depend on whether you are inside or outside of Canada.")
        
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


