//
//  MoreViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-27.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if indexPath.section == 0 {
            cell.textLabel?.text = "About Us"

        } else if indexPath.section == 1 {
            cell.textLabel?.text = "Coming soon"

        } else if indexPath.section == 2 {
            cell.textLabel?.text = "Feedback"

        } else if indexPath.section == 3 {
            cell.textLabel?.text = "Terms and Conditions"

        }
        else {
            cell.textLabel?.text = "Privacy Policy"
        }
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
        let overviewVC = DetailedViewController()
        self.navigationController?.pushViewController(overviewVC, animated: true)
           } else if indexPath.section == 1 {

           } else if indexPath.section == 2 {

           } else if indexPath.section == 3 {

           }
           else {
           }
    
    }
}
