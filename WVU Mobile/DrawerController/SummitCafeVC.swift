//
//  SummitCafeVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/26/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class SummitCafeVC: DiningHallVC, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.diningInfo = DiningJSON(ID: "2")
            self.menus = self.diningInfo.menus
            self.key = self.diningInfo.key
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })
        self.title = "Summit Cafe"
    }
    
    override func setupView() {
        super.setupView()
        
        /*
        Setup info labels
        */
        descriptionLabel.text = "Summit Cafe is located in Summit Hall and serves breakfast, lunch, and dinner."
        hoursDetailLabel.text = "Monday - Friday 7:00 AM to 7:00 PM \n Saturday, Sunday, & Holidays 11:00 AM to 6:30 PM"
        
        /*
        Setup map
        */
        var point = MKPointAnnotation()
        point.coordinate.latitude = 39.638829
        point.coordinate.longitude = -79.956533
        point.title = "Summit Cafe"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.638829, longitude: -79.956533), MKCoordinateSpanMake(0.01, 0.01))
        
        map.region = region
        map.addAnnotation(point)
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "SummitCafeVC"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
