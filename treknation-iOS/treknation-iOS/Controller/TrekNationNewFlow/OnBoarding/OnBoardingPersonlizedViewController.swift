//
//  OnBoardingPersonlizedViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 03/01/21.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit
import GBFloatingTextField
import CoreData
import FirebaseFirestore

class OnBoardingPersonlizedViewController: TNBaseViewController {

    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .whiteColor
        }
    }
    @IBOutlet weak var personalizedMessageLabel: UILabel! {
        didSet {
            personalizedMessageLabel.textColor = .darkSlateBlue
            personalizedMessageLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.applyRoundedBG(backgroundColor: .lightBlue, borderWidth: 1, borderColor: UIColor.clear.cgColor, tittleColor: .darkSlateBlue)
            nextButton.titleLabel?.font = UIFont.ThinSemiBold14Font
        }
    }
    
    @IBOutlet weak var yourNameTextFiled: GBTextField! {
        didSet {
            yourNameTextFiled.placeholder = "Your Name"
            yourNameTextFiled.placeholderColor = .darkSlateBlue
            yourNameTextFiled.font = UIFont.SourceSansProRegular14Font
        }
    }
    @IBOutlet weak var yourEmailTextField: GBTextField! {
        didSet {
            yourEmailTextField.placeholder = "Your Email"
            yourEmailTextField.placeholderColor = .darkSlateBlue
            yourEmailTextField.font = UIFont.SourceSansProRegular14Font
        }
    }
    
    @IBOutlet weak var errorMessageLabel: UILabel! {
        didSet {
            errorMessageLabel.textColor = .errorColor
            errorMessageLabel.font = UIFont.SourceSansProRegular11Font
        }
    }
    
    var userStage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .whiteColor
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
        guard let name = yourNameTextFiled.text, !name.isEmpty, let email = yourEmailTextField.text, !email.isEmpty else {
            return
        }
        
        AppContext.sharedAppContext.userName = name
        AppContext.sharedAppContext.email = email
        
        if !email.isValidEmail() {
            errorMessageLabel.text = "Please enter a valid email address"
            return
        }
        
        // Add logic to save the data
        saveData(name: name, email:email)
        
        self.logAnalyticsEventsForAction(eventName: "user_details", eventProperties: ["email":email, "Name":name])
        
        let onBoardingInsideCanadaViewController = OnBoardingInsideCanadaViewController(nibName: "OnBoardingInsideCanadaViewController", bundle:nil)
        self.navigationController?.pushViewController(onBoardingInsideCanadaViewController, animated: true)
    }
    
    func saveData(name:String, email:String) {
        var docRef: DocumentReference? = nil
        docRef = Firestore.firestore().document("UsersList/Users")
        let dataToSave : [String : Any] = ["userName" : name, "userEmail" : email, "userStage" : userStage ?? "", "source" : "iOS"]
        
        docRef = Firestore.firestore().collection("UsersList").addDocument(data: dataToSave) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(docRef!.documentID)")
            }
        }
    }
}
