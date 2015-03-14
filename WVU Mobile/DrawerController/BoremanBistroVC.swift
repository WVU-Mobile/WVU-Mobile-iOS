//
//  BoremanVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class BoremanBistroVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "4")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })
        
        self.title = "Boreman Bistro"
    }
    
    override func setupView() {
        super.setupView()
        
        /*
            Setup info labels
        */
        self.descriptionLabel.text = "This is Boreman Bistro"
        self.hoursDetailLabel.text = "Monday to Friday 11:00 AM to 7:00 PM \n Saturday, Sunday, & Holidays 9:00 AM to 7:00 PM"
        self.hoursDetailLabel?.lineBreakMode = .ByWordWrapping
        self.hoursDetailLabel?.numberOfLines = 0
        self.hoursDetailLabel?.textColor = self.colors.textColor
        self.hoursDetailLabel?.textAlignment = .Center
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "BoremanBistroVC"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "BoremanBistroVC"
    }
    
}
