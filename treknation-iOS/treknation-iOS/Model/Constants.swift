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
        static let overviewDetailsDesc = "How does Express Entry Work? 1. Express Entry works by submitting an online profile for determining eligibility for the one of the below programs:     •     Federal Skilled Worker (FSW) •     Canadian Experience Class (CEC) •     Federal Skilled Trades (FST) 2. You can enter details about your age, education, work experience and language score to gain CRS(Comprehensive Ranking System) score. 3. You are then placed in the Express Entry pool and ranked relative to each other based on your CRS score. 4. You will be invited to apply for the permanent residence if your score is above the cut off score for that draw. This invitation is also called Invitation to Apply(ITA). A draw is conducted generally twice a month. How much does Express Entry cost? Express Entry generally costs $1325 CAD. There is an additional cost of $1325 CAD if your application has a spouse. There is also a fee of $225 CAD per dependent child in the application. This is just the fee charged by IRCC and there are other costs as well associated with education verification, language test, medical test and police verification which you will find in relevant sections. How long does it take? It usually takes 6 months after you receive your ITA. It may take additional time for other processes such as educational document verification, police verification, medical test and language test. These processes can take up to an additional 9 weeks. We suggest you visit this link and check your processing time - here."
        
        static let fyNOCTitle = "Find Your NOC";
        static let fyNOCCompletionTitle = "NOC Completed";
        static let fyNOCDetails = "NOC stands for National Occupation Classification. It helps to determine your job code. There are 5 types of NOC groups: NOC 0, A, B, C and D";
        static let fyNOCDetailsDesc = "For immigration purposes, the main job groups are:\n\n• Skill Type 0: Management jobs, such as restaurant managers, mine managers, shore captains (fishing), etc. \n\n• Skill Type A: Professional jobs that usually call for a degree from a university, such as doctors, dentists, architects, etc.\n\n• Skill Type B: Technical jobs and skilled trades that usually call for a college diploma or training as an apprentice, such as chefs, plumbers, electricians, etc.\n\n• Skill Type C: Intermediate jobs that usually call for high school and/or job-specific training, such as industrial butchers, long-haul truck drivers, food and beverage servers, etc. \n\n• Skill Type D: Labour jobs that usually give on-the-job training, such as fruit pickers, cleaning staff, oil field workers, etc. \n\nIf you are applying for Express Entry, your job and the work you have done in the past must be Skill Type 0 or level A or B.\n\nYou can use this site for finding your correct NOC code.\n\nAnother option would be to use the Job Bank website. Find a job opening that matches your current job (or any previous job) and whose job duties match yours. On the job opening page, you can find the corresponding NOC code in the \"Job Market Information\" page.";
        
        static let getECATitle = "Get Your ECA";
        static let getECACompletionTitle = "ECA Received";
        static let getECADetails = "An educational credential assessment (ECA) is used to verify that your foreign degree, diploma, or certificate (or other proof of your credential) is valid and equal to a Canadian one. You would need an ECA only if you have a non-Canadian degree and must be issued for Immigration purposes.";
        static let getECADetailsDesc = "What is ECA? An Educational Credential Assessment (ECA) is used to verify that your foreign degree, diploma, or certificate (or other proof of your credential) is valid and equal to a Canadian one. For example, an ECA will determine if an applicant’s foreign Master’s degree is of the same standard when compared to a Canadian Master’s degree. You would need an ECA only if you have a non-Canadian degree. In most cases, you will only need an assessment of your highest educational qualification but you can get an assessment for 2 or more credentials if it increases your CRS score. If your post-secondary credentials do not have a Canadian equivalent then you can get your secondary credentials assessed. How to get one? You must get your assessment either from an Organization or from a Body designated by the IRCC. They will give you a report that tells you what your education is equal to in Canada. Make sure that the assessment is issued for Immigration Purpose since there are multiple types of ECA Designated Organization: • Comparative Education Service – University of Toronto School of Continuing Studies • International Credential Assessment Service of Canada • World Education Services (WES) • International Qualifications Assessment Service (IQAS) • International Credential Evaluation Service Designated Profession Bodies. • Medical Council of Canada (professional body for doctors) - For specialist physicians and general practitioners (NOC 3111 or NOC 3112). • Pharmacy Examining Board of Canada (professional body for pharmacists) - For pharmacists (NOC 3131). An ECA is valid for a period of 5 years from the date it is issued.      Cost and Proccesing Time      How to Submit for EE";
        
        static let languageTestTitle = "Langauage Test";
        static let languageTestCompletionTitle = "Language Test Completed";
        static let languageTestDetails = "In this step, you will be required to take a language test in English and/or French and score a number of points to be eligible for Express Entry programs.";
        static let languageTestDetailsDesc = "For all the three Express Entry programs, you need to take English and/or French test(s) and score a minimum score to be eligible. FSW • First Official Language: English CLB 7;  French NCLC7 • Second Official Language: CLB or NCLC 5 CEC • NOC 0 or A: English CLB 7; French NCLC 7 • NOC B: CLB or NCLC 5 FST • English: Speaking and Listening CLB 5; Reading and Writing CLB 4 • French: Speaking and Listening NCLC 5; Reading and Writing NCLC 4 Minimum language requirements in IELTS for getting maximum points in express entry are: •     Listening: 8.5 •     Reading: 8 •     Writing: 7.5 •     Speaking: 7.5";
        
        static let checkEligibilityTitle = "Check Eligibility";
        static let checkEligibilityCompletionTitle = "Eligiblity Completed";
        static let checkEligibilityDetails = "In order to qualify for Express Entry for one of the three programs, you must meet the minimum requirements. Check the details to learn more about these requirements.";
        static let checkEligibilityDetailsDesc = "Check Eligibility There are minimum eligibility requirements for all 3 programs within Express Entry that need to be met by the applicant as shown below:          CEC         FSW          FST";

        
        static let checkCRSTitle = "Calculate CRS score";
                static let checkCRSCompletionTitle = "Calculated CRS score";
                static let checkCRSDetails = "CRS Score is the score used by IRCC to rank candidates in the Express Entry pool. Applicants with the highest CRS score in the pool above a certain cutoff are given the ITA.";
                static let checkCRSDetailsDesc = """
        Calculate CRS Score Express Entry is a competitive system that chooses applicants with the highest CRS score in the pool for giving ITA. You should try to achieve the highest points possible to increase your chances of getting an ITA. Use this link to check your CRS Score. Below are some of the ways of increasing your CRS score.

                Language Proficiency

                • Increasing the points with the language test is the easiest and surest way of increasing the CRS score. So, it's best if you give the language test after sufficient practice. For example, increasing your score from CLB 7 to CLB 9 in each section increases your score by 14 points per section. So, in total your points increase by a total of 56 (14 x 4).
                • You can also earn extra points for your Secondary language abilities. You can earn 4 additional points if you get the score in the below range:

                    • Speaking, Listening and Writing:
                    CLB 5 - CLB 9
                    • Reading: CLB 4 - CLB 9

                Education

                • If you have a master's degree or have more than 1 degree from outside Canada, it is beneficial to submit the education Assessment for all the degrees and not just for the highest degree as it gives you points for the additional degrees as well. This does not cost an additional amount if done in one take.
                • You can earn 15 points if you get a 1-year Canadian degree and 30 points if your Canadian degree is 2 years or more in duration.
                • You earn an additional 50 points if Canadian education combined with Canadian work experience.

                Non - Canadian Work Experience

                If your work experience outside Canada is less than 3 years, you can wait till you have completed 3 years. This will help you gain additional points in work experience. Receiving CLB 9 in ECA, along with 3 years of work experience can also add additional points.

                Spouse

                Depending on who is the primary applicant, your total points can change. If you are the primary applicant and your age is 40 years and your spouse’s age is 28 years, all other factors being the same, it could be beneficial to make your spouse the primary applicant since she gets additional points for age.

                Job Offer

                You can earn 200 points if you have a job offer that belongs to NOC 00(Senior Management) and 50 points if have a job offer that belongs to NOC 0, A, or B.

                Provincial Nominee Programs

                If you are short of points even after trying all the above methods, you should try to apply for PNP. Getting a nomination through PNP gives you an additional 600 points. You can find more information for PNP for each of the provinces at this link.
        """;
                
                static let enterEETitle = "Enter Express Entry Pool";
                        static let enterEECompletionTitle = "Entered Express Entry Pool";
                        static let enterEEDetails = "In this step, you will now create your IRCC secure account and get into the pool of applicants for your EE program.";
        static let enterEEDetailsDesc = """
                Enter Express Entry Pool Please make sure you have completed the below steps before proceeding to create your profile:
                        1. ECA from Step 2
                        2. Language Test details from Step 3
                        3. Personal preference code from the Eligibility form in Step 4

                        In order to create an express entry profile, you would need to create a GC Key account. Steps

                        • Create GC key account by going to this page(Please do not choose sign in with partner account) . Please remember the 4 security questions and answers thoroughly since you will be asked each time you log in.

                        • Once you create a GC key account click on an Express Entry button to begin filling your profile.

                        • Enter personal preference code. This should pre-fill some of the details. Fill in the rest of personal.


                        Note: You have 60 days to fill up and submit your profile.
                """;
                        
                        static let getITATitle = "Receiving ITA";
                        static let getITACompletionTitle = "Received ITA";
                        static let getITADetails = "Once you have created your online profile you would need to wait for an ITA(Invitation to Apply). You will get an invite if your CRS score is greater than or equal to the cut-off of the draw.";
                        static let getITADetailsDesc = """
                Receive Your ITA CIC conducts EE draws twice a month. Regardless of the program, you are applying for, you will get a CRS score. The score ranks you in the applicant pool using the CRS score with other candidates. The Ministry of Citizenship and Immigration decides the cut-off of each draw.

                        If your CRS score is greater than or equal to the cut-off, you will get an Invitation to Apply (ITA). You can see the ITA in the corresponding section of the Express Entry profile. Once you receive the ITA you will be eligible to apply for Permanent Residence

                        Previous draws can give you an indication of your chances in the next draw, but it does not guarantee it.

                        If you are eligible for more than one program you will be invited for one program based on this order
                        • Canadian Experience Class (CEC),
                        • Federal Skilled Worker (FSW) program, then
                        • Federal Skilled Trades (FST) program

                        Once you receive the ITA you can either:

                        • Accept it - If you choose to accept it you will have 60 days to apply for your Permanent Residence

                        • Decline it - If you choose to decline your profile will be moved back to the application pool

                        • Do no respond - If you do not respond your profile will expire and you will no longer be eligible for future draws

                        If you accept the ITA you will need to -
                        Fill out a form similar to ones in the Express Entry profile. Instructions to fill out the form are mentioned in the ITA pdf file received in the messages section of your profile. You will be asked for additional details. For e.g. Provide Address and Travel history for the past 10 years or from your 18th birthday. You would need to provide a Letter of Explanation if necessary.
                        Once you submit the form a personalized document checklist will be created which you can cover in the next steps.
                """;
                        
                        static let documentChecklistTitle = "Document Checklist";
                        static let documentChecklistCompletionTitle = "Document Checklist Completed";
                        static let documentChecklistDetails = "Once you get the ITA and fill out the post-ITA application forms, a personalized document checklist will be generated for your profile. You will have 60 days to gather all documents and upload the scanned copies.";
                        static let documentChecklistDetailsDesc = """
                Document Checklist Once you fill out the post ITA application forms a personalized document checklist is created for you. Since you only have 60 days to gather all documents and to submit them we recommend starting the process ASAP so that you can avoid delays.

                        The document checklist is mostly made up of the following section. You would need to upload documents in each of these sections. You would need to make sure that the size of the file is no larger than 4 MB. The file formats you can upload are .tiff, .jpg, .png, .doc, .docx and .pdf.
                         
                        Identification documents
                        • Passport
                        • Marriage Certificate / Common law proof/ Divorce-Proof
                        • Dependent Children (Birth Certificate, LOE if you don't have the birth certificate, proof of adoption)
                        • Digital Photograph (See specification - Link)

                        Mandatory documents
                        • Police Certification
                        • Medical Exam
                        • Proof of funds

                        Other documents as applicable
                        • Work experience
                        • Study
                        • Canadian Job offer
                        • Relatives
                        • Certificate of qualification
                        • Other names
                        • Use of representative

                        Tips

                        If one of your documents is in a language other than English or French, you must also upload:
                        • An English or French translation
                        • A certified photocopy of the original document
                        • An affidavit from the person who completed the translation (if they’re not a certified translator)

                        If a certified translator completed your translation:

                        • The document must be stamped with the translator’s certification or registration number
                        • You can indicate that you’re not providing an affidavit because a certified translator completed the translation (write a letter and scan it with your translated document)

                        If you feel like a document you are submitting might raise the slightest question from an immigration officer, you should add a Letter of Explanation (LoE) (sample in the link) to your documents. For example, if it concerns your passport section, then add your LoE to the PDF file that you will upload to the passport section.
                """;
                        
                        static let applicationFeesTitle = "E-APR Fees";
                        static let applicationFeesCompletionTitle = "E-APR Fees Paid";
                        static let applicationFeesDetails = "Once you fill out the online form and upload the documents in the last step, you will be shown fees you need to pay for your e-APR (Electronic Application for Permanent Residence).";
                        static let applicationFeesDetailsDesc = """
                E-APR Fees There are 3 types of fees that you would need to pay for your e-APR:

                        • Processing fees: You need to pay a processing fee for yourself and your dependents who are part of the application. Usually, the fee is around 825 CAD per person and 225 CAD for a dependent child

                        • Right of Permanent Residence fee: You would need to pay 500 CAD for the Right to Permanent residence fee. You can pay the fee along with the processing fee to avoid delays or wait until IRCC approves your application. We recommend you pay this fee along with the Processing Fee. Note that this fee is paid per application hence you will not be required to pay for each individual in your application. This fee can be refunded if your application is rejected

                        • Biometrics fees: In most cases, you must pay a biometrics fee when you submit your application. Otherwise, you may experience delays. The biometrics fee covers the cost of collecting fingerprints and a digital photo and usually costs 85 CAD per person. After you pay the biometrics fee with a complete application, IRCC will send you a letter confirming that you need to give your biometrics and where you can go. You must show this letter when you give your biometrics. You must give your biometrics in person. Make sure to book an appointment if this service is offered. Find a collection point close to you.

                        You can see the complete fee list here

                        Refunds
                        If your application isn’t complete, you can get a refund for:
                        • Processing fee
                        • Right of permanent residence fee (if you’ve paid it)
                        You won’t get a refund of the processing fee once IRCC starts processing your application.

                        After you submit your application, you can use this Webform if you need to report important changes in your application
                """;
                        
                        static let aorToPPRTitle = "AoR to PPR";
                        static let aorToPPRCompletionTitle = "PPR Received";
                        static let aorToPPRDetails = "After submitting your e-APR, you will receive an Acknowledgement of Receipt (AOR). This is the AOR date and is the date from when your 6 months intended processing time begins. Once IRCC has reviewed your biometrics, background checks, and medical examinations evaluations you will get a golden email for Passport Request (PPR).";
                        static let aorToPPRDetailsDesc = """
                AOR to PPR After you submit your e-APR you get an AOR which is a confirmation that your application was received by IRCC and they have created a file with your application number. After you submit your application, you can use this Webform if you need to report important changes to your application such as:

                        • Changes in address, telephone number, email or other contact information
                        • Births or deaths in your immediate family                   • Marriages or divorces
                        • Adoptions
                        • Changes to your job or job offer
                        • A new educational credential
                        • Updated language test results

                        IRCC will communicate with you through your online account to:

                        • Tell you to give your biometrics and medical
                        • Confirm that they have reviewed your application
                        • Send you updates on the status of your application
                        • Ask you for more documents, if necessary
                        • Set up an interview, if necessary
                        • Tell you what you need to do and what will happen next

                        IRCC will decide on your application depending on:

                        • Whether you meet the eligibility criteria for the program
                        • Whether you’re admissible to Canada, based on the results of your
                            • Medical exam
                            • Police certificates
                            • Background checks

                        If your application is Rejected and you would like to be considered for future rounds, then:

                        • Fill out and submit a new Express Entry profile
                        • Meet the eligibility criteria
                        • Be accepted into the pool again

                        If your application is approved then you would need to send your passport to IRCC, who will then mail you a:

                        • Confirmation of Permanent Residence (COPR)
                        • A permanent resident visa (if you're from a country that requires a visa)

                        Your COPR will have information about who you are, as well as your photograph. Your COPR is valid for a limited time so use it before it expires.
                """;
                        
                        static let landingPreparationTitle = "Prepare for Landing";
                        static let landingPreparationCompletionTitle = "elcome to Canada!";
                         static let landingPreparationDetails = "Congratulations!! now that you have received your COPR you are just one step away from getting your PR card. The next steps will depend on whether you are inside or outside of Canada.";
                        static let landingPreparationDetailsDesc = "Prepare for Landing The following guidelines provide you detailed instructions depending on whether you are outside Canada or inside Canada.      If you are already in Canada      If you are outside Canada";
        
        
        static let aboutUs = "TrekNation was born out a necessity by a slew of problems faced by its founder as they were going through the immigration process. We engaged overpriced consultants for thousands of dollars but most of the leg work was asked to be done by us. We scoured the internet for a simple step by step process to understand the process but we ended up reading mighty long pages without any natural flow and eventually ended up confused. So we came up with the idea to help our users navigate through the hurdles of the immigration process through a self serve mobile app which would guide the users through a step by step process. "
        
        static let disclamerPolicy = "The information provided on Treknation app is for general informational purposes only. All information on the app is provided in good faith, however we make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information on the Site. Under no circumstance shall we have any liability to you for any loss or damage of any kind incurred as a result of the use of the app or reliance on any information provided on the site.                                                                                                                                                                                                                        Your use of the app and your reliance on any information on the app is solely at your own risk. The App cannot and does not contain legal advice. The information is provided for general informational and educational purposes only, and is not a substitute for legal advice.                                                                                 Accordingly, before taking any actions based upon such information, we encourage you to consult with the appropriate legal professionals or licensed attorneys. We do not provide any kind of legal advice. The use or reliance of any information contained on this site is solely at your own risk."
        
        static let commonMistakesTitle1 = "Passport Scan Missing/incomplete.";
        static let commonMistakesDetails1 = "This error message is shown when the user has not uploaded all the pages with stamps, markings, entry/exit, or visas.";
        
        static let commonMistakesTitle2 = "Work experience description & duties do not match those of the NOC code. This message is generally shown when the duties of the job experience do not match with the associated NOC code.";
        static let commonMistakesDetails2 = "You can have the title to be different than the one mentioned for the NOC but the duties and description for the NOC should be the same as the one mentioned within the Employment reference letter. You can get more information for the NOC at this link and find the template for the employment reference letter here.";
        
        static let commonMistakesTitle3 = "Not uploading Educational Credential Assessment (ECA).";
        static let commonMistakesDetails3 = "There are times when IRCC might not ask for the ECA, your qualification degrees. If you have achieved Express Entry points for education, then you must upload ECA, your degrees, and/or academic transcripts.";
        
        static let commonMistakesTitle4 = "Police Clearance Certificate (PCC) missing.";
        static let commonMistakesDetails4 = "If you left your home country for more than 6 months since the age of 18 then you will most likely have to upload at least one police clearance certificate. Check the police certificate section here to understand what you need. You need to provide police certificates for all your family members, spouse, and children of 18 years or older.";
        
        static let commonMistakesTitle5 = "PCC is not scanned in color.";
        static let commonMistakesDetails5 = "This message is specifically shown if the PCC is black and white. Even if the original PCC is in black and white, you should color scan it.";
        
        static let commonMistakesTitle6 = "Not having a few words explicitly written (Permanent, Full time, Non-seasonal) on job offers.";
        static let commonMistakesDetails6 = "The employment reference letter needs to be exactly as per the format that CIC expects. You can find the template for the employment reference letter here.";
        
        static let commonMistakesTitle7 = "Submitting internet copies of bank statements that are not printed with the letterhead of the bank.";
        static let commonMistakesDetails7 = "Bank statements should be printed on the letterhead of the bank. You can get more information on proof of funds here.";
        
        static let commonMistakesTitle8 = "Not uploading the English or French translation.";
        static let commonMistakesDetails8 = "If your documents are not in English or French, they will need to be translated by a certified translator to English or French. You may be requested by IRCC to submit an affidavit of the translator.";
        
        static let commonMistakesTitle9 = "Uploading only the translation and not the foreign-language document.";
        static let commonMistakesDetails9 = "When uploading the translated document, remember to always upload the original foreign language document as well.";
        
        static let commonMistakesTitle10 = "Canadian Education.";
        static let commonMistakesDetails10 = "The prerequisite for getting Canadian Education points is that the course should not be more than 50% online. It is at the discretion of the immigration officer to refuse the additional 15 or 30 points for a Canadian education credential if the course fails to meet the criteria as mentioned above or if the officer deems you were not in good standing on course completion.";
        
        static let commonMistakesTitle11 = "Not Signing the Application Forms:";
        static let commonMistakesDetails11 = "This mistake happens often when the user misses out on any signature. E.g. Some forms such as Additional Family information may require as many as 3 signatures on a single page. Even if 1 signature is missed, the file may be returned to rectify. Another common mistake is to sign where it was not required. E.g. you may have signed for a section for which you need to sign only if you used a translator. If no translator was used, the file may be sent back. Hence it is very important to only sign wherever required.";
        
        static let commonMistakesTitle12 = "Paying the Fee Incorrectly:";
        static let commonMistakesDetails12 = "Different immigration programs require different methods for making the payment. Payment options may rely on many factors such as where will you be paying from and what is amount you will be paying. You can make a payment online, via bank draft, certified cheque, or money order. Please visit this link for more details. Always be sure to pay the correct amount as provided by CIC. Incorrect fee payment might delay your application.";
        
        static let commonMistakesTitle13 = "Correct Size Photo:";
        static let commonMistakesDetails13 = "Express Entry application requires photographs of a specific size. You can review the photograph sizes at this link. Failure to send the correct size photograph might result in an error and you might be required to submit the photo again.";
        
        static let commonMistakesTitle14 = "Additional Forms for Certain Countries:";
        static let commonMistakesDetails14 = "Users from certain countries are required to provide additional forms, in addition to the standard forms required by everyone else. For example, a residency questionnaire is required by people residing in Abu Dhabi, UAE (United Arab Emirates. Education andWork Experience questionnaire is also required to be filled by people residing in Islamabad, Pakistan.";
        
        static let commonMistakesTitle15 = "Providing Misinformation/Not Explaining Missing Information:";
        static let commonMistakesDetails15 = "Providing incorrect information is a serious offense according to Canadian Immigration law. The decision on an applicant’s file is made based on the data provided by the applicant. The negative consequence of providing incorrect information includes rejection of the application as well as exclusion from Canada for at least 2 years. If there is information, requested by CIC, which is missing, you must provide an accurate reason for the missing information and by when can you provide it.";
        
        static let commonMistakesTitle16 = "Illegible Handwriting on handwritten immigration Application Forms:";
        static let commonMistakesDetails16 = "Application forms can either be completed by hand or digitally using a computer. Generally, Adobe Reader is used to filling forms online. It is up to the user to choose how they want to fill the form. It is usually advised to fill the form on the computer. If users fill the form manually, there is a chance it may not be legible to the reviewing officer. As a result, the officer might return the file to the user asking for clarification for the illegible fields.";
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
        static let checklistLOE = "https://drive.google.com/file/d/19NvaeMYNc2-jfc8atrkGtJWKUSk-CPo1/view?usp=sharing"
        static let digitalPhotoLink = "https://www.canada.ca/en/immigration-refugees-citizenship/services/new-immigrants/pr-card/apply-renew-replace/photo.html"

        static let feelist = "https://www.cic.gc.ca/english/information/fees/fees.asp#rprf"
        static let webform = "https://www.cic.gc.ca/english/contacts/web-form.asp"
        
        static let aorWebForm = "https://www.cic.gc.ca/english/contacts/web-form.asp"
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
