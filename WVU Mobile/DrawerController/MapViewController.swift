//
//  MapViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MapViewController: CenterViewController, CLLocationManagerDelegate, GMSMapViewDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    struct busCoordinate {
        var code: String
        var name: String
        var latitude: Double
        var longitude: Double
    }
    
    let locationManager = CLLocationManager()
    var mapView = GMSMapView()
    //let searchBar = UITextView()
    var searchBar: UISearchBar!
    var filtered = [busCoordinate]()
    var tableView: UITableView!
    var active:Bool = false
    var gesture: UITapGestureRecognizer!
    
    //var academicCoords = [["code": "ARH-D", "name":"Arnold Hall", "latitude": 39.632486, "longitude": -79.950469]]
    var academicCoords: Array <busCoordinate> =
    [busCoordinate(code: "WDB-D",name:"Woodburn Hall", latitude: 39.6359019354253, longitude: -79.9553555622697),
        busCoordinate(code: "AEL-E", name : "Aerodynamics Laboratory", latitude: 39.645670, longitude: -79.974281),
        busCoordinate(code: "AER-E", name:"Advanced Engineering Research Building", latitude: 39.646064, longitude: -79.971300),
        busCoordinate(code: "AGS-E", name:"Agricultrial Sciences Building", latitude: 39.645768, longitude: -79.969936),
        busCoordinate(code: "ALH",   name:"Allen Hall", latitude: 39.646186, longitude: -79.967245),
        busCoordinate(code: "ARM-D", name:"Armstrong Hall", latitude: 39.635020, longitude: -79.950727),
        busCoordinate(code: "ASA-E", name:"Agricultural Sciences Annex", latitude: 39.646773, longitude: -79.968235),
        busCoordinate(code: "BIC-E", name:"Bicentennial Housing", latitude: 39.639645, longitude: -79.935943),
        busCoordinate(code: "BKH-D", name:"Brooks Hall", latitude: 39.635585, longitude: -79.956277),
        busCoordinate(code: "BMRF-H",name:"Biomedical Research Facility", latitude: 39.655504, longitude: -79.957020),
        busCoordinate(code: "BUE-D", name:"Business and Economics Building", latitude: 39.636591, longitude: -79.954545),
        busCoordinate(code: "CAC-E", name:"Creative Arts Center", latitude: 39.648136, longitude: -79.975703),
        busCoordinate(code: "CHI-D", name:"Chitwood Hall", latitude: 39.636101, longitude: -79.954638),
        busCoordinate(code: "CKH-D", name:"Clark Hall", latitude: 39.633747, longitude: -79.954364),
        busCoordinate(code: "CLN-D", name:"Colson Hall", latitude: 39.633961, longitude: -79.955330),
        busCoordinate(code: "COL-E", name:"Coliseum", latitude: 39.649228, longitude: -79.981588),
        busCoordinate(code: "CS1-E", name:"Crime Scene House 1", latitude: 39.648919, longitude: -79.964796),
        busCoordinate(code: "CS2-E", name:"Crime Scene House 2", latitude: 39.949296, longitude: -79.964371),
        busCoordinate(code: "CS3-E", name:"Crime Scene House 3", latitude: 39.649330, longitude: -79.964668),
        busCoordinate(code: "CSG-E", name:"Crime Scene Garage", latitude: 39.649070, longitude: -79.964985),
        busCoordinate(code: "CRL-D", name:"Chemistry Research Laboratory", latitude: 39.633366, longitude: -79.953559),
        busCoordinate(code: "CRP-E", name:"Chestnut Ridge Prof Building", latitude: 39.657176, longitude: -79.954237),
        busCoordinate(code: "CRR-E", name:"Chestnut Ridge Research Building", latitude: 39.657046, longitude: -79.955224),
        busCoordinate(code: "EIE-D", name:"Eisland Hall", latitude: 39.633687, longitude: -79.956106),
        busCoordinate(code: "EMH-D", name:"Elizabeth Moore Hall", latitude: 39.634949, longitude: -79.955152),
        busCoordinate(code: "ERA-E", name:"ERC RFL Annex Building", latitude: 39.648041, longitude: -79.965808),
        busCoordinate(code: "ERB-E", name:"Engineering Research Building", latitude: 39.645674, longitude: -79.972463),
        busCoordinate(code: "ESB-E", name:"Engineering Sciences Building", latitude: 39.645893, longitude: -79.973804),
        busCoordinate(code: "EVL-E", name:"Evansdale Library", latitude: 39.645244, longitude: -79.971272),
        busCoordinate(code: "EXT-E", name:"Pierpont Extended Housing", latitude: 39.650526, longitude: -79.964194),
        busCoordinate(code: "FCH-E", name:"Fieldcrest Hall", latitude: 39.652458, longitude: -79.963139),
        busCoordinate(code: "FH1-D", name:"650 Spruce", latitude: 39.633102, longitude: -79.951462),
        busCoordinate(code: "FH2-D", name:"660 North High", latitude: 39.634039, longitude: -79.952016),
        busCoordinate(code: "FH3-D", name:"670 North High", latitude: 39.634159, longitude: -79.951871),
        busCoordinate(code: "FH4-D", name:"672 North High", latitude: 39.634380, longitude: -79.951776),
        busCoordinate(code: "FH5-D", name:"216 Belmar", latitude: 39.635233, longitude: -79.950493),
        busCoordinate(code: "FH6-D", name:"225 Belmar", latitude: 39.635455, longitude: -79.950040),
        busCoordinate(code: "FRM-E", name:"Animal Science Farm", latitude: 39.662673, longitude: -79.928733),
        busCoordinate(code: "GRH-E", name:"Green House 1", latitude: 39.644174, longitude: -79.969498),
        busCoordinate(code: "GSK-D", name:"Gaskins House", latitude: 39.635477, longitude: -79.951699),
        busCoordinate(code: "HOD-D", name:"Hodges Hall", latitude: 39.634179, longitude: -79.956053),
        busCoordinate(code: "HSN-H", name:"Health Science North", latitude: 39.655325, longitude: -79.958258),
        busCoordinate(code: "HSS-H", name:"Health Science South", latitude: 39.654202, longitude: -79.957886),
        busCoordinate(code: "KNP-D", name:"Knapp Hall", latitude: 39.632628, longitude: -79.956980),
        busCoordinate(code: "LIB-D", name:"Charles C. Wise Library",latitude: 39.633197, longitude: -79.954384),
        busCoordinate(code: "LSB-D", name:"Life Science Building", latitude: 39.637073, longitude: -79.95559),
        busCoordinate(code: "LWC-E", name:"Law Center", latitude: 39.648602, longitude: -79.958558),
        busCoordinate(code: "MAR-D", name:"Martin Hall", latitude: 39.635564, longitude: -79.954967),
        busCoordinate(code: "MBRC-H",name:"Mary Bab Randolph Cancer Center", latitude: 39.654234, longitude: -79.958051),
        busCoordinate(code: "MEC-E", name:"Museum Education Center", latitude: 39.645670, longitude: -79.974281),
        busCoordinate(code: "MHH-D", name:"Ming Hsieh Hall", latitude: 39.636563, longitude: -79.953605),
        busCoordinate(code: "MRB-E", name:"Mineral Resouces Building", latitude: 39.646646, longitude: -79.973855),
        busCoordinate(code: "MTL-D", name:"Mountain Lair", latitude: 39.634769, longitude: -79.953585),
        busCoordinate(code: "NAT-E", name:"Natatorium-Shell", latitude: 39.650066, longitude: -79.984071),
        busCoordinate(code: "NIO-E", name:"NIOSH Building", latitude: 39.654928, longitude: -79.953951),
        busCoordinate(code: "NRC-E", name:"National Research Center", latitude: 39.645265, longitude: -79.972007),
        busCoordinate(code: "NSH-E", name:"North Street House", latitude: 39.645320, longitude: -79.955655),
        busCoordinate(code: "NUR-E", name:"Nursery School", latitude: 39.649382, longitude: -79.978264),
        busCoordinate(code: "OGH-D", name:"Oglebay Hall", latitude: 39.649382, longitude: -79.953729),
        busCoordinate(code: "OWP-D", name:"One Waterfront Place", latitude: 39.624787, longitude: -79.963449),
        busCoordinate(code: "PAS-E", name:"CPASS Building", latitude: 39.649653, longitude: -79.969059),
        busCoordinate(code: "PER-E", name:"Percival Hall", latitude: 39.645802, longitude: -79.967373),
        busCoordinate(code: "PSK-E", name:"Milan Pusker Stadium", latitude: 39.649100, longitude: -79.954304),
        busCoordinate(code: "PUR-D", name:"Puritan House", latitude: 39.634436, longitude: -79.955086),
        busCoordinate(code: "SRC-E", name:"Student Recreation Center", latitude: 39.648185, longitude: -79.970821),
        busCoordinate(code: "RRI-D", name:"Regional Research Institute", latitude: 39.657042, longitude: -79.955258),
        busCoordinate(code: "SAS-E", name:"South Agricultrial Sciences", latitude: 39.645071, longitude: -79.970006),
        busCoordinate(code: "SMT-D", name:"Summit", latitude: 39.638754, longitude: -79.956599),
        busCoordinate(code: "SSC-D", name:"Student Services Center", latitude: 39.635580, longitude: -79.953599),
        busCoordinate(code: "STA-D", name:"Stansbury Hall", latitude: 39.634950, longitude: -79.965869),
        busCoordinate(code: "STH-E", name:"Student Health", latitude: 39.649033, longitude: -79.969748),
        busCoordinate(code: "USC-E", name:"University Services Center", latitude: 39.654098, longitude: -79.968307),
        busCoordinate(code: "VNB-D", name:"Vandalia Blue", latitude: 39.638916, longitude: -79.951788),
        busCoordinate(code: "VNG-D", name:"Vandalia Gold", latitude: 39.638038, longitude: -79.951686),
        busCoordinate(code: "WHI-D", name:"White Hall", latitude: 39.632882, longitude: -79.954649)]
    
    var housingCoords: Array <busCoordinate>  =
        [busCoordinate(code: "STL-D", name:"Stalnaker Hall", latitude: 39.635324, longitude: -79.952693),
        busCoordinate(code: "SMT-D", name:"Summit", latitude: 39.638754, longitude: -79.956599),
        busCoordinate(code: "SPH-D", name:"International House", latitude: 39.631943, longitude: -79.952475),
        busCoordinate(code: "MCA-E", name:"Med Center Apartment - Building K", latitude: 39.654057, longitude: -79.961932),
        busCoordinate(code: "MCB-E", name:"Med Center Apartment - Building J", latitude: 39.653888, longitude: -79.962887),
        busCoordinate(code: "LYT-E", name:"Lyon Tower", latitude: 39.647870, longitude: -79.966405),
        busCoordinate(code: "LNC-D", name:"Lincon Hall", latitude: 39.649402, longitude: -79.965612),
        busCoordinate(code: "HON-D", name:"Honors Hall", latitude: 39.638232, longitude: -79.956504),
        busCoordinate(code: "DAD-D", name:"Dadisman Dorm", latitude: 39.635676, longitude: -79.952417),
        busCoordinate(code: "BXT-E", name:"Braxton Towner", latitude: 39.648432, longitude: -79.966257),
        busCoordinate(code: "BRN-D", name:"Boreman Hall North", latitude: 39.633550, longitude: -79.952287),
        busCoordinate(code: "BRS-D", name:"Boreman Hall South", latitude: 39.633025, longitude: -79.952418),
        busCoordinate(code: "BRF-D", name:"Boreman Residential Facility", latitude: 39.632973, longitude: -79.952183),
        busCoordinate(code: "BRT-E", name:"Brook Tower", latitude: 39.648985, longitude: -79.965791),
        busCoordinate(code: "BTT-E", name:"Bennett Tower", latitude: 39.648217, longitude: -79.967014),
        busCoordinate(code: "ARH-D", name:"Arnold Hall", latitude: 39.632486, longitude: -79.950469)]
    
    var parkingCoords: Array <busCoordinate> =
        [busCoordinate(code: "ST2-D", name:"Mountainlair Parking Garage", latitude: 39.63390982, longitude: -79.95299488),
        busCoordinate(code: "ST7-D", name:"Life Sciences Public Parking", latitude: 39.63751225, longitude: -79.95525867),
        busCoordinate(code: "ST3-H", name:"Mountaineer Station Parking Garage", latitude: 39.655422, longitude: -79.961731),
        busCoordinate(code: "COL-D", name:"Coliseum Parking", latitude: 39.648575, longitude: -79.980191),
        busCoordinate(code: "ST5-D", name:"Honors Hall Public Parking", latitude: 39.638446, longitude: -79.955815),
        busCoordinate(code: "ST10-D", name:"Business & Economics Public Parking", latitude: 39.637181, longitude: -79.953980),
        busCoordinate(code: "ST8-E", name:"Erickson Alumni Center Public Parking", latitude: 39.651036, longitude: -79.963748),
        busCoordinate(code: "ST9-E", name:"CAC Public Parking", latitude: 39.648516, longitude: -79.973899),
        busCoordinate(code: "ST6-E", name:"Greenhouse Public Parking", latitude: 39.644146, longitude: -79.970279)]

    var prtCoords: Array <busCoordinate> =
        [busCoordinate(code: "PRT", name:"Walnut PRT Station", latitude: 39.632882, longitude: -79.954649),
        busCoordinate(code: "PRT", name:"Beechurst PRT Station", latitude: 39.632882, longitude: -79.954649),
        busCoordinate(code: "PRT", name:"Engineering PRT Station", latitude: 39.632882, longitude: -79.954649),
        busCoordinate(code: "PRT", name:"Towers PRT Station", latitude: 39.632882, longitude: -79.954649),
        busCoordinate(code: "PRT", name:"Medical PRT Station", latitude: 39.632882, longitude: -79.954649)]
    
    var recreationCoords = [busCoordinate(code: "SRC-E", name:"Student Recreation Center", latitude: 39.648185, longitude: -79.970821)]
    
    
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
        
        
        setupMarkers(academicCoords, icon: UIImage(named: "academic.png")!)
        setupMarkers(housingCoords, icon: UIImage(named: "housing.png")!)
        setupMarkers(parkingCoords, icon: UIImage(named: "parking.png")!)
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        tableView = UITableView(frame: CGRectMake(0, 64, self.view.bounds.width, 300), style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = colors.alpha

        
        gesture = UITapGestureRecognizer(target: self, action: "dismiss")
        self.view.addGestureRecognizer(gesture)
        
        super.viewDidLoad()
    }
    
    func search(item: String) -> Array<busCoordinate>{
        let all = [academicCoords, housingCoords, prtCoords, parkingCoords]
        var matches = Array<busCoordinate>()
        
        for type in all {
            for place in type {
                if place.name == item || place.code == item {
                    matches.append(place)
                }
            }
        }
        return matches
    }
    
    func setupMarkers(coords: Array<busCoordinate>, icon: UIImage){
        for coord in coords{
            var lat = coord.latitude
            var long = coord.longitude
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(long))
            marker.title = coord.code
            marker.snippet = coord.name
            marker.map = mapView
            marker.icon = icon
        }
    }
    
    override func leftDrawerButtonPress(sender: AnyObject?) {
        dismiss()
        super.leftDrawerButtonPress(sender)
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
    
    /*func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        var infoPage = MapInfoVC()
        infoPage.name = marker.snippet
        infoPage.code = marker.title
        
        self.navigationController?.pushViewController(infoPage, animated: true)
    }*/
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filtered.count
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var c = filtered[indexPath.row]
        var camera = GMSCameraPosition.cameraWithLatitude(CLLocationDegrees(c.latitude), longitude: CLLocationDegrees(c.longitude), zoom: 18)
        mapView.camera = camera
        dismiss()
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        cell.backgroundColor = colors.alpha2
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()

        cell.textLabel?.text = academicCoords[indexPath.row].code
        cell.detailTextLabel?.text = academicCoords[indexPath.row].name
        
        var c : busCoordinate
        c = filtered[indexPath.row]
        
        // Configure the cell
        cell.textLabel?.text = c.code
        cell.detailTextLabel?.text = c.name
        
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.view.addSubview(self.tableView)
        active = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        dismiss()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        dismiss()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = []
        for i in academicCoords {
            if (i.code.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) || (i.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) {
                filtered.append(i)
            }
        }
        
        for i in housingCoords {
            if (i.code.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) || (i.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) {
                filtered.append(i)
            }
        }
        
        for i in parkingCoords {
            if (i.code.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) || (i.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) {
                filtered.append(i)
            }
        }
        
        for i in prtCoords {
            if (i.code.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) || (i.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) {
                filtered.append(i)
            }
        }
        
        for i in recreationCoords {
            if (i.code.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) || (i.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil) {
                filtered.append(i)
            }
        }
        
        if filtered.count != 0 {
            self.view.removeGestureRecognizer(gesture)
        } else {
            self.view.addGestureRecognizer(gesture)
        }
        tableView.reloadData()
    }

    func dismiss(){
        if active == true{
            tableView.removeFromSuperview()
            searchBar.resignFirstResponder()
            searchBar.text = ""
            self.view.addGestureRecognizer(gesture)
            active = false
        }
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