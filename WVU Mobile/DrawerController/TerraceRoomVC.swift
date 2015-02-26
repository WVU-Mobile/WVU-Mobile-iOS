//
//  TerraceRoomVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class TerraceRoomVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    var lunchSection: NSMutableArray!
    var healthyULunchSection: NSMutableArray!
    var dinnerSection: NSMutableArray!
    var healthyUDinnerSection: NSMutableArray!
    
    override func viewDidLoad() {
        
        //JSON Objects
        diningInfo = DiningJSON(ID: "5")
        
        self.title = "Terrace Room"
        
        self.lunchSection = diningInfo.lunchSection
        self.healthyULunchSection = diningInfo.healthyULunchSection
        self.dinnerSection = diningInfo.dinnerSection
        self.healthyUDinnerSection = diningInfo.healthyUDinnerSection
        
        self.setupView()
        
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
        
        /*
            Setup info labels
        */
        self.descriptionLabel.text = "This is the Terrace Room"
        self.hoursDetailLabel.text = "MONDAY-SATURDAY 7AM-11PM"
        
    }
    
    // Return number of rows in each section of table.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return lunchSection.count
        case 1:
            return healthyULunchSection.count
        case 2:
            return dinnerSection.count
        case 3:
            return healthyUDinnerSection.count
        default:
            return 1
        }
    }
    
    // Return number of sections in table view.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    // Return header information for section.
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, 25))
        var label = UILabel(frame: CGRectMake(10, 0, self.view.bounds.width, 25))
        label.textColor = colors.goldColor
        headerView.backgroundColor = colors.darkBlueColor
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        
        switch section {
        case 0:
            label.text = "LUNCH"
        case 1:
            label.text = "HEALTHY \"U\" LUNCH"
        case 2:
            label.text = "DINNER"
        case 3:
            label.text = "HEALTHY \"U\" DINNER"
        default:
            label.text = "ERROR"
        }
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    // Return cell for row at index.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.menuView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = self.lunchSection[indexPath.row] as? String
        case 1:
            cell.textLabel?.text = self.healthyULunchSection[indexPath.row] as? String
        case 2:
            cell.textLabel?.text = self.dinnerSection[indexPath.row] as? String
        case 3:
            cell.textLabel?.text = self.healthyUDinnerSection[indexPath.row] as? String
        default:
            cell.textLabel?.text = "error"
        }
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        cell.backgroundColor = colors.blackColor
        cell.textLabel?.textColor = colors.goldColor
        
        /*
        Turn off cell selction.
        */
        cell.userInteractionEnabled = false
        
        return cell
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "TerraceRoomVC"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "TerraceRoomVC"
    }
    
}
