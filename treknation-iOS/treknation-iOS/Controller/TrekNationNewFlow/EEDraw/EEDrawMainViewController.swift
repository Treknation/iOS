//
//  EEDrawMainViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 14/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit
import FirebaseFirestore

class EEDrawMainViewController: TNBaseViewController {
    @IBOutlet weak var yellowView: UIView! {
        didSet {
            yellowView.backgroundColor = UIColor.yellow
        }
    }
    @IBOutlet weak var countLabel: UILabel! {
        didSet {
            countLabel.font = UIFont.ThinRegular48Font
            countLabel.textColor = UIColor.darkSlateBlue
        }
    }
    
    @IBOutlet weak var cecLabel: UILabel! {
        didSet {
            cecLabel.font = UIFont.ThinRegular16Font
            cecLabel.textColor = UIColor.darkSlateBlue
        }
    }
    
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.ThinRegular14Font
            dateLabel.textColor = UIColor.darkSlateBlue
        }
    }
    @IBOutlet weak var inviteCountLabel: UILabel! {
        didSet {
            inviteCountLabel.font = UIFont.ThinRegular14Font
            inviteCountLabel.textColor = UIColor.darkSlateBlue
        }
    }
    @IBOutlet weak var tableTitleLabel: UILabel! {
        didSet {
            tableTitleLabel.font = UIFont.ThinSemiBold18Font
            tableTitleLabel.textColor = UIColor.darkSlateBlue
        }
    }
    @IBOutlet weak var eeDrawTableView: UITableView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.color = .darkSlateBlue
        }
    }
    
    
    var recentDict:NSDictionary?
    var eeDrawListArray = [NSDictionary]()
    //noOfTheInvitationsIssued
    //crsScoreOfTheLowestRank
    //dateTime
    //category
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarCustomization()
        tabBarController?.tabBar.isHidden = true
        yellowView.setCircleWithShadow()

        // Do any additional setup after loading the view.
        eeDrawTableView.register(UINib(nibName: EEDrawTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: EEDrawTableViewCell.cellIdentifier)
        readData()
        activityIndicatorView.startAnimating()
        
        self.logAnalyticsEventsForActionForUserProperties(eventName: "ee_draws", eventProperties: ["":""])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        yellowView.setCircleWithShadow()
    }

    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    func readData() {
        let db = Firestore.firestore()
        db.collection("eeDraws").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let querySnapshot = querySnapshot, !querySnapshot.isEmpty {
                     for document in querySnapshot.documents {
                        self.eeDrawListArray.append(document.data() as NSDictionary)
                    }
                }
                
                self.eeDrawListArray.sort { (dict1, dict2) -> Bool in
                    
                    guard let postTimestamp1 = dict1.object(forKey: "dateTime") as? Timestamp else { return false }
                    
                    guard let postTimestamp2 = dict2.object(forKey: "dateTime") as? Timestamp else { return false }

                    /// Sort in descending order
                    return postTimestamp1.seconds > postTimestamp2.seconds
                }
                
                self.eeDrawListArray = Array(self.eeDrawListArray.prefix(31))
                
                if !self.eeDrawListArray.isEmpty {
                    self.recentDict = self.eeDrawListArray.first
                    self.eeDrawListArray.remove(at: 0)
                }
                
                self.setText()
                self.eeDrawTableView.reloadData()
            }
            
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
        }
    }
    
    private func navigationBarCustomization() {
           navigationController?.isNavigationBarHidden = false
           navigationController?.navigationBar.tintColor = UIColor.darkSlateBlue
           navigationController?.navigationBar.barTintColor = .white
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.ThinSemiBold18Font, NSAttributedString.Key.foregroundColor: UIColor.darkSlateBlue]
           navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconLeftArrow"), style: .plain, target: self, action: #selector(backButtonClicked))
           navigationItem.title = "Express Entry Results"
       }
       
    private func setText() {
        
        if let countLabelText = self.recentDict?.object(forKey: "crsScoreOfTheLowestRank") as? NSNumber {
            countLabel.text = "\(countLabelText)"
        }
        
        if let categoryText = self.recentDict?.object(forKey: "category") as? String {
            cecLabel.text = "\(categoryText)"
        }
        
        countLabel.isHidden = false
        
        if let postTimestamp = self.recentDict?.object(forKey: "dateTime") as? Timestamp {
            dateLabel.text = Date(milliseconds: postTimestamp.seconds).getFormattedDate()
        } else {
            dateLabel.text = Date().getFormattedDate()
        }
                
        
        dateLabel.isHidden = false
        inviteCountLabel.text = "\(self.recentDict?.object(forKey: "noOfTheInvitationsIssued") as? NSNumber ?? 0) Invited"
        inviteCountLabel.isHidden = false
        tableTitleLabel.text = "Recent Draws"
        tableTitleLabel.isHidden = false
        yellowView.isHidden = false
    }

       @objc func backButtonClicked() {
           navigationController?.popViewController(animated: true)
       }
}

extension EEDrawMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenHeight * 50.0 / 667.0
    }
}

extension EEDrawMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eeDrawListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EEDrawTableViewCell.cellIdentifier, for: indexPath) as? EEDrawTableViewCell {
            cell.configureCell(eeDrawDict: eeDrawListArray[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
