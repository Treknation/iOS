//
//  LatestBlogViewController.swift
//  treknation-iOS
//
//  Created by Developer-iOS on 16/01/21.
//  Copyright © 2021 treknation. All rights reserved.
//

import UIKit
import WebKit

class LatestBlogViewController: TNBaseViewController {
    
    @IBOutlet weak var screenTitleLabel: UILabel! {
        didSet {
            screenTitleLabel.font = UIFont.ThinSemiBold18Font
            screenTitleLabel.textColor = .darkSlateBlue
        }
    }
    @IBOutlet weak var webviewContainerView: UIView!
    
    private var webView: WKWebView?
    var urlString = ""
    var titleStringForController = ""
    
//    override func loadView() {
//        webView = WKWebView()
//
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                setData()
        tabBarController?.tabBar.isHidden = true
        screenTitleLabel.text = titleStringForController
        webView = WKWebView()
        if let webview = webView {
            webview.frame = webviewContainerView.bounds
            webviewContainerView.addSubview(webview)
            
            if let url = URL(string: urlString) {
                let req = URLRequest(url: url)
                webview.load(req)
            }
        }
    }
    
    private func setData() {
    //    screenTitleLabel.text = "Latest Blogs"
    }
    
    @IBAction func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
