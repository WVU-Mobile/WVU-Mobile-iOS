//
//  MapViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MapViewController: CenterViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    struct busCoordinate {
        var code: String
        var name: String
        var latitude: Float
        var longitude: Float
    }
    
    let locationManager = CLLocationManager()
    var mapView = GMSMapView()

    var academicCoords = [["code": "ARH-D", "name":"Arnold Hall", "latitude": 39.632486, "longitude": -79.950469]]
    /*var academicCoords =
       [busCoordinate(code: "WDB-D", name:"Woodburn Hall", "latitude": 39.6359019354253, "longitude": -79.9553555622697),
        busCoordinate(code: "MAR-D", name:"Martin Hall", "latitude": 39.6356083605712, "longitude": -79.9551426619291),
        busCoordinate(code: "CHI-D", name:"Woodburn Hall", "latitude": 39.6360718312976, "longitude": -79.9547302722931,)
        busCoordinate(code: "AEL-E", name : "Aerodynamics Laboratory", "latitude": 39.645670, "longitude": -79.974281),
        busCoordinate(code: "AER",   name:"UH", "latitude": 39.646064, "longitude": -79.971300),
        busCoordinate(code: "AGS-E", name:"Agricultrial Sciences Building", "latitude": 39.645768, "longitude": -79.969936),
        busCoordinate(code: "ALH",   name:"Allen Hall", "latitude": 39.646186, "longitude": -79.967245),
        busCoordinate(code: "ARH-D", name:"Arnold Hall", "latitude": 39.632486, "longitude": -79.950469),
        busCoordinate(code: "ARM-D", name:"Armstrong Hall", "latitude": 39.635020, "longitude": -79.950727),
        busCoordinate(code: "ASA-E", name:"Agricultural Sciences Annex", "latitude": 39.646773, "longitude": -79.968235),
        busCoordinate(code: "BIC-E", name:"Bicentennial Housing", "latitude": 39.639645, "longitude": -79.935943),
        busCoordinate(code: "BKH-D", name:"Brooks Hall", "latitude": 39.635585, "longitude": -79.956277),
        busCoordinate(code: "BMRF-H",name:"Biomedical Research Facility", "latitude": 39.655504, "longitude": -79.957020),
        busCoordinate(code: "BRF-D", name:"Boreman Residential Facility", "latitude": 39.632973, "longitude": -79.952183),
        busCoordinate(code: "BRN-D", name:"Boreman Hall North", "latitude": 39.633550, "longitude": -79.952287),
        busCoordinate(code: "BRS-D", name:"Boreman Hall South", "latitude": 39.633025, "longitude": -79.952418),
        busCoordinate(code: "BRT-E", name:"Brook Tower", "latitude": 39.648985, "longitude": -79.965791),
        busCoordinate(code: "BTT-E", name:"Bennett Tower", "latitude": 39.648217, "longitude": -79.967014),
        busCoordinate(code: "BUE-D", name:"Business and Economics Building", "latitude": 39.636591, "longitude": -79.954545),
        busCoordinate(code: "BXT-E", name:"Braxton Towner", "latitude": 39.648432, "longitude": -79.966257)]*/
            /*
        busCoordinate(code": "CAC", "name":"", "latitude": 39.648136, "longitude": -79.975703],
        busCoordinate(code": "CHI", "name":"", "latitude": 39.636101, "longitude": -79.954638],
        busCoordinate(code": "CKH", "name":"", "latitude": 39.633747, "longitude": -79.954364],
        busCoordinate(code": "CLN", "name":"", "latitude": 39.633961, "longitude": -79.955330],
        busCoordinate(code": "COL", "name":"", "latitude": 39.649228, "longitude": -79.981588],
        busCoordinate(code": "CS1", "name":"", "latitude": 39.648919, "longitude": -79.964796],
        busCoordinate(code": "CS2", "name":"", "latitude": 39.949296, "longitude": -79.964371],
        busCoordinate(code": "CS3", "name":"", "latitude": 39.649330, "longitude": -79.964668],
        busCoordinate(code": "CSG", "name":"", "latitude": 39.649070, "longitude": -79.964985],
        busCoordinate(code": "CRL", "name":"", "latitude": 39.633366, "longitude": -79.953559],
        busCoordinate(code": "CRP", "name":"", "latitude": 39.657176, "longitude": -79.954237],
        busCoordinate(code": "CRR", "name":"", "latitude": 39.657046, "longitude": -79.955224],

        busCoordinate(code": "DAD", "name":"", "latitude": 39.635676, "longitude": -79.952417],
        busCoordinate(code": "EIE", "name":"", "latitude": 39.633687, "longitude": -79.956106],
        busCoordinate(code": "EMH", "name":"", "latitude": 39.634949, "longitude": -79.955152],
        busCoordinate(code": "ERA", "name":"", "latitude": 39.648041, "longitude": -79.965808],
        busCoordinate(code": "ERB", "name":"", "latitude": 39.645674, "longitude": -79.972463],
        busCoordinate(code": "ESB", "name":"", "latitude": 39.645893, "longitude": -79.973804],
        busCoordinate(code": "EVL", "name":"", "latitude": 39.645244, "longitude": -79.971272],
        busCoordinate(code": "EXT", "name":"", "latitude": 39.650526, "longitude": -79.964194],

        busCoordinate(code": "FCH", "name":"", "latitude": 39.652458, "longitude": -79.963139],
        busCoordinate(code": "FH1", "name":"", "latitude": 39.633102, "longitude": -79.951462],
        busCoordinate(code": "FH2", "name":"", "latitude": 39.634039, "longitude": -79.952016],
        busCoordinate(code": "FH3", "name":"", "latitude": 39.634159, "longitude": -79.951871],
        busCoordinate(code": "FH4", "name":"", "latitude": 39.634380, "longitude": -79.951776],
        busCoordinate(code": "FH5", "name":"", "latitude": 39.635233, "longitude": -79.950493],
        busCoordinate(code": "FH6", "name":"", "latitude": 39.635455, "longitude": -79.950040],
        busCoordinate(code": "FRM", "name":"", "latitude": 39.662673, "longitude": -79.928733]]

        code": "GRH", "name":"", "latitude": 39.644174, "longitude": -79.969498],
        code": "GSK", "name":"", "latitude": 39.635477, "longitude": -79.951699],
        code": "HOD", "name":"", "latitude": 39.634179, "longitude": -79.956053],
        code": "HON", "name":"", "latitude": 39.638232, "longitude": -79.956504],
        code": "HSN", "name":"", "latitude": 39.655325, "longitude": -79.958258],
        code": "HSS", "name":"", "latitude": 39.654202, "longitude": -79.957886],
        code": "KNP", "name":"", "latitude": 39.632628, "longitude": -79.956980],
        code": "LIB", "name":"", "latitude": 39.633197, "longitude": -79.954384],
        code": "LNC", "name":"", "latitude": 39.649402, "longitude": -79.965612],
        code": "LSB", "name":"", "latitude": 39.637073, "longitude": -79.955590],
        code": "LWC", "name":"", "latitude": 39.648602, "longitude": -79.958558],
        code": "LYT", "name":"", "latitude": 39.647870, "longitude": -79.966405],
        code": "MAR", "name":"", "latitude": 39.635564, "longitude": -79.954967],
        code": "MBRC", "name":"", "latitude": 39.654234, "longitude": -79.958051],
        code": "MCA", "name":"", "latitude": 39.654057, "longitude": -79.961932],
        code": "MCB", "name":"", "latitude": 39.653888, "longitude": -79.962887],
        code": "MEC", "name":"", "latitude": 39.645670, "longitude": -79.974281],
        code": "MHH", "name":"", "latitude": 39.636563, "longitude": -79.953605],
        code": "MRB", "name":"", "latitude": 39.646646, "longitude": -79.973855],
        code": "MTL", "name":"", "latitude": 39.634769, "longitude": -79.953585]]
    
        [code": "NAT", "name":"", "latitude": 39.650066, "longitude": -79.984071],
        [code": "NIO", "name":"", "latitude": 39.654928, "longitude": -79.953951],
        [code": "NRC", "name":"", "latitude": 39.645265, "longitude": -79.972007],
        [code": "NSH", "name":"", "latitude": 39.645320, "longitude": -79.955655],
        [code": "NUR", "name":"", "latitude": 39.649382, "longitude": -79.978264],
        [code": "OGH", "name":"", "latitude": 39.649382, "longitude": -79.953729],
        [code": "OWP", "name":"", "latitude": 39.624787, "longitude": -79.963449],
        
        [code": "PAS", "name":"", "latitude": 39.649653, "longitude": -79.969059],
        [code": "PER", "name":"", "latitude": 39.645802, "longitude": -79.967373],
        [code": "PSK", "name":"", "latitude": 39.649100, "longitude": -79.954304],
        [code": "PUR", "name":"", "latitude": 39.634436, "longitude": -79.955086],
        [code": "SRC", "name":"", "latitude": 39.648185, "longitude": -79.970821],
        [code": "RRI", "name":"", "latitude": 39.657042, "longitude": -79.955258],
        
        [code": "SAS", "name":"", "latitude": 39.645071, "longitude": -79.970006],
        [code": "SMT", "name":"", "latitude": 39.638754, "longitude": -79.956599],
        [code": "SPH", "name":"", "latitude": 39.631943, "longitude": -79.952475],
        [code": "SSC", "name":"", "latitude": 39.635580, "longitude": -79.953599],
        [code": "STA", "name":"", "latitude": 39.634950, "longitude": -79.965869],
        [code": "STL", "name":"", "latitude": 39.635324, "longitude": -79.952693],
        [code": "STH", "name":"", "latitude": 39.649033, "longitude": -79.969748],
        
        [code": "USC", "name":"", "latitude": 39.654098, "longitude": -79.968307],
        [code": "VNB", "name":"", "latitude": 39.638916, "longitude": -79.951788],
        [code": "VNG", "name":"", "latitude": 39.638038, "longitude": -79.951686],
        [code": "WDB", "name":"", "latitude": 39.635941, "longitude": -79.955397],
        [code": "WHI", "name":"", "latitude": 39.632882, "longitude": -79.954649],
    ]*/

    var housingCoords = [["code": "ARN-D", "name":"Arnold Hall", "latitude": 39.63236882, "longitude": -79.95063454],
        ["code": "DAD-D", "name":"Dadisman Hall", "latitude": 39.63568214, "longitude": -79.95238334],
        ["code": "ARN-D", "name":"Arnold Apartments", "latitude": 39.632126, "longitude": -79.950727]]//,
        /*["code": "BRF-D", "name":"Boreman Residential Facility", "latitude": 39.632973, "longitude": -79.952183],
        ["code": "BRN-D", "name":"Boreman Hall North", "latitude": 39.633550, "longitude": -79.952287],
        ["code": "BRS-D", "name":"Boreman Hall South", "latitude": 39.633025, "longitude": -79.952418],
        ["code": "BRT-E", "name":"Brook Tower", "latitude": 39.648985, "longitude": -79.965791],
        ["code": "BTT-E", "name":"Bennett Tower", "latitude": 39.648217, "longitude": -79.967014]]*/
    
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
        self.title = "Map"
        
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
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MapViewController"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
