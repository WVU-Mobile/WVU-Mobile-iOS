//
//  TerraceRoomVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class TerraceRoomVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "5")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })
        
        self.title = "Terrace Room"
    }
    
    override func setupView() {
        super.setupView()
        
        /*
            Setup info labels
        */
        descriptionLabel.text = "This is the Terrace Room"
        hoursDetailLabel.text = "Monday to Thursday 11:00 AM to 8:00 PM \n Friday 11:00 AM to 2:00 PM \n Saturday, Sunday, & Holidays CLOSED"
        
        /*
        Setup map
        */
        var point = MKPointAnnotation()
        point.coordinate.latitude = 39.648793
        point.coordinate.longitude = -79.966136
        point.title = "Cafe Evansdale"
        point.subtitle = "West Virginia University Evansdale\n Evansdale Drive\n Morgantown, WV 26505"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.6487, longitude: -79.966), MKCoordinateSpanMake(0.01, 0.01))
        
        map.region = region
        map.addAnnotation(point)
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "TerraceRoomVC"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "TerraceRoomVC"
    }
    
}
