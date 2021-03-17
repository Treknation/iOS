//
//  DashboardViewController.swift
//  treknation-iOS
//
//  Created by Purva Rode Patil on 1/8/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class DashboardViewController: TNBaseViewController {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.textColor = .darkSlateBlue
            welcomeLabel.font = UIFont.ThinSemiBold18Font
        }
    }
    @IBOutlet weak var seeAllStepsLabel: UILabel! {
        didSet {
            seeAllStepsLabel.textColor = .darkSlateBlue
            seeAllStepsLabel.font = UIFont.ThinRegular12Font
        }
    }
    
    @IBOutlet weak var getStartedContainerView: UIView!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var getStartedLabel: UILabel! {
        didSet {
            getStartedLabel.textColor = .darkSlateBlue
            getStartedLabel.font = UIFont.ThinSemiBold18Font
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = .darkSlateBlue
            descriptionLabel.font = UIFont.ThinRegular12Font
        }
    }
    @IBOutlet weak var startYourJourneyLabel: UILabel! {
        didSet {
            startYourJourneyLabel.textColor = .darkSlateBlue
            startYourJourneyLabel.font = UIFont.ThinRegular12Font
        }
    }
    
    @IBOutlet weak var stepsContainerView: UIView!
    
    @IBOutlet weak var previousStepButton: UIButton!
    @IBOutlet weak var previousStepView: UIView!
    @IBOutlet weak var previousTitleLabel: UILabel! {
        didSet {
            previousTitleLabel.textColor = .darkSlateBlue
            previousTitleLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var previousStatusLabel: UILabel! {
        didSet {
            previousStatusLabel.textColor = .darkSlateBlue
            previousStatusLabel.font = UIFont.ThinRegular14Font
        }
    }

    @IBOutlet weak var InProgressStepView: UIView!
    @IBOutlet weak var InProgressTitleLabel: UILabel! {
        didSet {
            InProgressTitleLabel.textColor = .darkSlateBlue
            InProgressTitleLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var InProgressStatusLabel: UILabel! {
        didSet {
            InProgressStatusLabel.textColor = .darkSlateBlue
            InProgressStatusLabel.font = UIFont.ThinRegular14Font
        }
    }

    @IBOutlet weak var nextStepView: UIView!
    @IBOutlet weak var nextTitleLabel: UILabel! {
        didSet {
            nextTitleLabel.textColor = .darkSlateBlue
            nextTitleLabel.font = UIFont.ThinMedium18Font
        }
    }
    @IBOutlet weak var nextStatusLabel: UILabel! {
        didSet {
            nextStatusLabel.textColor = .darkSlateBlue
            nextStatusLabel.font = UIFont.ThinRegular14Font
        }
    }
    var viewAppearedCount = 0
        
    //MARK:- View Controller LifeCycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewAppearedCount += 1
        setPreviousStep()
        setInProgressStep()
        setNextStep()
        prepareUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.register(UINib(nibName: ListTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        AppContext.sharedAppContext.singleArray = Utility.getAllCRSCalculatorDataForSingle()
        AppContext.sharedAppContext.marriedArray = Utility.getAllCRSCalculatorDataForMarried()
        self.logAnalyticsEventsForActionForUserProperties(eventName: "dashboard_onboarded", eventProperties: ["":""])
    }
    
    //MARK:- Private Methods
    private func prepareUI() {
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true

        if viewAppearedCount == 1 {
            welcomeLabel.text = AppContext.sharedAppContext.isFirstTimeUser ? "Welcome, \(AppContext.sharedAppContext.userName.capitalized)!" : "Welcome back, \(AppContext.sharedAppContext.userName.capitalized)!"
            setShadow()
            stepsContainerView.isHidden = AppContext.sharedAppContext.isFirstTimeUser
            getStartedContainerView.isHidden = !AppContext.sharedAppContext.isFirstTimeUser
            getStartedButton.isUserInteractionEnabled = AppContext.sharedAppContext.isFirstTimeUser
        } else {
            welcomeLabel.text = "Welcome back, \(AppContext.sharedAppContext.userName.capitalized)!"
            stepsContainerView.isHidden = false
            getStartedContainerView.isHidden = true
            getStartedButton.isUserInteractionEnabled = false
        }
    }
    
    private func setShadow() {
        getStartedContainerView.applyShadow()
        previousStepView.applyShadow()
        InProgressStepView.applyShadow()
        nextStepView.applyShadow()
    }

    private func setPreviousStep() {
        if let prev = AppContext.sharedAppContext.previousCompletedStep() {
            previousTitleLabel.text = prev.title
            previousStepView.isHidden = false
            previousStepButton.isUserInteractionEnabled = true
        } else {
            previousStepView.isHidden = true
            previousStepButton.isUserInteractionEnabled = false
        }
    }
    
    private func setInProgressStep() {
        if let current = AppContext.sharedAppContext.inProgressStep() {
            InProgressTitleLabel.text = current.title
        }
    }
    
    private func setNextStep() {
        if let next = AppContext.sharedAppContext.nextStep() {
            nextTitleLabel.text = next.title
        }
    }
    
    //MARK:- Outlet actions
    @IBAction func seeAllStepsAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func previousStepAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
        if let vc = AppContext.sharedAppContext.getViewControllerForStep(atIndex: AppContext.sharedAppContext.getIndexOfPreviousStep()!) {
            tabBarController?.selectedViewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func inProgressStepAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
        if let vc = AppContext.sharedAppContext.getViewControllerForStep(atIndex: AppContext.sharedAppContext.getIndexOfInProgressStep()!) {
            tabBarController?.selectedViewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func nextStepAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func getStartedAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as? ListTableViewCell {
            cell.configureCell(forIndexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth * 85.0 / 375.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            self.logAnalyticsEventsForActionForUserProperties(eventName: "dashboard_CRSCalculator", eventProperties: ["":""])
            let crsMainViewController = CRSMainViewController(nibName: "CRSMainViewController", bundle:nil)
            self.navigationController?.pushViewController(crsMainViewController, animated: true)
            break
        case 1:
            self.logAnalyticsEventsForActionForUserProperties(eventName: "dashboard_EEDraws", eventProperties: ["":""])
            let eeDrawMainViewController = EEDrawMainViewController(nibName: "EEDrawMainViewController", bundle:nil)
            self.navigationController?.pushViewController(eeDrawMainViewController, animated: true)
        case 2:
            self.logAnalyticsEventsForActionForUserProperties(eventName: "dashboard_Blogs", eventProperties: ["":""])
            let latestBlogViewController = LatestBlogViewController(nibName: "LatestBlogViewController", bundle:nil)
            latestBlogViewController.urlString = "https://treknation.ca/blogs/"
            latestBlogViewController.titleStringForController = "Latest Blogs"
            self.navigationController?.pushViewController(latestBlogViewController, animated: true)
        default:
            break
        }
    }
}
