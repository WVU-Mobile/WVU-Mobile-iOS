//
//  DiningHallViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/21/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class DiningHallVC: MainViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuView = UITableView()
    var infoView: UIView!
    var map: MKMapView!
    var descriptionLabel: UILabel!
    var hoursLabel = UILabel()
    var hoursDetailLabel = UILabel()
    var rControl: UIRefreshControl!
    var infoButton: UIButton!
    var menuButton: UIButton!
    var diningInfo: DiningJSON!
    var loading: UIActivityIndicatorView!
    var menus = NSDictionary()
    var key = NSArray()
    
    
    override func viewDidLoad() {
        // loader
        self.navigationController?.navigationBar.tintColor = self.colors.textColor
        loading = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.size.width/2 - 10, self.view.frame.size.height/2 - 10, 20, 20))
        loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        loading.startAnimating()
        self.view.addSubview(loading)
        
        setUIColors()
        super.viewDidLoad()
    }
    
    func setupView() {
        self.evo_drawerController?.removeGestureRecognizers()
        
        /*
            Set up Menu view.
        */
        menuView = UITableView(frame: CGRectMake(0, 104, self.view.bounds.width, self.view.bounds.height - 104), style: UITableViewStyle.Plain)
        menuView.delegate = self
        menuView.dataSource = self
        menuView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        menuView.separatorStyle = .None
        menuView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0)
        menuView.backgroundColor = colors.menuViewColor
        menuView.showsVerticalScrollIndicator = false

        
        // Check if dining hall is closed
        if menus.count == 0{
            var closedLabel = UILabel(frame: CGRectMake(40, 40, self.view.bounds.width, (self.view.bounds.height - 40) * 0.5))
            closedLabel.text = "C L O S E D"
            closedLabel.textColor = colors.textColor
            menuView.addSubview(closedLabel)
        }
        
        /*
            Set up Info view.
        */
        infoView = UIView(frame: CGRectMake(0, 40, self.view.bounds.width, self.view.bounds.height - 40))
        
        map = MKMapView(frame: CGRectMake(0, 40, self.view.bounds.width, (self.view.bounds.height - 40) * 0.5))
        
        descriptionLabel = UILabel(frame: CGRectMake(0, (self.view.bounds.height - 40) * 0.5, self.view.bounds.width, (self.view.bounds.height - 40) * 0.15))
        descriptionLabel.backgroundColor = colors.prtGray2
        descriptionLabel.textAlignment = .Center
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        descriptionLabel.lineBreakMode = .ByWordWrapping
        descriptionLabel.numberOfLines = 0
        
        hoursLabel = UILabel(frame: CGRectMake(0, (self.view.bounds.height - 40) * 0.65, self.view.bounds.width, (self.view.bounds.height - 40) * 0.05))
        hoursLabel.text = "HOURS"
        hoursLabel.textAlignment = .Center
        hoursLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        
        hoursDetailLabel = UILabel(frame: CGRectMake(0, (self.view.bounds.height - 40) * 0.70, self.view.bounds.width, (self.view.bounds.height - 40) * 0.30))
        hoursDetailLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        hoursDetailLabel.lineBreakMode = .ByWordWrapping
        hoursDetailLabel.numberOfLines = 0
        hoursDetailLabel.textAlignment = .Center

        infoView.addSubview(map)
        infoView.addSubview(descriptionLabel)
        infoView.addSubview(hoursLabel)
        infoView.addSubview(hoursDetailLabel)
        
        /*
            Setup tab buttons.
        */
        infoButton = UIButton(frame: CGRectMake(0,64,(self.view.bounds.width/2),40))
        infoButton.setTitle("M E N U", forState: .Normal)
        infoButton.addTarget(self, action: "loadMenu", forControlEvents: .TouchUpInside)
        infoButton.backgroundColor = self.colors.prtGray3
        
        menuButton = UIButton(frame: CGRectMake(self.view.bounds.width/2,64,(self.view.bounds.width/2),40))
        menuButton.setTitle("I N F O", forState: .Normal)
        menuButton.addTarget(self, action: "loadInfo", forControlEvents: .TouchUpInside)
        menuButton.backgroundColor = self.colors.prtGray1
        
        self.view.addSubview(menuView)
        self.view.addSubview(infoButton)
        self.view.addSubview(menuButton)
        
        rControl = UIRefreshControl(frame: CGRectMake(0,100,self.view.bounds.width,70.0))
        rControl.addTarget(self, action: Selector("refresh"), forControlEvents: UIControlEvents.ValueChanged)
        menuView.addSubview(rControl)
        rControl.layer.zPosition = self.rControl.layer.zPosition-1
        
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: "loadInfo")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: "loadMenu")
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        
        infoView.addGestureRecognizer(rightSwipe)
        menuView.addGestureRecognizer(leftSwipe)
        
        setUIColors()
    }
    
    // Reload JSON and data inside tables.
    func refresh(){
        diningInfo.pullJSON()
        menuView.reloadData()
        rControl.endRefreshing()
    }
    
    func loadMenu(){
        infoView.removeFromSuperview()
        menuButton.backgroundColor = colors.prtGray3
        infoButton.backgroundColor = colors.prtGray1
        self.view.addSubview(menuView)
        self.view.addSubview(infoButton)
        self.view.addSubview(menuButton)
    }
    
    func loadInfo(){
        menuView.removeFromSuperview()
        menuButton.backgroundColor = colors.prtGray1
        infoButton.backgroundColor = colors.prtGray3
        self.view.addSubview(infoView)
        self.view.addSubview(infoButton)
        self.view.addSubview(menuButton)
    }
    
    // Return number of rows in each section of table.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (menus[key[section] as NSString] as NSArray).count
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menus.count
    }
    
    // Return height for header in section.
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    // Return header information for section.
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, 25))
        var label = UILabel(frame: CGRectMake(10, 0, self.view.bounds.width, 25))
        label.textColor = colors.textColor
        headerView.backgroundColor = colors.headerColor
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        
        label.text = key[section] as NSString
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    // Return height for row at index.
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.menuView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var array = (menus[key[indexPath.section] as NSString] as NSArray)
        cell.textLabel?.text = array[indexPath.row] as NSString
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        cell.backgroundColor = colors.mainViewColor
        cell.textLabel?.textColor = colors.textColor
        
        /*
        Turn off cell selction.
        */
        cell.userInteractionEnabled = false
        
        return cell
    }
    
    // Set UI colors.
    override func setUIColors() {
        loading.color = colors.loadingColor
        hoursLabel.backgroundColor = colors.headerColor
        hoursDetailLabel.backgroundColor = colors.mainViewColor
        hoursLabel.textColor = colors.textColor
        hoursDetailLabel.textColor = colors.textColor
        menuView.reloadData()
        super.setUIColors()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "DiningHallViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "DiningHallViewController"
    }
}
