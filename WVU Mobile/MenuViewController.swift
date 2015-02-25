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
        
        self.view.tag = ViewTag.Menu.rawValue
        
        //setup table view 
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // UI Table View Protocols 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
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
        
        if self.selectedIndexPath == indexPath{
            cell.setHighlighted(true, animated: true)
        }else{
            cell.setHighlighted(false, animated: true)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndexPath = indexPath
                
        switch indexPath.row {
            case 0: // home
                let mainNavView = UINavigationController(rootViewController: MainViewController())
                
                self.evo_drawerController?.setCenterViewController(mainNavView, withCloseAnimation: true, completion: nil)
            case 1: // dining
                let diningNavView = UINavigationController(rootViewController: DiningViewController())
                //let diningView = DiningViewController()
                self.evo_drawerController?.setCenterViewController(diningNavView, withCloseAnimation: true, completion: nil)
                //self.navigationController?.pushViewController(diningView, animated: true)
            case 2: // prt
                let prtNavView = UINavigationController(rootViewController: PRTTableViewController())
                
                self.evo_drawerController?.setCenterViewController(prtNavView, withCloseAnimation: true, completion: nil)
            case 3: // buses
                let busesNavView = UINavigationController(rootViewController: BusesViewController())
                
                self.evo_drawerController?.setCenterViewController(busesNavView, withCloseAnimation: true, completion: nil)
            case 4: // maps
                let mapNavView = UINavigationController(rootViewController: MapsViewController())
                
                self.evo_drawerController?.setCenterViewController(mapNavView, withCloseAnimation: true, completion: nil)
            case 5: // sports
                let sportsNavView = UINavigationController(rootViewController: SportsViewController())
                
                self.evo_drawerController?.setCenterViewController(sportsNavView, withCloseAnimation: true, completion: nil)
            case 6: // news
                let newsNavView = UINavigationController(rootViewController: NewsViewController())
                
                self.evo_drawerController?.setCenterViewController(newsNavView, withCloseAnimation: true, completion: nil)
            case 7: // events
                let eventsNavView = UINavigationController(rootViewController: EventsViewController())
                
                self.evo_drawerController?.setCenterViewController(eventsNavView, withCloseAnimation: true, completion: nil)
            default:
                break
        }
    }
    
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.navigationController?.navigationBar.barTintColor = colors.navBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 30)!, NSForegroundColorAttributeName: colors.textColor]
        //self.tableView.reloadData()
        super.setUIColors()
    }
}