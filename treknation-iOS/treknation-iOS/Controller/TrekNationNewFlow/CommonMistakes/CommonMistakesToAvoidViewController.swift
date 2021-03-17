//
//  CommonMistakesToAvoidViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 2/15/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

class CommonMistakesToAvoidViewController: TNBaseViewController {
    
    @IBOutlet weak var mistakeTableView: UITableView!
    @IBOutlet weak var screenTitleLabel: UILabel! {
           didSet {
               screenTitleLabel.font = UIFont.ThinSemiBold18Font
               screenTitleLabel.textColor = .darkSlateBlue
            screenTitleLabel.text = "Common mistakes to Avoid"
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mistakeTableView.register(UINib(nibName: MistakeTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: MistakeTableViewCell.cellIdentifier)
        mistakeTableView.rowHeight = UITableView.automaticDimension
        mistakeTableView.estimatedRowHeight = screenHeight * 50 / 667.0
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension CommonMistakesToAvoidViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension CommonMistakesToAvoidViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppContext.sharedAppContext.commonMistakesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MistakeTableViewCell.cellIdentifier, for: indexPath) as? MistakeTableViewCell {
            let mistakeObj = AppContext.sharedAppContext.commonMistakesData[indexPath.row]
            cell.configureCell(mistake: mistakeObj)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension CommonMistakesToAvoidViewController: MistakeDelegate {
    func didClickOnButton(mistake: CommonMistakeData) {
        mistake.isOpen = !mistake.isOpen
        mistakeTableView.reloadData()
    }
}
