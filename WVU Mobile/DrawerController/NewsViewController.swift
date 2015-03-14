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
    var loading: UIActivityIndicatorView!
    var rControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "N E W S "
        
        /*
        Change back bar button to custom text, while preserving the back arrow.
        */
        let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        /*
        Loader
        */
        self.loading = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.size.width/2 - 10, self.view.frame.size.height/2 - 10, 20, 20))
        self.loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        self.loading.color = colors.prtGray3
        self.loading.startAnimating()
        self.view.addSubview(loading)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.loadRSS()
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupTableView()
            })
        })
    }
    
    func setupTableView(){
        /*
        Set up table view.
        */
        self.tableView = UITableView(frame: CGRectMake(-0.25, 64, self.view.bounds.width + 0.25, self.view.bounds.height-64), style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.rowHeight = 90.0
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        self.rControl = UIRefreshControl(frame: CGRectMake(0,100,self.view.bounds.width,70.0))
        self.rControl.addTarget(self, action: Selector("refresh"), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(rControl)
        self.rControl.layer.zPosition = self.rControl.layer.zPosition-1
    }
    
    func loadRSS(){
        //Setup RSS
        url = NSURL(string: "http://wvutoday.wvu.edu/n/rss")!
        var myParser : RSSParser = RSSParser.alloc().initWithURL(url) as RSSParser
        feed = myParser.feeds
    }
    
    // Reload JSON and data inside tables.
    func refresh(){
        self.loadRSS()
        self.tableView.reloadData()
        self.rControl.endRefreshing()
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
        
        var dateString = feed.objectAtIndex(indexPath.row).objectForKey("pubDate") as String
        
        var formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(name: "EST")
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss 'EST\n'"

        var date = formatter.dateFromString(dateString)
        
        formatter.dateStyle = NSDateFormatterStyle.FullStyle

        cell.textLabel?.textColor = colors.subtitleTextColor
        cell.textLabel?.text = formatter.stringFromDate(date!)
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 13)
        cell.textLabel?.numberOfLines = 1
    
        cell.detailTextLabel?.textColor = colors.textColor
        cell.detailTextLabel?.text = feed.objectAtIndex(indexPath.row).objectForKey("title") as? String
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-LightItalic", size: 16)
        cell.detailTextLabel?.numberOfLines = 3
        
        cell.layer.borderWidth = 0.25
        cell.layer.borderColor = colors.selectBlue.CGColor
        
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedFTitle: String = feed[indexPath.row].objectForKey("title") as String
        let selectedFContent: String = feed[indexPath.row].objectForKey("description") as String
        let selectedFURL: String = feed[indexPath.row].objectForKey("link") as String
        let selectedFDate: String = feed[indexPath.row].objectForKey("pubDate") as String
        
        // Instance of our feedpageviewcontrolelr
        let fpvc = FeedPageViewController()
        
        fpvc.selectedFeedTitle = selectedFTitle
        fpvc.selectedFeedFeedContent = selectedFContent
        fpvc.selectedFeedURL = selectedFURL
        fpvc.date = selectedFDate
        
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