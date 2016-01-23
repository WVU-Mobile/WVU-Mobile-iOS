//
//  ArnoldsDinerVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class ArnoldsDinerVC: DiningHallVC  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "3")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })
        
        self.title = "Arnold's Diner"
    }
    
    override func setupView() {
        super.setupView()
        
        /*
        Setup info labels
        */
        descriptionLabel.text = "Arnold's Diner is located in Arnold Hall and serves breakfast, lunch, and dinner."
        hoursDetailLabel.text = "Monday - Friday 7:00 AM to 10:00 AM \n and 11:00 AM to 8:00 PM \n Saturday, Sunday, & Holidays CLOSED"
        
        /*
        Setup map
        */
        let point = MKPointAnnotation()
        point.coordinate.latitude = 39.632444
        point.coordinate.longitude = -79.950319
        point.title = "Arnold's Diner"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.632444, longitude: -79.950319), MKCoordinateSpanMake(0.01, 0.01))
        
        map.region = region
        map.addAnnotation(point)
    }
    
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "ArnoldsDinerVC"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
