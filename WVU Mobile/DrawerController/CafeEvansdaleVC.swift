//
//  CafeEvansdaleVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class CafeEvansdaleVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "1")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
                })
            })
        
        self.title = "Cafe Evansdale"
        }
    
    override func setupView() {
        super.setupView()
        
        /*
            Setup info labels
        */
        self.descriptionLabel.text = "Cafe Evansdale is the largest dining hall on the Evansdale campus. It serves a variety of food and offers pizza, hamburgers, hotdogs, and a salad bar daily."
        self.descriptionLabel?.lineBreakMode = .ByWordWrapping
        self.descriptionLabel?.numberOfLines = 0
        
        self.hoursDetailLabel.text = "Monday to Thursday 7:00 AM to 8:00 PM \n Friday 7:00 AM to 6:30 PM \n Saturday & Holidays 9:00 AM to 6:30 PM \n Sunday 9:00 AM to 7:30 PM"
        self.hoursDetailLabel?.lineBreakMode = .ByWordWrapping
        self.hoursDetailLabel?.numberOfLines = 0
        self.hoursDetailLabel?.textColor = self.colors.goldColor
        self.hoursDetailLabel?.textAlignment = .Center
        
        //setup map
        var point = MKPointAnnotation()
        // = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -31, longitude: 21), span: MKCoordinateSpanMake(300, 300))
        point.coordinate.latitude = 39.648793
        point.coordinate.longitude = -79.966136
        point.title = "Cafe Evansdale"
        point.subtitle = "West Virginia University Evansdale\n Evansdale Drive\n Morgantown, WV 26505"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.6487, longitude: -79.966), MKCoordinateSpanMake(100, 100))
        
        self.map.region = region
        self.map.addAnnotation(point)
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "CafeEvansdaleVC"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "CafeEvansdaleVC"
    }
    
}
