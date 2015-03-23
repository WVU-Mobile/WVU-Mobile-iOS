//
//  MapsViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MapsViewController: CenterViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    var mapView = GMSMapView()

    
    override func viewDidLoad() {
        self.title = "M A P"
        
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        var camera = GMSCameraPosition.cameraWithLatitude(39.6360074,
            longitude: -79.95536864, zoom: 17)
        mapView = GMSMapView.mapWithFrame(CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height), camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(39.6360074, -79.95536864)
        marker.title = "Woodburn Hall"
        marker.snippet = "Classrooms and administrative offices for the Eberly College of Arts & Sciences."
        marker.map = mapView
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        println("You tapped at coordinate \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "MapsViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MapsViewController"
    }

}
