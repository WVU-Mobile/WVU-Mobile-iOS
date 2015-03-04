//
//  NewsViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class NewsViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate {
    
    var tableView: UITableView!
    var feed : NSArray = []
    var url: NSURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "A L L  N E W S "
        
        /*
        Change back bar button to custom text, while preserving the back arrow.
        */
        let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        /*
        Set up table view.
        */
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.rowHeight = 80.0
        self.tableView.backgroundColor = colors.menuViewColor
        
        self.view.addSubview(self.tableView)
        
        self.loadRSS()
    }
    
    func loadRSS(){
        //Setup RSS
        url = NSURL(string: "http://wvutoday.wvu.edu/n/rss")!
        self.tableView.showsVerticalScrollIndicator = false
        var myParser : NewsRSSParser = NewsRSSParser.alloc().initWithURL(url) as NewsRSSParser
        feed = myParser.feeds
        
        tableView.reloadData()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
        
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
            reuseIdentifier: "cell")
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.backgroundColor = colors.menuViewColor
        
        cell.textLabel?.textColor = colors.textColor
        cell.textLabel?.text = feed.objectAtIndex(indexPath.row).objectForKey("title") as? String
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
    
        cell.detailTextLabel?.numberOfLines = 3
        cell.detailTextLabel?.textColor = colors.textColor
        cell.detailTextLabel?.text = feed.objectAtIndex(indexPath.row).objectForKey("description") as? String
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 13)
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedFTitle: String = feed[indexPath.row].objectForKey("title") as String
        let selectedFContent: String = feed[indexPath.row].objectForKey("description") as String
        let selectedFURL: String = feed[indexPath.row].objectForKey("link") as String
        
        // Instance of our feedpageviewcontrolelr
        let fpvc = FeedPageViewController()
        
        fpvc.selectedFeedTitle = selectedFTitle
        fpvc.selectedFeedFeedContent = selectedFContent
        fpvc.selectedFeedURL = selectedFURL
        
        self.navigationController?.pushViewController(fpvc, animated: true)
    }
    
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "NewsViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "NewsViewController"
    }
    
}