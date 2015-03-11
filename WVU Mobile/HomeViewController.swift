//
//  HomeViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class HomeViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var titles = ["NEWS", "PRT STATUS", "DINING HALL", "BUSES"]
    
    override func viewDidLoad() {
        self.title = "H O M E"
        /*
        Set up table view.
        */
        self.tableView = UITableView(frame: CGRectMake(0,64,self.view.bounds.width,self.view.bounds.height-64), style: UITableViewStyle.Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.backgroundColor = colors.homeBlackColor
        
        var img = UIImage(named: "woodburn.jpg")
        var imgView = UIImageView(frame: self.view.bounds)
        imgView.image = img
        imgView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.view.addSubview(imgView)
        
        /*
        Remove vertical scroll bar.
        */
        self.tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
                
        super.viewDidLoad()
    }
    
    // Set UI colors.
    override func setUIColors() {
        super.setUIColors()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return titles.count
    }
    
    // Return height for header in section.
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        
        var pageView = UIPageControl(frame: CGRectMake(0, 130, cell.bounds.width, 20))
        pageView.numberOfPages = 3
        cell.addSubview(pageView)
        
        cell.backgroundColor = colors.homeGrayColor
        cell.textLabel?.textColor = colors.textColor
        
        return cell
    }
    
    // Return header information for section.
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, 25))
        var label = UILabel(frame: CGRectMake(10, 0, self.view.bounds.width, 25))
        label.textColor = colors.goldColor
        headerView.backgroundColor = colors.homeDarkBlueColor
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        
        label.text = titles[section]
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "HomeViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "HomeViewController"
    }
    
}
