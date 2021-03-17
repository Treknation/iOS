//
//  CustomTabbarController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 1/10/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit

extension UITabBarController: UITabBarControllerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        tabBar.tintColor = UIColor.darkSlateBlue
        tabBar.barTintColor = UIColor.lightBlue
        let dashboardViewController = DashboardViewController(nibName: "DashboardViewController", bundle:nil)
        let navgitaionController1 = UINavigationController(rootViewController: dashboardViewController)
        navgitaionController1.title = "Home"
        navgitaionController1.tabBarItem.selectedImage = UIImage.init(named: "iconHomeActive")
        navgitaionController1.tabBarItem.image = UIImage.init(named: "iconHomeInactive")
        var array = self.viewControllers
        array?.insert(navgitaionController1, at: 0)
        self.viewControllers = array
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navigationController = viewController as? UINavigationController, let viewController = navigationController.viewControllers.first else { return }
        
        if viewController.isKind(of: DashboardViewController.self) {
            
        } else if viewController.isKind(of: ViewController.self) {
            
        } else if viewController.isKind(of: MoreViewController.self) {
            guard let moreViewController = viewController as? MoreViewController else { return }
            
            moreViewController.logAnalyticsEventsForActionForUserProperties(eventName: "settings_menu", eventProperties: ["": ""])
        }
    }
}
