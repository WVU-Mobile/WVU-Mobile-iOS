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
        descriptionLabel.text = "Boreman Bistro is located in Boreman Hall and serves lunch and dinner."
        hoursDetailLabel.text = "Monday - Friday 11:00 AM to 7:00 PM \n Saturday, Sunday, & Holidays 9:00 AM to 7:00 PM"

        /*
        Setup map
        */
        let point = MKPointAnnotation()
        point.coordinate.latitude = 39.633060
        point.coordinate.longitude = -79.952642
        point.title = "Boreman Bistro"
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2D(latitude: 39.633060, longitude: -79.952642), MKCoordinateSpanMake(0.01, 0.01))
        
        map.region = region
        map.addAnnotation(point)
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "BoremanBistroVC"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
