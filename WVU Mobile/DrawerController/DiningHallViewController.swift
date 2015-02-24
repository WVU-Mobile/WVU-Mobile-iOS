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
    var breakfastSection: NSArray!
    var healthyUBreakfastSection: NSArray!
    var lunchSection: NSArray!
    var healthyULunchSection: NSArray!
    var dinnerSection: NSArray!
    var healthyUDinnerSection: NSArray!
    
    override func viewDidLoad() {
        //JSON Objects
        var diningInfo = DiningJSON(ID: "1")
        
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
                return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = "bewbs"
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        
        cell.backgroundColor = colors.menuViewColor
        cell.textLabel?.textColor = colors.textColor
        
        return cell
    }
    
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "PRTViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "PRTViewController"
    }
    
    override func setUIColors() {
        self.view.backgroundColor = self.colors.mainViewColor
    }
}