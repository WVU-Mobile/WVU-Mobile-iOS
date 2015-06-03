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
        self.title = "Cafe Evansdale"

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
        
        super.viewDidLoad()
        }
    
    override func setupView() {
        super.setupView()
        
        /*
            Setup info labels
        */
        descriptionLabel.text = "Cafe Evansdale is located in Brooke Tower and serves breakfast, lunch, and dinner."
        
        hoursDetailLabel.text = "Monday - Thursday 7:00 AM to 8:00 PM \n Friday 7:00 AM to 6:30 PM \n Saturday & Holidays 9:00 AM to 6:30 PM \n Sunday 9:00 AM to 7:30 PM"
        
        /* 
            Setup map
        */
        var point = MKPointAnnotation()
        point.coordinate.latitude = 39.648935
        point.coordinate.longitude = -79.966303
        point.title = "Cafe Evansdale"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.648935, longitude: -79.966303), MKCoordinateSpanMake(0.01, 0.01))
        
        map.region = region
        map.addAnnotation(point)
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "CafeEvansdaleVC"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
