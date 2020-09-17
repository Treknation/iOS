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
        static let overviewDetails = "You can become a Permanent Resident (PR) of Canada through the Express Entry system which has three programs Federal Skilled Worker (FSW), Canadian Experience Class (CEC) and Federal Skilled Trades (FST).";
        
        static let fyNOCTitle = "1. Find Your NOC";
        static let fyNOCDetails = "NOC stands for National Occupation Classification. It helps to determine your job code. There are 5 types of NOC groups: NOC 0, A, B, C and D";
        
        static let getECATitle = "2. Get Your ECA";
        static let getECADetails = "An educational credential assessment (ECA) is used to verify that your foreign degree, diploma, or certificate (or other proof of your credential) is valid and equal to a Canadian one. You would need an ECA only if you have a non-Canadian degree and must be issued for Immigration purposes.";
        
        static let languageTestTitle = "3. Langauage Test";
        static let languageTestDetails = "In this step, you will be required to take a language test in English and/or French and score a number of points to be eligible for Express Entry programs.";
        
        static let checkEligibilityTitle = "4. Check Eligibility";
        static let checkEligibilityDetails = "In order to qualify for Express Entry for one of the three programs, you must meet the minimum requirements. Check the details to learn more about these requirements.";
        
        
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
        
        
        static let aboutUs = "TrekNation was born out a necessity by a slew of problems faced by its founder as they were going through the immigration process. We engaged overpriced consultants for thousands of dollars but most of the leg work was asked to be done by us. We scoured the internet for a simple step by step process to understand the process but we ended up reading mighty long pages without any natural flow and eventually ended up confused. So we came up with the idea to help our users navigate through the hurdles of the immigration process through a self serve mobile app which would guide the users through a step by step process. "
        
        static let disclamerPolicy = "The information provided on Treknation app is for general informational purposes only. All information on the app is provided in good faith, however we make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information on the Site. /n Under no circumstance shall we have any liability to you for any loss or damage of any kind incurred as a result of the use of the app or reliance on any information provided on the site. Your use of the app and your reliance on any information on the app is solely at your own risk. /n The App cannot and does not contain legal advice. The information is provided for general informational and educational purposes only, and is not a substitute for legal advice. /n Accordingly, before taking any actions based upon such information, we encourage you to consult with the appropriate legal professionals or licensed attorneys. We do not provide any kind of legal advice. The use or reliance of any information contained on this site is solely at your own risk."
    }
    
    
    struct URLConstants {
        
        static let this = "https://noc.esdc.gc.ca/Home/Welcome/4f6368c7a3b44140bc06c177bfebbaa0?GoCTemplateCulture=en-CA";
        static let JobBank = "https://www.jobbank.gc.ca/home"
        static let overviewHere = "https://www.canada.ca/en/immigration-refugees-citizenship/services/application/check-processing-times.html"
        static let fswLink = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/eligibility/federal-skilled-workers/six-selection-factors-federal-skilled-workers.html"
        static let fundsPoofFSW = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/documents/proof-funds.html"
        
        static let fstJobOffer = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/documents/proof-funds.html"
        
        static let fstSecondLink = "https://www.canada.ca/en/immigration-refugees-citizenship/services/come-canada-tool-immigration-express-entry.html"
        
        static let IELTSLink = "https://www.ielts.org/"
        static let CELPIP = "https://www.celpip.ca/"
        static let tefCanada = "https://www.lefrancaisdesaffaires.fr/tests-diplomes/test-evaluation-francais-tef/tef-canada/"
        static let tcfCanada = "https://www.ciep.fr/tcf-canada"
        static let crsOverview = "https://www.cic.gc.ca/english/immigrate/skilled/crs-tool.asp"
        static let crsLink = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/provincial-nominees/works.html"
        static let cgKeyPage = "https://www.canada.ca/en/immigration-refugees-citizenship/services/application/account.html"
        static let documentProofOffunds = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/documents/proof-funds.html"
        static let checklistPhotocopy = "https://www.cic.gc.ca/english/helpcentre/glossary.asp#certified_photocopy"
        static let checklistAffidavit = "https://www.cic.gc.ca/english/helpcentre/glossary.asp#affidavit"
        static let checklistTranslator = "https://www.cic.gc.ca/english/helpcentre/glossary.asp#certified_translator"
        static let checklistLOE = "https://docs.google.com/document/d/1-31XMpXjR80ttZ9SGGSeJtBJqwI3LGLW/edit"
        
        static let feelist = "https://www.cic.gc.ca/english/information/fees/fees.asp#rprf"
        static let webform = "http://www.cic.gc.ca/english/contacts/web-form.asp"
        
        static let aorWebForm = "http://www.cic.gc.ca/english/contacts/web-form.asp"
        static let submitProfile = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/submit-profile.html"
        static let inCanadaAppointment = "https://www.canada.ca/en/immigration-refugees-citizenship/corporate/contact-ircc/offices/canada-appointment-only.html"
        
        static let inCanadaWebForm = "https://services3.cic.gc.ca/ecas/?app=coanotify&lang=en"
        
        static let preArrival = "http://www.cic.gc.ca/english/newcomers/before-services.asp"
        static let education = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/documents/education-assessed.html"
        static let certifications = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/eligibility/skilled-trades.html#provinces"
        static let livingAndFinding = "https://www.canada.ca/en/immigration-refugees-citizenship/services/new-immigrants/new-life-canada.html"
        static let cbsaLink = "https://www.cbsa-asfc.gc.ca/menu-eng.html"
        static let moneyAmount = "https://www.cbsa-asfc.gc.ca/travel-voyage/ttd-vdd-eng.html"
        static let contactWebForm = "https://www.cic.gc.ca/english/contacts/web-form.asp"
        
        static let googlePlay = "https://policies.google.com/privacy"
        
        static let converResultsLink = "https://www.canada.ca/en/immigration-refugees-citizenship/services/immigrate-canada/express-entry/documents/language-requirements/language-testing.html"
    }

}
