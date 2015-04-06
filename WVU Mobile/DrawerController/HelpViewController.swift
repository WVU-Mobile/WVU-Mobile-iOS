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
    
    var phoneNumbers: [[String]] = [["3042847522", "3042932677", "18009880096"],
                                    ["3042925100"],
                                    ["18007842433", "18002738255"],
                                    ["3042936997"],
                                    ["3042933792", "3042936924", "3042935590", "18009880096", "3042857200"]]
    
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
    
    // Call number stored in Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        alert(phoneNumbers[indexPath.section][indexPath.row])
        
        self.tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    // Alert so people don't fat finger it
    func alert(number: String) {
        var phoneNumber = number
        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to call this number?", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "Call", style: .Default) { (action) in
            if let url = NSURL(string: "tel://\(phoneNumber)") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 2
        }
        else if section == 3 {
            return 1
        }
        else if section == 4 {
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
            return "RAPE & DOMESTIC VIOLENCE"
        }
        else if section == 2 {
            return "SUICIDE PREVENTION"
        }
        else if section == 3 {
            return "COUNSELING & PSYCHOLOGICAL SERVICES"
        }
        else if section == 4 {
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
            return ""
        }
        else if section == 2 {
            return "If you or someone you know is feeling suicidal, these hotlines can provide assistance."
        }
        else if section == 3 {
            return "Provides a variety of psychological, psychiatric, and counseling services including: individual, couples, educational, and career counseling."
        }
        else {
            return ""
        }
    }
    
    // Format cells here
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        
        if indexPath.row == 0 && indexPath.section == 0 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Morgantown Police"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 284-7522"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 0 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "University Police"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-2677"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 2 && indexPath.section == 0 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "WVU Emergency"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-988-0096"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 1 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Information Center"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 292-5100"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 2 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "24/7 Hotline"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-784-2433"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 2 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Veterans Hotline"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-273-TALK" // 18002738255
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 3 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Carruth Center"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-6997"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 0 && indexPath.section == 4 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Environmental Health"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-3792"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 1 && indexPath.section == 4 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Health Sciences"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-6924"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 2 && indexPath.section == 4 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Faculty-Staff Assist."
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 293-5590"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 3 && indexPath.section == 4 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Parents Club"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "1-800-WVU-0096"
            cell.detailTextLabel?.textColor = colors.textColor
        }
        else if indexPath.row == 4 && indexPath.section == 4 {
            cell.selectionStyle = .Default
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Student Health"
            cell.textLabel?.textColor = colors.textColor
            cell.detailTextLabel?.text = "(304) 285-7200"
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
