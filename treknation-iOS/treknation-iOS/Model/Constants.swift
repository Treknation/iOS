//
//  File.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-07-04.
//  Copyright © 2020 treknation. All rights reserved.
//

import Foundation
class Constant: NSObject {

    struct AppDetailsConstants {
        
        static let overviewTitle = "Overview";
        static let overviewDetails = "You can become a Permanent Resident of Canada through the Express Entry system which has three programs Federal Skilled Worker, Canadian Experience Class and Federal Skilled Trades.";
        
        static let fyNOCTitle = "1. Find Your NOC";
        static let fyNOCDetails = "NOC stands for National Occupation Classification. It helps to determine your job code. There are 5 types of NOC groups: NOC 0, A, B, C and D";
        
        static let getECATitle = "2. Get Your ECA";
        static let getECADetails = "In this step you will now create your IRCC secure account and get into the pool of applicants for your EE program.";
        
        static let languageTestTitle = "3. Langauage Test";
        static let languageTestDetails = "In this step, you will be required to take a language test in English and/or French and score a number of points to be eligible for Express Entry programs.";
        
        static let checkEligibilityTitle = "4. Check Eligibility";
        static let checkEligibilityDetails = "In order to qualify for Express Entry for one of the three programs, you must meet the minimum requirements.";
        
        
        static let checkCRSTitle = "5. Calculate CRS score";
        static let checkCRSDetails = "CRS Score is the score used by IRCC to rank candidates in the Express Entry pool. Applicants with the highest CRS score in the pool above a certain cutoff are given the ITA.";
        
        static let enterEETitle = "6. Enter Express Entry Pool";
        static let enterEEDetails = "In this step, you will now create your IRCC secure account and get into the pool of applicants for your EE program.";
        
        static let getITATitle = "7. Receiving ITA";
        static let getITADetails = "Once you have created your online profile you would need to wait for an ITA(Invitation to Apply). You will get an invite if your CRS score is greater than or equal to the cut-off of the draw.";
        
        static let documentChecklistTitle = "8. Document Checklist";
        static let documentChecklistDetails = "Once you get the ITA and fill out the post-ITA application forms, a personalized document checklist will be generated for your profile. You will have 60 days to gather all documents and upload the scanned copies.";
        
        static let applicationFeesTitle = "9. E-APR Fees";
        static let applicationFeesDetails = "Once you fill out the online form and upload the documents in the last step, you will be shown fees you need to pay for your e-APR (Electronic Application for Permanent Residence).";
        
        static let aorToPPRTitle = "10. AoR to PoR";
        static let aorToPPRDetails = "After submitting your e-APR, you will receive an Acknowledgement of Receipt (AOR). This is the AOR date and is the date from when your 6 months intended processing time begins. Once IRCC has reviewed your biometrics, background checks, and medical examinations evaluations you will get a golden email for Passport Request (PPR).";
        
        static let landingPreparationTitle = "11. Prepare for Landing";
         static let landingPreparationDetails = "Congratulations!! now that you have received your COPR you are just one step away from getting your PR card. The next steps will depend on whether you are inside or outside of Canada.";
    }
    
    
    struct URLConstants {
        
        static let this = "https://noc.esdc.gc.ca/Home/Welcome/4f6368c7a3b44140bc06c177bfebbaa0?GoCTemplateCulture=en-CA";
        static let JobBank = "https://www.jobbank.gc.ca/home"
    
        
    }

}
