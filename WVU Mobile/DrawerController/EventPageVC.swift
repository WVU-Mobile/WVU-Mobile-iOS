//
//  EventPageVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/12/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class EventPageVC: ViewController {
    
    var textView: UITextView!
    var titleView: UITextView!
    var dateView: UITextView!
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()
    var selectedFeedURL = String()
    var date: NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "EVENTS"
        
        self.navigationController?.navigationBar.tintColor = self.colors.goldColor
        
        self.view.backgroundColor = colors.blackColor
        
        titleView = UITextView(frame: CGRectMake(5, 0, self.view.bounds.width-10, self.view.bounds.height * 0.35))
        dateView = UITextView(frame: CGRectMake(5, self.view.bounds.height * 0.35, self.view.bounds.width-10, self.view.bounds.height * 0.1))
        textView = UITextView(frame: CGRectMake(5, self.view.bounds.height * 0.45, self.view.bounds.width-10, self.view.bounds.height * 0.55))
        
        titleView.editable = false
        titleView.text = "\(selectedFeedTitle)"
        titleView.backgroundColor = self.colors.blackColor
        titleView.textColor = self.colors.goldColor
        titleView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateView.editable = false
        dateView.text = formatter.stringFromDate(date)
        dateView.backgroundColor = self.colors.blackColor
        dateView.textColor = self.colors.goldColor
        dateView.font = UIFont(name: "HelveticaNeue", size: 14)
        
        textView.editable = false
        textView.text = "\(selectedFeedFeedContent)"
        textView.backgroundColor = self.colors.blackColor
        textView.textColor = self.colors.goldColor
        textView.font = UIFont(name: "HelveticaNeue-LightItalic", size: 18)
        
        self.view.addSubview(titleView)
        self.view.addSubview(dateView)
        self.view.addSubview(textView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Web", style: UIBarButtonItemStyle.Plain, target: self, action: "loadWeb")
        self.navigationItem.rightBarButtonItem?.tintColor = colors.goldColor
        
    }
    
    func loadWeb(){
        var feedPage = FeedWebPageViewController()
        feedPage.url = selectedFeedURL
        self.navigationController?.pushViewController(feedPage, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}