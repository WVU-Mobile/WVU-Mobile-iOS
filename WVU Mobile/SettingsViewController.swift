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
    //var prtSwitch = UISwitch(frame: CGRectMake(150, 300, 0, 0))
    
    let image = UIImage(named: "follow.png")
    var rickyButton = UIButton.buttonWithType(.Custom) as! UIButton
    let kateButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    let jeremyButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    let coreyButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    let thomasButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    
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
        self.nightSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey("nightMode")
        self.nightSwitch.setOn(NSUserDefaults.standardUserDefaults().boolForKey("nightMode"), animated: NSUserDefaults.standardUserDefaults().boolForKey("nightMode"))
        self.nightSwitch.addTarget(self, action: "nightSwitchValueDidChange:", forControlEvents: .ValueChanged)
        self.nightSwitch.onTintColor = colors.switchColor
        
        /*
        // Set up PRT Switch
        self.prtSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey("trueOrFalse")
        self.prtSwitch.setOn(NSUserDefaults.standardUserDefaults().boolForKey("trueOrFalse"), animated: NSUserDefaults.standardUserDefaults().boolForKey("trueOrFalse"))
        self.prtSwitch.addTarget(self, action: "prtSwitchValueDidChange:", forControlEvents: .ValueChanged)
        self.prtSwitch.onTintColor = colors.switchColor
        */

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
        colors.toggleNightMode()
        colors.toggleUIColors()
        self.setUIColors()
    }
    
    // Functionality for PRT Switch
    func prtSwitchValueDidChange(sender: UISwitch!){
        NSUserDefaults.standardUserDefaults().setBool(!NSUserDefaults.standardUserDefaults().boolForKey("trueOrFalse"), forKey: "trueOrFalse")
    }
    
    // Functionality of the Buttons
    func buttonAction (sender: UIButton) {
        if sender == rickyButton {
            if let url = NSURL(string: "twitter://rickydeal11") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if sender == kateButton {
            if let url = NSURL(string: "twitter://kateinthecosmos") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if sender == jeremyButton {
            if let url = NSURL(string: "https://twitter.com/jdole21?lang=en") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if sender == coreyButton {
            if let url = NSURL(string: "https://twitter.com/coreyrexroad?lang=en") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else if sender == thomasButton {
            if let url = NSURL(string: "https://twitter.com/tpalmer345?lang=en") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 5
        }
        else {
            return 0
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
            //return "Change the first screen that loads to the PRT Status for quick access."
            return "Change the theme of WVU Mobile to a dark color scheme. You can turn Night Mode on from any page in the app by tapping the Navigation Bar 3 times."
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
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Night Mode"
            cell.textLabel?.textColor = colors.textColor
            cell.accessoryView = nightSwitch
        }
        else if indexPath.row == 1 && indexPath.section == 0 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "PRT Status Default"
            cell.textLabel?.textColor = colors.textColor
            //cell.accessoryView = prtSwitch
        }
        else if indexPath.row == 0 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Kate"
            cell.textLabel?.textColor = colors.textColor
            cell.accessoryView = kateButton
        }
        else if indexPath.row == 1 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Ricky"
            cell.textLabel?.textColor = colors.textColor
            cell.accessoryView = rickyButton
        }
        else if indexPath.row == 2 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Jeremy"
            cell.textLabel?.textColor = colors.textColor
            cell.accessoryView = jeremyButton
        }
        else if indexPath.row == 3 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Corey"
            cell.textLabel?.textColor = colors.textColor
            cell.accessoryView = coreyButton
        }
        else if indexPath.row == 4 && indexPath.section == 1 {
            cell.selectionStyle = .None
            cell.backgroundColor = colors.cellColor
            cell.textLabel?.text = "Thomas"
            cell.textLabel?.textColor = colors.textColor
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
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "SettingsViewController"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
