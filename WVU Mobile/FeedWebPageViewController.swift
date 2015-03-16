//
//  FeedWebPageViewController.swift
//  RSSwift
//
//  Created by Arled Kola on 27/10/2014.
//  Copyright (c) 2014 Arled. All rights reserved.
//

import UIKit

class FeedWebPageViewController: MainViewController {
    
    var url = ""
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = UIWebView(frame: self.view.bounds)
        
        url = url.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        url = url.stringByReplacingOccurrencesOfString("\n", withString: "", options: .LiteralSearch, range: nil)
        
        println(url)
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
