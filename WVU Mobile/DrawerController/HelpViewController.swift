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
        return 4
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        else if section == 1 {
            return 2
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 5
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
            return "SUICIDE PREVENTION"
        }
        else if section == 2 {
            return "COUNSELING AND PSYCHOLOGICAL SERVICES"
        }
        else if section == 3 {
            return "OTHER SERVICES"
        }
        else {
            return ""
        }
    }
    
    // Footer
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Students who are experiencing a life threatening emergency should always call 911."
        }
        else if section == 1 {
            return "If you or someone you know is feeling suicidal, these hotlines can provide assistance."
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
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "911"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "911"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Morgantown Police"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 284-7522"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 2 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "University Police"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-2677"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 3 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "WVU Emergency"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-988-0096"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "24/7 Hotline"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-784-2433"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Veterans Hotline"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-273-TALK"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 2 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Carruth Center"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "304-293-6997"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 3 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Environmental Health"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "304-293-3792"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 3 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Health Sciences"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "304-293-6924"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 2 && indexPath.section == 3 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Faculty-Staff Assist."
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "304-293-5590"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 3 && indexPath.section == 3 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Parents Club"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-WVU-0096"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 4 && indexPath.section == 3 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Student Health"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "304-285-7200"
            cell.detailTextLabel?.textColor = colors.textColor
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
