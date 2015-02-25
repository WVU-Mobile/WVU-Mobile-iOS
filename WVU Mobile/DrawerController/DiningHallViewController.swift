//
//  DiningHallViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/21/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class DiningHallViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var breakfastSection: NSMutableArray!
    var healthyUBreakfastSection: NSMutableArray!
    var lunchSection: NSMutableArray!
    var healthyULunchSection: NSMutableArray!
    var dinnerSection: NSMutableArray!
    var healthyUDinnerSection: NSMutableArray!
    
    override func viewDidLoad() {
        
        //JSON Objects
        var diningInfo = DiningJSON(ID: "1")
        
        self.breakfastSection = diningInfo.breakfastSection
        self.healthyUBreakfastSection = diningInfo.healthyUBreakfastSection
        self.lunchSection = diningInfo.lunchSection
        self.healthyULunchSection = diningInfo.healthyULunchSection
        self.dinnerSection = diningInfo.dinnerSection
        self.healthyUDinnerSection = diningInfo.healthyUDinnerSection
        
        /*
            Set up table view.
        */
        self.tableView = UITableView(frame: CGRectMake(0, 40, self.view.bounds.width, self.view.bounds.height - 40), style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0)
        
        self.view.addSubview(self.tableView)
        
        self.navigationController?.navigationBar.tintColor = self.colors.goldColor
        
        var infoButton = UIButton(frame: CGRectMake(0,64,(self.view.bounds.width/2)-1,40))
        infoButton.setTitle("INFO", forState: .Normal)
        infoButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        infoButton.backgroundColor = self.colors.prtGray1
        
        var menuButton = UIButton(frame: CGRectMake(self.view.bounds.width/2,64,(self.view.bounds.width/2)+1,40))
        menuButton.setTitle("MENU", forState: .Normal)
        menuButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        menuButton.backgroundColor = self.colors.prtGray1
        
        self.view.addSubview(infoButton)
        self.view.addSubview(menuButton)
        
        super.viewDidLoad()
    }
    
    // Return number of rows in each section of table.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return breakfastSection.count
            case 1:
                return healthyUBreakfastSection.count
            case 2:
                return lunchSection.count
            case 3:
                return healthyULunchSection.count
            case 4:
                return dinnerSection.count
            case 5:
                return healthyUDinnerSection.count
            default:
                return 1
        }
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    // Return height for header in section.
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    // Return header information for section.
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, 25))
        var label = UILabel(frame: CGRectMake(10, 0, self.view.bounds.width, 25))
        label.textColor = colors.goldColor
        headerView.backgroundColor = colors.darkBlueColor
        
        switch section {
            case 0:
                label.text = "BREAKFAST"
            case 1:
                label.text = "HEALTHY \"U\" BREAKFAST"
            case 2:
                label.text = "LUNCH"
            case 3:
                label.text = "HEALTHY \"U\" LUNCH"
            case 4:
                label.text = "DINNER"
            case 5:
                label.text = "HEALTHY \"U\" DINNER"
            default:
                label.text = "ERROR"
        }
        
        headerView.addSubview(label)

        return headerView
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        switch indexPath.section {
            case 0:
                println("debug")
                cell.textLabel?.text = self.breakfastSection[indexPath.row] as? String
            case 1:
                cell.textLabel?.text = self.healthyUBreakfastSection[indexPath.row] as? String
            case 2:
                cell.textLabel?.text = self.lunchSection[indexPath.row] as? String
            case 3:
                cell.textLabel?.text = self.healthyULunchSection[indexPath.row] as? String
            case 4:
                cell.textLabel?.text = self.dinnerSection[indexPath.row] as? String
            case 5:
                cell.textLabel?.text = self.healthyUDinnerSection[indexPath.row] as? String
            default:
                cell.textLabel?.text = "error"
        }
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        cell.backgroundColor = colors.blackColor
        cell.textLabel?.textColor = colors.textColor
        
        //println(indexPath.section)
        
        return cell
    }
    
    // Pop view controller off navigation stack.
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // Set UI colors.
    override func setUIColors() {
        self.view.backgroundColor = self.colors.mainViewColor
        self.tableView.backgroundColor = self.colors.blackColor
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
