//
//  WebViewViewController.swift
//  treknation-iOS
//
//  Created by nitesh dulal on 2020-08-30.
//  Copyright © 2020 treknation. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!

    @IBOutlet weak var webView: WKWebView!
    var linkURL : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let link = URL(string:self.linkURL)!
        let request = URLRequest(url: link)
        self.webView.load(request)
        
    }
    func setLinkURL(link: String) {
        self.linkURL = link
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
