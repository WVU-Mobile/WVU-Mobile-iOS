//
//  EventsViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class EventsViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate {
    
    var tableView: UITableView!
    var feed : NSArray = []
    var url: NSURL = NSURL()
    var loading: UIActivityIndicatorView!
    var rControl: UIRefreshControl!
    var rssURL = ""
    var events: Events!
    var selectedEvents: NSMutableArray!
    
    //toolbar
    var datePicker: UIView!
    var date = NSDate()
    var formatter = NSDateFormatter()
    var dayButton: UIButton!
    var backButton: UIButton!
    var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "E V E N T S"
        rssURL = "https://cal.wvu.edu/RSSSyndicator.aspx?category=&location=&type=N&binary=Y"
        
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
        
        createToolbar()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.events = Events()
            //self.events.pullRSS()
            self.selectedEvents = self.events.eventsOnDay(NSDate())
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.setupView()
                self.loading.stopAnimating()
            })
        })
    }
    
    func setupView(){
        /*
        Set up table view.
        */
        self.tableView = UITableView(frame: CGRectMake(-0.25, 110, self.view.bounds.width + 0.25, self.view.bounds.height-110), style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.rowHeight = 100.0
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.showsVerticalScrollIndicator = false
        
        self.dayButton.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        self.forwardButton.addTarget(self, action: "forward", forControlEvents: UIControlEvents.TouchUpInside)
        self.backButton.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(self.tableView)
        
        var error = UILabel(frame: CGRectMake(self.view.bounds.width/2 - 125, self.view.bounds.height/2, 250, 40))
        self.view.addSubview(error)
        if selectedEvents.count == 0 {
            error.text = "There are no events to display."
            error.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
            error.textColor = colors.goldColor
            error.textAlignment = .Center
        } else {
            error.text = ""
        }
        
        self.rControl = UIRefreshControl(frame: CGRectMake(0,100,self.view.bounds.width,70.0))
        self.rControl.addTarget(self, action: Selector("refresh"), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(rControl)
        self.rControl.layer.zPosition = self.rControl.layer.zPosition-1
    }
    
    func refresh(){
        self.rControl.endRefreshing()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedEvents.count
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
        
        var event = selectedEvents.objectAtIndex(indexPath.row) as EventObject
        
        cell.backgroundColor = self.colors.blackColor
        cell.textLabel?.textColor = self.colors.darkGoldColor
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 13)
        cell.textLabel?.numberOfLines = 2

        
        cell.detailTextLabel?.text = event.title
        cell.detailTextLabel?.textColor = self.colors.goldColor
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-LightItalic", size: 16)
        cell.detailTextLabel?.numberOfLines = 3
        
        cell.textLabel?.text = "9:00AM - 1:00PM"
        
        cell.layer.borderWidth = 0.25
        cell.layer.borderColor = colors.selectBlueColor.CGColor
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var event = selectedEvents.objectAtIndex(indexPath.row) as EventObject
        
        // Instance of our feedpageviewcontrolelr
        let fpvc = EventPageVC()
        
        event.decode()
        
        fpvc.selectedFeedTitle = event.title
        fpvc.selectedFeedFeedContent = event.descrip
        fpvc.selectedFeedURL = event.link
        fpvc.date = event.startDate
        
        self.navigationController?.pushViewController(fpvc, animated: true)
        self.tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    func createToolbar(){
        self.datePicker = UIView(frame: CGRectMake(0, 64, self.view.bounds.width, 46))
        self.datePicker.backgroundColor = colors.selectBlueColor
        
        setDateButton()
        
        self.backButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.backButton.frame = CGRectMake(self.view.bounds.width/4 - 25, 5, 50, 36)
        self.backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(colors.goldColor, forState: .Normal)
        backButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        self.backButton.backgroundColor = colors.darkBlueColor
        
        self.forwardButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.forwardButton.frame = CGRectMake((self.view.bounds.width/4) * 3 - 25, 5, 50, 36)
        self.forwardButton.setTitle(">", forState: .Normal)
        forwardButton.setTitleColor(colors.goldColor, forState: .Normal)
        forwardButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        self.forwardButton.backgroundColor = colors.darkBlueColor
        
        
        datePicker.addSubview(backButton)
        datePicker.addSubview(forwardButton)
        self.view.addSubview(datePicker)
    }
    
    func setDateButton(){
        self.formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        self.dayButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.dayButton.frame = CGRectMake(self.view.bounds.width/2 - 50, 5, 100, 36)
        self.dayButton.backgroundColor = colors.darkBlueColor
        dayButton.setTitle(formatter.stringFromDate(date), forState: .Normal)
        dayButton.setTitleColor(colors.goldColor, forState: .Normal)
        dayButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
        
        datePicker.addSubview(dayButton)
    }
    
    func click(){
        date = NSDate()
        setDateButton()
        
        selectedEvents = events.eventsOnDay(date)
        setupView()
    }
    

    func back(){
        let calendar = NSCalendar.currentCalendar()
        let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: date, options: nil)
        date = yesterday!
        setDateButton()
        
        selectedEvents = events.eventsOnDay(date)
        setupView()
    }
    
    func forward(){
        let calendar = NSCalendar.currentCalendar()
        let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: 1, toDate: date, options: nil)
        date = yesterday!
        setDateButton()

        selectedEvents = events.eventsOnDay(date)
        setupView()
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "EventsViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "EventsViewController"
    }
}
