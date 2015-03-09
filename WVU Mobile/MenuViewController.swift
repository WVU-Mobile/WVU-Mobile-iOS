//
//  MenuViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/30/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MenuViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var selectedIndexPath = NSIndexPath(forRow: 0, inSection: 0)

    var labels: [String] = ["H O M E",
                            "D I N I N G",
                            "P R T",
                            "B U S E S",
                            "M A P",
                            "S P O R T S",
                            "N E W S",
                            "E V E N T S"]
    
    override func viewDidLoad() {
        self.title = "M E N U"
        
        /* 
            Set up table view.
        */
        self.tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        self.tableView.separatorStyle = .None
        //self.tableView.rowHeight = 50.0

        
        self.view.addSubview(self.tableView)
                
        self.setUIColors()
        
        super.viewDidLoad()
    }
    
    // Left will appear.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Left did appear.
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Left will disappear.
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // Left did disappear.
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // UI Table View Protocols 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
    // Return row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.labels[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 21)
    
        //selected background view color
        var bgColorView = UIView()
        bgColorView.backgroundColor = colors.selectColor
        cell.selectedBackgroundView = bgColorView
        
        cell.backgroundColor = colors.menuViewColor
        cell.textLabel?.textColor = colors.textColor
        
        if self.selectedIndexPath == indexPath {
            cell.setHighlighted(true, animated: true)
        }
        else {
            cell.setHighlighted(false, animated: true)
        }
        return cell
    }
    
    // Detect row at index press and trigger view load.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndexPath = indexPath
                
        switch indexPath.row {
            
            // HOME
            case 0:
                let mainNavView = UINavigationController(rootViewController: HomeViewController())
                self.evo_drawerController?.setCenterViewController(mainNavView, withCloseAnimation: true, completion: nil)
            
            // DINING
            case 1:
                let diningNavView = UINavigationController(rootViewController: DiningViewController())
                self.evo_drawerController?.setCenterViewController(diningNavView, withCloseAnimation: true, completion: nil)
            
            // PRT
            case 2:
                let prtNavView = UINavigationController(rootViewController: PRTTableViewController())
                self.evo_drawerController?.setCenterViewController(prtNavView, withCloseAnimation: true, completion: nil)
            
            // BUSES
            case 3:
                let busesNavView = UINavigationController(rootViewController: BusesViewController())
                self.evo_drawerController?.setCenterViewController(busesNavView, withCloseAnimation: true, completion: nil)
            
            // MAPS
            case 4:
                let mapNavView = UINavigationController(rootViewController: MapsViewController())
                self.evo_drawerController?.setCenterViewController(mapNavView, withCloseAnimation: true, completion: nil)
            
            // SPORTS
            case 5:
                let sportsNavView = UINavigationController(rootViewController: SportsViewController())
                self.evo_drawerController?.setCenterViewController(sportsNavView, withCloseAnimation: true, completion: nil)
            
            // NEWS
            case 6:
                let newsNavView = UINavigationController(rootViewController: NewsViewController())
                self.evo_drawerController?.setCenterViewController(newsNavView, withCloseAnimation: true, completion: nil)
            
            // EVENTS
            case 7:
                let eventsNavView = UINavigationController(rootViewController: EventsViewController())
                self.evo_drawerController?.setCenterViewController(eventsNavView, withCloseAnimation: true, completion: nil)
            default:
                break
        }
    }
    
    // Set UI colors.
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.navigationController?.navigationBar.barTintColor = colors.navBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 30)!, NSForegroundColorAttributeName: colors.textColor]
        //self.tableView.reloadData()
        super.setUIColors()
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "MenuViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MenuViewController"
    }
}