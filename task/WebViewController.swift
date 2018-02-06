//
//  WebViewController.swift
//  task
//
//  Created by khaled nazlawy on 2/6/18.
//  Copyright © 2018 khaled nazlawy. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var UrlAPI:Repository?
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = UrlAPI?.html_url!
        let url_html = URL(string: url!)
        let request = URLRequest(url: url_html!)
        webView.load(request)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
