//
//  FeedWebPageViewController.swift
//  RSSwift
//
//  Created by Arled Kola on 27/10/2014.
//  Copyright (c) 2014 Arled. All rights reserved.
//

import UIKit

class WebPageViewController: MainViewController {
    
    var url = ""
    var webView: UIWebView!
    
    override func viewDidLoad() {
        webView = UIWebView(frame: self.view.bounds)
        
        url = url.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        url = url.stringByReplacingOccurrencesOfString("\n", withString: "", options: .LiteralSearch, range: nil)
        
        println(url)
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        
        self.view.addSubview(webView)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.evo_drawerController?.removeGestureRecognizers()
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.evo_drawerController?.setupGestureRecognizers()
        super.viewWillDisappear(true)
    }
}
