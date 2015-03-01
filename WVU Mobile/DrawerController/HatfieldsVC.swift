//
//  HatfieldsVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class HatfieldsVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "6")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key

            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })
        
        self.title = "Hatfields"
    }
    
    override func setupView() {
        super.setupView()
        
        /*
        Setup info labels
        */
        self.descriptionLabel.text = "This is Hatfields"
        self.hoursDetailLabel.text = "Monday to Friday 7:15 AM to 10:00 PM \n and 11:00 AM to 2:00 PM \n Saturday, Sunday, & Holidays CLOSED"
        self.hoursDetailLabel?.lineBreakMode = .ByWordWrapping
        self.hoursDetailLabel?.numberOfLines = 0
        self.hoursDetailLabel?.textColor = self.colors.goldColor
        self.hoursDetailLabel?.textAlignment = .Center
        
    }
    
    // Return cell for row at index.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.menuView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
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
        self.restorationIdentifier = "HatfieldsVC"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "HatfieldsVC"
    }
    
}
