//
//  SettingsViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 4/3/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class SettingsViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var nightSwitch = UISwitch(frame:CGRectMake(150, 300, 0, 0))
    var prtSwitch = UISwitch(frame:CGRectMake(150, 300, 0, 0))
    
    override func viewDidLoad() {
        self.title = "Settings"
        
        /*
        Change back bar button to custom text, while preserving the back arrow.
        */
        let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        /*
        Set up table view.
        */
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.separatorStyle = .None
        tableView.rowHeight = 43.0
        tableView.backgroundColor = colors.menuViewColor
        tableView.showsVerticalScrollIndicator = false
        
        // Set up Night Mode Switch
        nightSwitch.on = false
        nightSwitch.setOn(true, animated: false)
        nightSwitch.addTarget(self, action: "nightSwitchValueDidChange:", forControlEvents: .ValueChanged)
        
        // Set up PRT Switch
        prtSwitch.on = false
        prtSwitch.setOn(true, animated: false)
        prtSwitch.addTarget(self, action: "prtSwitchValueDidChange:", forControlEvents: .ValueChanged)
        
        self.view.addSubview(self.tableView)
        
        setUIColors()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        self.setupGesture()
    }
    
    // Functionality for Night Mode Switch
    func nightSwitchValueDidChange(sender: UISwitch!) {
        if (sender.on == true) {
            
        }
        else {
            
        }
    }
    
    // Functionality for PRT Switch
    func prtSwitchValueDidChange(sender: UISwitch!) {
        if (sender.on == true) {
            
        }
        else {
            
        }
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Change the first screen that loads to the PRT Status for quick access."
    }
    
    // Format cells here
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        
        if indexPath.row == 0 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Night Mode"
            cell.accessoryView = nightSwitch
        }
        else if indexPath.row == 1 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "PRT Status Default"
            cell.accessoryView = prtSwitch
        }
        
        return cell
    }
    
    // HOW MANY ROWS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.reloadData()
        super.setUIColors()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "SettingsViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "SettingsViewController"
    }
}
