//
//  PRTTableViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/20/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class PRTTableViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var backgroundColor: UIColor!
    var image: UIImage!
    var statusText: String!
    var statusTextColor: UIColor!
    var prtInfo: PRTJSON!
    var rControl: UIRefreshControl!
    
    var dimensions: [CGFloat] = [
        0.35,
        0.12,
        0.31,
        0.22]
    
    override func viewDidLoad() {
        self.title = "PRT"
        //JSON Objects
        self.prtInfo = PRTJSON()
        
        //Switch view elements based on PRT status
        switch self.prtInfo.status{
            //PRT Okay
        case "1":
            backgroundColor = self.colors.greenColor
            image = UIImage(named: "check.png")!
            statusText = "O N L I N E"
            statusTextColor = self.colors.greenColor
            //PRT Partially down
        case "2", "5", "6", "10":
            backgroundColor = self.colors.orangeColor
            image = UIImage(named: "yield.png")!
            statusText = "W A R N I N G"
            statusTextColor = self.colors.orangeColor
            //PRT Out of Service
        case "4", "8", "9":
            backgroundColor = self.colors.redColor
            image = UIImage(named: "stop.png")!
            statusText = "O F F L I N E"
            statusTextColor = self.colors.pinkColor
            //Default to 1
        default:
            backgroundColor = self.colors.greenColor
            image = UIImage(named: "check.png")!
            statusText = "O N L I N E"
            statusTextColor = self.colors.greenColor
        }
        
        //setup table view
        self.tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0)
        self.tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        self.navigationController?.navigationBar.translucent = false
        self.rControl = UIRefreshControl(frame: CGRectMake(0,100,self.view.bounds.width,70.0))
        self.rControl.addTarget(self, action: Selector("refresh"), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(rControl)
        self.rControl.layer.zPosition = self.rControl.layer.zPosition-1
        
        super.viewDidLoad()
    }
    
    func refresh(){
        self.prtInfo.pullJSON()
        self.tableView.reloadData()
        self.rControl.endRefreshing()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "MenuViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MenuViewController"
    }
    
    // UI Table View Protocols
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dimensions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

        switch indexPath.row{
            case 0:
                cell.backgroundColor = self.backgroundColor
                //image
                var imageView = UIImageView(frame: CGRectMake(self.view.bounds.width/2 - (((self.view.bounds.height - 64) * 0.31)/2), ((self.view.bounds.height - 64) * 0.02) , (self.view.bounds.height - 64) * 0.31, (self.view.bounds.height - 64) * 0.31))
                imageView.image = self.image
                cell.addSubview(imageView)
            case 1:
                //status
                cell.backgroundColor = self.colors.prtGray1
                cell.textLabel?.text = statusText
                cell.textLabel?.textColor = statusTextColor
                cell.textLabel?.textAlignment = .Center
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 40)
            case 2:
                //message
                cell.backgroundColor = self.colors.darkBlueColor
                cell.textLabel?.text = prtInfo.message
                cell.textLabel?.textColor = self.colors.goldColor
                cell.textLabel?.textAlignment = .Center
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
                cell.textLabel?.lineBreakMode = .ByWordWrapping
                cell.textLabel?.numberOfLines = 0
            case 3:
                //hours
                cell.backgroundColor = self.colors.blackColor
                cell.textLabel?.text = "Monday to Friday 6:30 AM to 10:15 PM \nSaturday 9:30 AM to 5 PM \nSunday CLOSED"
                cell.textLabel?.textColor = self.colors.goldColor
                cell.textLabel?.textAlignment = .Center
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
                cell.textLabel?.lineBreakMode = .ByWordWrapping
                cell.textLabel?.numberOfLines = 0
            default:
                break
        }
        cell.userInteractionEnabled = false

        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.dimensions[indexPath.row] * ((self.view.bounds.height)))
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)

    }
    
    override func setUIColors() {
        super.setUIColors()
        self.tableView.backgroundColor = self.colors.blackColor
    }
}