//
//  MapViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MapViewController: CenterViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    var mapView = GMSMapView()
    
    var academicCoords = [["code": "WDB-D", "name":"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697],
        ["code": "MAR-D", "name":"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291],
        ["code": "CHI-D", "name":"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931]]
    
    var housingCoords = [["code": "ARN-D", "name":"Arnold Hall", "latitude": 39.63236882, "longitude": -79.95063454],
        ["code": "DAD-D", "name":"Dadisman Hall", "latitude": 39.63568214, "longitude": -79.95238334]]
    
    var parkingCoords = [["code": "ST2", "name":"Mountainlair Parking Garage", "latitude": 39.63390982, "longitude": -79.95299488],
        ["code": "ST7", "name":"Public Parking", "latitude": 39.63751225, "longitude": -79.95525867]]
    
    var prtCoords = [["code": "WDB-D", "name":"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697],
        ["code": "MAR-D", "name":"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291],
        ["code": "CHI-D", "name":"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931],
        ["code": "CHI-D", "name":"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931]]
    
    var recreationCoords = [["code": "WDB-D", "name":"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697],
        ["code": "MAR-D", "name":"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291]]
    
    var administrativeCoords = [["code": "WDB-D", "name":"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697],
        ["code": "MAR-D", "name":"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291]]
    
    var researchCoords = [["code": "WDB-D", "name":"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697],
        ["code": "MAR-D", "name":"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291],
        ["code": "CHI-D", "name":"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931],
        ["code": "CHI-D", "name":"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931]]
    
    override func viewDidLoad() {
        self.title = "M A P"
        
        /*
        Change back bar button to custom text, while preserving the back arrow.
        */
        let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        var camera = GMSCameraPosition.cameraWithLatitude(39.6359019354253,
            longitude: -79.9553555622697, zoom: 17)
        mapView = GMSMapView.mapWithFrame(CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height), camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        
        println("debug 1")
        setupMarkers(academicCoords, icon: UIImage(named: "academic.png")!)
        println("debug 2")
        setupMarkers(housingCoords, icon: UIImage(named: "housing.png")!)
        println("debug 3")
        setupMarkers(parkingCoords, icon: UIImage(named: "parking.png")!)
        
        super.viewDidLoad()
    }
    
    func searchBar(){
        let bar = UISearchController()
        bar.searchBar.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height)
        
        self.view.addSubview(bar.searchBar)
    }
    
    func setupMarkers(coords: NSArray, icon: UIImage){
        for coord in coords {
            var lat = coord["latitude"] as? Float
            var long = coord["longitude"] as? Float
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(CLLocationDegrees(lat!), CLLocationDegrees(long!))
            marker.title = coord["code"] as? String
            marker.snippet = coord["name"] as? String
            marker.map = mapView
            marker.icon = icon
        }
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
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        var infoPage = MapInfoVC()
        infoPage.name = marker.snippet
        infoPage.code = marker.title
        
        self.navigationController?.pushViewController(infoPage, animated: true)
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "MapViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MapViewController"
    }

}
