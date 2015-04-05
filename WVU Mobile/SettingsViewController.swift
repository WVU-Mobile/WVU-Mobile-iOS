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
    
    var nightSwitch = UISwitch(frame: CGRectMake(150, 300, 0, 0))
    var prtSwitch = UISwitch(frame: CGRectMake(150, 300, 0, 0))
    
    let image = UIImage(named: "follow.png")
    var rickyButton = UIButton.buttonWithType(.Custom) as UIButton
    let kateButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let jeremyButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let coreyButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let thomasButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    
    override func viewDidLoad() {
        self.title = "Settings"
        
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
        
        // Set up Night Mode Switch
        nightSwitch.on = false
        nightSwitch.setOn(true, animated: false)
        nightSwitch.addTarget(self, action: "nightSwitchValueDidChange:", forControlEvents: .ValueChanged)
        
        // Set up PRT Switch
        prtSwitch.on = false
        prtSwitch.setOn(true, animated: false)
        prtSwitch.addTarget(self, action: "prtSwitchValueDidChange:", forControlEvents: .ValueChanged)
        
        // Set up Ricky Button
        rickyButton.frame = CGRectMake(100, 100, 100, 40)
        rickyButton.setBackgroundImage(image, forState: UIControlState.Normal)
        rickyButton.addTarget(self, action: "buttonAction:", forControlEvents:.TouchUpInside)
        
        // Set up Kate Button
        kateButton.frame = CGRectMake(100, 100, 100, 40)
        kateButton.setImage(image, forState: .Normal)
        kateButton.addTarget(self, action: "buttonAction:", forControlEvents:.TouchUpInside)
        
        // Set up Jeremy Button
        jeremyButton.frame = CGRectMake(100, 100, 100, 40)
        jeremyButton.setImage(image, forState: .Normal)
        jeremyButton.addTarget(self, action: "buttonAction:", forControlEvents:.TouchUpInside)
        
        // Set up Corey Button
        coreyButton.frame = CGRectMake(100, 100, 100, 40)
        coreyButton.setImage(image, forState: .Normal)
        coreyButton.addTarget(self, action: "buttonAction:", forControlEvents:.TouchUpInside)
        
        // Set up Thomas Button
        thomasButton.frame = CGRectMake(100, 100, 100, 40)
        thomasButton.setImage(image, forState: .Normal)
        thomasButton.addTarget(self, action: "buttonAction:", forControlEvents:.TouchUpInside)
        
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
        return 2
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 5
        }
        else {
            return 2
        }
    }
    
    // Header
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else if section == 1{
            return "CREDITS"
        }
        else {
            return ""
        }
    }
    
    // Footer
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Change the first screen that loads to the PRT Status for quick access."
        }
        else if section == 1 {
            return "If you would like to see more from us, please follow us on Twitter!"
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
            cell.textLabel?.text = "Night Mode"
            cell.accessoryView = nightSwitch
        }
        else if indexPath.row == 1 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "PRT Status Default"
            cell.accessoryView = prtSwitch
        }
        else if indexPath.row == 0 && indexPath.section == 1 {
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Kate"
            cell.accessoryView = kateButton
        }
        else if indexPath.row == 1 && indexPath.section == 1 {
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Ricky"
            cell.accessoryView = rickyButton
        }
        else if indexPath.row == 2 && indexPath.section == 1 {
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Jeremy"
            cell.accessoryView = jeremyButton
        }
        else if indexPath.row == 3 && indexPath.section == 1 {
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Corey"
            cell.accessoryView = coreyButton
        }
        else if indexPath.row == 4 && indexPath.section == 1 {
            cell.textLabel?.textColor = colors.textColor
            // cell.backgroundColor = colors.textColor   <- Need new color **
            cell.textLabel?.text = "Thomas"
            cell.accessoryView = thomasButton
        }
        
        return cell
    }
    
    // Set UI Colors
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
