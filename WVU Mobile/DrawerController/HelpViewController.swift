//
//  HelpViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 4/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class HelpViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        self.title = "Help"
        
        /*
        Set up table view.
        */
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.rowHeight = 43.0
        tableView.backgroundColor = colors.menuViewColor
        tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        setUIColors()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        self.setupGesture()
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else if section == 1 {
            return 2
        }
        else {
            return 0
        }
    }
    
    // Header
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "EMERGENCY"
        }
        else if section == 1 {
            return "HOTLINES"
        }
        else {
            return ""
        }
    }
    
    // Footer
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else if section == 1 {
            return ""
        }
        else {
            return ""
        }
    }
    
    // Format cells here
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        
        if indexPath.row == 0 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Morgantown Police"
        }
        else if indexPath.row == 1 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "WVU Police"
        }
        else if indexPath.row == 0 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Suicide Hotline"
        }
        else if indexPath.row == 1 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Suicide Hotline"
        }
        
        return cell
    }
    
    // Set UI Colors.
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.reloadData()
        super.setUIColors()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "HelpViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "HelpViewController"
    }
}
