//
//  EventPageVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/12/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class EventPageVC: MainViewController {
    
    var textView: UITextView!
    var titleView: UITextView!
    var dateView: UITextView!
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()
    var selectedFeedURL = String()
    var date: NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "E V E N T S"
        
        self.navigationController?.navigationBar.tintColor = self.colors.textColor
        
        self.view.backgroundColor = colors.menuViewColor
        
        titleView = UITextView(frame: CGRectMake(5, 0, self.view.bounds.width-10, self.view.bounds.height * 0.35))
        dateView = UITextView(frame: CGRectMake(5, self.view.bounds.height * 0.35, self.view.bounds.width-10, self.view.bounds.height * 0.1))
        textView = UITextView(frame: CGRectMake(5, self.view.bounds.height * 0.45, self.view.bounds.width-10, self.view.bounds.height * 0.55))
        
        titleView.editable = false
        titleView.text = "\(selectedFeedTitle)"
        titleView.backgroundColor = self.colors.menuViewColor
        titleView.textColor = self.colors.textColor
        titleView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateView.editable = false
        dateView.text = formatter.stringFromDate(date)
        dateView.backgroundColor = self.colors.menuViewColor
        dateView.textColor = self.colors.textColor
        dateView.font = UIFont(name: "HelveticaNeue", size: 14)
        
        textView.editable = false
        textView.text = "\(selectedFeedFeedContent)"
        textView.backgroundColor = self.colors.menuViewColor
        textView.textColor = self.colors.textColor
        textView.font = UIFont(name: "HelveticaNeue-LightItalic", size: 18)
        
        self.view.addSubview(titleView)
        self.view.addSubview(dateView)
        self.view.addSubview(textView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Web", style: UIBarButtonItemStyle.Plain, target: self, action: "loadWeb")
        self.navigationItem.rightBarButtonItem?.tintColor = colors.textColor
        
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