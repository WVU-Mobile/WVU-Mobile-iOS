//
//  BusesViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

struct BusLine {
    var name = ""
    var stops: Array<String>!
    var map: UIImage!
    var hours: Array<String>
    var hoursString: String
    var twitter: String
}

class BusesViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var online: NSArray!
    var offline: NSArray!
    
    var routes: Array<BusLine>!
    var coords: Dictionary <String, CLLocationCoordinate2D>!
    
    override func viewDidLoad() {
        self.title = "Buses"
        
            //  "Triune-Halleck VFD", "Walmart",  "Public Safety Building", "Unity Manor", "Willey Street", "Mileground", "Honda Shop", "Glenmark Center", "Easton Hill", "Arnold Apartments", "Courthouse", "Morgantown", "Fairmont", "Clarksburgh", "Mylan", "Mountaineer Station", "Waynesburg", "Pittsburgh Airport", "Pittsburgh Greyhound Station", "West Run Complex", "Glen Mark & Bon Vista", "Suncrest Towne Centre", "Chestnut Ridge", "Stewart Place & Lewis Street", "Shorty Anderson's", "Hoffman/Van Guilder", "Express Mart", "Stewart & University", "Copper Beech", "Towers PRT", "Towers", "Oakland",  "Grant Avenue", "Life Sciences", "Beechurst", "CAC", "Engineering PRT", "Evansdale Library", "Allen Hall", "Valley View", "Chestnut Ridge", "Stewartstown Road", "Falling Run", "Life Sciences/B&E", "Stewart Street", "Willowdale"
        
                  // Campus PM
        coords = ["Fieldcrest": CLLocationCoordinate2DMake(39.652991, -79.963512),
                  "Ruby" : CLLocationCoordinate2DMake(39.652122, -79.955629),
                  "Valley View" : CLLocationCoordinate2DMake(39.651050, -79.949585),
                  "Stewart St." : CLLocationCoordinate2DMake(39.646260, -79.945115),
                  "Sunnyside" : CLLocationCoordinate2DMake(39.637769, -79.954792),
                  "Mountainlair" : CLLocationCoordinate2DMake(39.634880, -79.954604),
                  "High Street" : CLLocationCoordinate2DMake(39.629292, -79.956736),
                  "Spruce St." : CLLocationCoordinate2DMake(39.630819, -79.953977),
            
                  // Downtown PM
                  "Willowdale" : CLLocationCoordinate2DMake(39.654949, -79.953311),
                  "Boreman Hall" : CLLocationCoordinate2DMake(39.633525, -79.953004),
                  "Warner Theater" : CLLocationCoordinate2DMake(39.628942, -79.956950),
                  "Westover Park & Ride" : CLLocationCoordinate2DMake(39.631181, -79.977195),
                  "Kmart" : CLLocationCoordinate2DMake(39.630394, -80.001494),
                  "Morgantown Mall Theater" : CLLocationCoordinate2DMake(39.627116, -79.999424),
                  "Public Safety Building" : CLLocationCoordinate2DMake(39.629767, -79.954879),
            
                  // Green Line
                  "Depot" : CLLocationCoordinate2DMake(39.629059, -79.959809),
                  "Bank Plaza/Morgantown Motel" : CLLocationCoordinate2DMake(39.629497, -79.957370),
                  "Ramada Inn" : CLLocationCoordinate2DMake(39.587851, -79.957093),
                  "Valley Health" : CLLocationCoordinate2DMake(39.586802, -79.965975),
                  "Walmart" : CLLocationCoordinate2DMake(39.578803, -79.959495),
                  "Dorsey Knob Park" : CLLocationCoordinate2DMake(39.597093, -79.958160),
            
                  // Orange Line **
                  "Westover" : CLLocationCoordinate2DMake(39.632384, -79.976609),
                  "Morgantown Mall" : CLLocationCoordinate2DMake(39.627025, -79.996881),
                  "University Town Centre (mult. stops)" : CLLocationCoordinate2DMake(39.645563, -79.999281), // Done
                  "Towers" : CLLocationCoordinate2DMake(39.648975, -79.966346),
                  "Beechurst" : CLLocationCoordinate2DMake(39.634675, -79.956430),
                  "Downtown (mult. stops)" : CLLocationCoordinate2DMake(39.632384, -79.976609),
                  "South Park 1st Ward (mult. stops)" : CLLocationCoordinate2DMake(39.632384, -79.976609),
                  "White Park" : CLLocationCoordinate2DMake(39.614337, -79.957809),
                  "Mountaineer Mall" : CLLocationCoordinate2DMake(39.606411, -79.962235),
            
                  // Gold Line
                  "Mountaineer Station" : CLLocationCoordinate2DMake(39.654811, -79.961377),
                  "Medical Arts" : CLLocationCoordinate2DMake(39.658058, -79.963054),
                  "Indep. Hill" : CLLocationCoordinate2DMake(39.675729, -79.961097),
                  "North Hills" : CLLocationCoordinate2DMake(39.666587, -79.951486),
                  "Mon General" : CLLocationCoordinate2DMake(39.663660, -79.945850),
                  "E. Moore Hall" : CLLocationCoordinate2DMake(39.634884, -79.954589), // Done
                  "West Run Road" : CLLocationCoordinate2DMake(39.668552, -79.947761),
            
                  // Red Line
                  "Unity Manor" : CLLocationCoordinate2DMake(39.631885, -79.950752),
                  "Evansdale (mult. stops)" : CLLocationCoordinate2DMake(39.649377, -79.964146), // expand
                  "Star City (mult. stops)" : CLLocationCoordinate2DMake(39.660651, -79.984337), // expand
                  "Suncrest" : CLLocationCoordinate2DMake(39.654441, -79.969711),
                  "Law School" : CLLocationCoordinate2DMake(39.647841, -79.960318),
                  "Court House" : CLLocationCoordinate2DMake(39.629068, -79.956737),
            
                  // Tyrone
                  "Richwood" : CLLocationCoordinate2DMake(39.629795, -79.947923),
                  "DMV" : CLLocationCoordinate2DMake(39.628511, -79.933399), // Done
                  "Jerome Park" : CLLocationCoordinate2DMake(39.632790, -79.931696),
                  "Sabraton (mult. stops)" : CLLocationCoordinate2DMake(39.628214, -79.929945), // Done
                  "Brookhaven" : CLLocationCoordinate2DMake(39.609158, -79.920528),
                  "Tyrone Road" : CLLocationCoordinate2DMake(39.609158, -79.920539),
                  "Sunset Beach/Ashbrooke" : CLLocationCoordinate2DMake(39.677709, -79.857763),
                  "Cheat Lake" : CLLocationCoordinate2DMake(39.668258, -79.859238),
            
                  // Purple
                  "Chestnut Hill" : CLLocationCoordinate2DMake(39.654265, -79.949695),
            
                  // Cassville
                  "Walnut PRT" : CLLocationCoordinate2DMake(39.629989, -79.957215), // Done
                  "Granville VFD" : CLLocationCoordinate2DMake(39.645105, -79.986330), // Done
                  "Granville P&R" : CLLocationCoordinate2DMake(39.648582, -79.990298),
                  "Bertha Hill" : CLLocationCoordinate2DMake(39.661513, -79.995921),
                  "Cassville/New Hill" : CLLocationCoordinate2DMake(39.665394, -80.062787),
            
                  // Blue Line
                  "Woodland Terrace" : CLLocationCoordinate2DMake(39.635073, -79.925082),
                  "Marilla Park" : CLLocationCoordinate2DMake(39.628187, -79.939392),
                  "Hartman Run" : CLLocationCoordinate2DMake(39.633198, -79.927714),
                  "Airport (by request)" : CLLocationCoordinate2DMake(39.644008, -79.920109), // Puzzling...
                  "University HS" : CLLocationCoordinate2DMake(39.687748, -79.924974),
                  "Canyon" : CLLocationCoordinate2DMake(39.671462, -79.890005),
            
                  // Crown
                  "Laurel Point" : CLLocationCoordinate2DMake(-39.619283, -80.029911),
                  "Arnettesville Community Center" : CLLocationCoordinate2DMake(39.582781, -80.094273),
                  "Everettsville" : CLLocationCoordinate2DMake(39.563092, -80.067400),
                  "Opekiska Dam" : CLLocationCoordinate2DMake(39.563582, -80.052711),
                  "Booth River Road VFD" : CLLocationCoordinate2DMake(39.598783, -80.007500),
            
                  // Mountain Heights
                  "Brockway Ave." : CLLocationCoordinate2DMake(-39, 79),
                  "Kroger" : CLLocationCoordinate2DMake(-39, 79),
                  "Summers School Road" : CLLocationCoordinate2DMake(-39, 79),
                  "Mountain Heights" : CLLocationCoordinate2DMake(-39, 79),
                  "Kingwood Pike" : CLLocationCoordinate2DMake(-39, 79),
                  "Giant Eagle" : CLLocationCoordinate2DMake(-39, 79),
            
                  // Grafton Road
                  "Aldi" : CLLocationCoordinate2DMake(-39, 79),
                  "Greenbag Road" : CLLocationCoordinate2DMake(-39, 79),
                  "Ashton Estates" : CLLocationCoordinate2DMake(-39, 79),
                  "Halleck Road" : CLLocationCoordinate2DMake(-39, 79),
                  "Triune-Halleck VFD" : CLLocationCoordinate2DMake(-39, 79),
            
                  // Pink Line
                  "Willey Street" : CLLocationCoordinate2DMake(39.634386, -79.943288),
                  "Mileground" : CLLocationCoordinate2DMake(39.644816, -79.926895),
                  "Honda Shop" : CLLocationCoordinate2DMake(39.648938, -79.921203),
                  "Glenmark Center" : CLLocationCoordinate2DMake(39.648821, -79.901130),
                  "Easton Hill" : CLLocationCoordinate2DMake(39.652290, -79.913929),
                  "Arnold Apartments" : CLLocationCoordinate2DMake(39.631893, -79.950767),
            
                  // West Run
                  "West Run Complex" : CLLocationCoordinate2DMake(-39, 79),
                  "Glen Mark & Bon Vista" : CLLocationCoordinate2DMake(-39, 79),
                  "Suncrest Towne Centre" : CLLocationCoordinate2DMake(-39, 79),
                  "Chestnut Ridge" : CLLocationCoordinate2DMake(-39, 79),
                  "Stewart Place & Lewis Street" : CLLocationCoordinate2DMake(39.647739, -79.943570),
                  "Shorty Anderson's" : CLLocationCoordinate2DMake(39.646077, -79.944564),
                  "Hoffman/Van Guilder" : CLLocationCoordinate2DMake(39.642620, -79.947592),
                  "Express Mart" : CLLocationCoordinate2DMake(39.642230, -79.949758), // Done
                  "Stewart & University" : CLLocationCoordinate2DMake(39.637644, -79.954799), // Done
                  "Copper Beech" : CLLocationCoordinate2DMake(39.655500, -79.925842),
            
                  // Blue & Gold
                  "Towers PRT" : CLLocationCoordinate2DMake(39.647607, -79.967837), // Done
                  "Oakland" : CLLocationCoordinate2DMake(39.649397, -79.964143), // Done
                  "Grant Avenue" : CLLocationCoordinate2DMake(39.638064, -79.956019), // Done
                  "Life Sciences" : CLLocationCoordinate2DMake(39.637644, -79.954799),
                  "CAC" : CLLocationCoordinate2DMake(39.647032, -79.974160), // Done
                  "Engineering PRT" : CLLocationCoordinate2DMake(39.647032, -79.974160), // Done
                  "Evansdale Library" : CLLocationCoordinate2DMake(39.644907, -79.970809), // Done
                  "Allen Hall" : CLLocationCoordinate2DMake(39.645154, -79.968635), // Done
            
                  // Valley View
                  "Stewartstown Road" : CLLocationCoordinate2DMake(39.658705, -79.930210), // Done
                  "Falling Run" : CLLocationCoordinate2DMake(-39, 79),
                  "Life Sciences/B&E" : CLLocationCoordinate2DMake(-39, 79)]
        /*
        Change back bar button to custom text, while preserving the back arrow.
        */
        let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        setupRoutes()

        /*
        Set up table view.
        */
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.separatorStyle = .None
        tableView.rowHeight = 70.0
        tableView.backgroundColor = colors.menuViewColor
        tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        setUIColors()
        super.viewDidLoad()
    }

    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        self.setupGesture()
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        //selected background view color
        var bgColorView = UIView()
        bgColorView.backgroundColor = colors.selectColor
        cell.selectedBackgroundView = bgColorView
        
        cell.backgroundColor = colors.mainViewColor
        cell.textLabel?.textColor = colors.textColor
        
        cell.textLabel?.text = self.routes[indexPath.row].name
        
        
        if indexPath.row < 0 {
            cell.imageView?.image = UIImage(named: "online.png")
        } else {
            cell.imageView?.image = UIImage(named: "offline.png")
        }

        return cell
    }
    
    // Load Dining Hall view after cell selection.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var vc = LineViewController()
        vc.line = routes[indexPath.row]
        vc.coords = coords
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupRoutes () {
        var times = []
        
        var campusPM = BusLine(name: "1 Campus PM", stops: ["Fieldcrest", "Ruby", "Valley View", "Stewart St.", "Sunnyside", "Mountainlair", "High Street", "Spruce St."], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Thursday through Saturday 6:00 - 2:50 AM.", twitter: "MLcampuspm")
        
        var downtownPM = BusLine(name: "Downtown PM Mall", stops: ["Willowdale", "Sunnyside", "Mountainlair", "Boreman Hall", "Warner Theater", "Westover Park & Ride", "Kmart", "Morgantown Mall Theater", "Public Safety Building"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:00PM - 12:00AM.", twitter: "MLMallpm")
        
        //check southbound vs west
        var green = BusLine(name: "Green Line", stops: ["Depot", "Aldi", "Bank Plaza/Morgantown Motel", "Ramada Inn", "Valley Health", "Walmart", "Dorsey Knob Park"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Friday 8:00 AM - 5:40 PM \nand Satuday 9:00 AM - 5:40 PM.", twitter: "ML03green")
        
        var orange = BusLine(name: "Orange Line", stops: ["Depot", "Westover", "Morgantown Mall", "University Town Centre (mult. stops)", "Towers", "Beechurst", "Downtown (mult. stops)", "South Park 1st Ward (mult stops)", "White Park", "Mountaineer Mall"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 7:00 AM - 10:20 PM.", twitter: "ML04orange")
        
        var gold = BusLine(name: "Gold Line", stops: ["Public Safety Building", "Mountainlair", "Ruby", "Mountaineer Station", "Medical Arts", "Indep. Hill", "North Hills", "Mon General", "Towers", "E. Moore Hall", "High Street", "West Run Road"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:00 AM - 5:15 PM.", twitter: "ML06gold")
        
        var red = BusLine(name: "Red Line", stops: ["Depot", "Public Safety Building", "Unity Manor", "Mountainlair", "Evansdale (mult. stops)", "Star City (mult. stops)", "Suncrest", "Law School", "Court House"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:20 AM - 5:10 PM.", twitter: "ML07red")
        
        var tyrone = BusLine(name: "Tyrone", stops: ["Depot", "Unity Manor", "Richwood", "DMV", "Jerome Park", "Sabraton", "Brookhaven", "Tyrone Road", "Sunset Beach/Ashbrooke", "Cheat Lake"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:30 AM - 5:10 PM.", twitter: "ML08tyrone")
        
        var purple = BusLine(name: "Purple Line", stops: ["Depot", "Public Safety Building", "Mountainlair", "Stewart St.", "Chestnut Hill", "Valley View", "Shorty Anderson's", "E. Moore Hall"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 7:00 AM - 5:10 PM.", twitter: "MLpurplepink")
        
        var cassvile = BusLine(name: "Cassvile", stops: ["Walnut PRT", "Westover", "Granville VFD", "Granville P&R", "Bertha Hill", "Cassville/New Hill", "University Town Centre (mult. stops)"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:00 AM - 5:10 PM.", twitter: "ML11cass")
        
        var blue = BusLine(name: "Blue Line", stops: ["Depot", "Unity Manor", "Woodland Terrace", "Marilla Park", "Sabraton", "Hartman Run", "Airport (by request)", "University HS", "Canyon", "Easton Hill"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 6:30 AM - 5:10 PM.", twitter: "ML12blue")
    
        var crown = BusLine(name: "Crown", stops: ["Westover", "Laurel Point", "Arnettesville Community Center", "Everettsville", "Opekiska Dam", "Booth River Road VFD", "Depot"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 7:00 AM - 5:15 PM.", twitter: "ML10brown")
        
        var mountainHeights = BusLine(name: "Mountain Heights", stops: ["Depot", "Greenbag Road", "Brockway Ave.", "Sabraton", "Kroger", "Summers School Road", "Mountain Heights", "Kingwood Pike", "Mountaineer Mall", "Giant Eagle"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 8:05 AM - 4:15 PM.", twitter: "ML10brown")
        
        var graftonRoad = BusLine(name: "Grafton Road", stops: ["Depot", "Aldi", "Greenbag Road", "Ashton Estates", "Halleck Road", "Triune-Halleck VFD", "Walmart"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 9:10 AM - 3:05 PM.", twitter: "ML10brown")
        
        var pink = BusLine(name: "Pink Line", stops: ["Depot", "Public Safety Building", "Unity Manor", "Willey Street", "Mileground", "Honda Shop", "Glenmark Center", "Easton Hill", "Arnold Apartments", "Court House"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday 7:40 AM - 4:20 PM and Saturday 7:00 AM - 5:10 PM.", twitter: "MLpurplepink")
        
        //special case
        var grey = BusLine(name: "Grey Line", stops: ["Morgantown", "Fairmont", "Clarksburgh", "Mylan", "Towers", "Mountaineer Station", "Waynesburg", "Pittsburgh Airport", "Pittsburgh Greyhound Station"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Sunday and Saturday twice daily. Departs Morgantown on first trip heading Southbound at 6:15 AM. Departs Northbound at 7:55 AM. Departs Morgantown on second trip heading Southbound at 12:30 PM and Northbound 5:20 PM.", twitter: "ML29grey")
        
        //Late Night Service Thursday, Friday, & Saturday 9:00 PM - 2:30 PM the bus will also travel downtown to: Mountainlair, Court House, Public Safety Building
        var westRun = BusLine(name: "West Run", stops: ["West Run Complex", "Glen Mark & Bon Vista", "Suncrest Towne Centre", "Chestnut Ridge", "Stewart Place & Lewis Street", "Shorty Anderson's", "Hoffman/Van Guilder", "Express Mart", "Stewart & University", "Copper Beech"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Saturday starting at 7:10 AM. Monday through Wednesday service ends at 8:40. Thursday through Saturday, service ends at 2:30 AM. Service ends everyday at 4:50 PM during Winter, Summer, Spring, & Fall breaks.", twitter: "ML30wr")
        
        var blueAndGold = BusLine(name: "Blue and Gold Connector", stops: ["Towers PRT", "Towers", "Oakland", "Law School", "Grant Avenue", "Life Sciences", "Beechurst", "CAC", "Engineering PRT", "Evansdale Library", "Allen Hall"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"], hoursString: "Runs Monday through Friday 6:40 AM - 8:40 PM (6:20 PM during summer), Saturday 3:20 PM - 7:20 PM and Sunday 12:00 PM - 8:40 PM", twitter: "ML38bg")
        
        var valleyView = BusLine(name: "Valley View", stops: ["Valley View", "Chestnut Ridge", "Stewartstown Road", "Falling Run", "Life Sciences/B&E", "Stewart St.", "Willowdale"], map: UIImage(named: ""),
            hours: ["", "", "", "", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM", "6:00 PM - 2:50 AM"],
            hoursString: "Runs Monday through Friday 7:30 AM - 2:15 PM", twitter: "ML44vv")
        
        routes = [campusPM, downtownPM, green, gold, orange, green, gold, red, tyrone, purple, cassvile, blue, crown, mountainHeights, graftonRoad, pink, grey, westRun, blueAndGold, valleyView]
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "All bus services seen here are powered by Mountain Line, the Morgantown public transit system. For more information visit busride.org."
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func initilizeOnlineOffline () {
        let today = NSDate()
        let format = NSDateFormatter()
        format.dateFormat = "e"
        let dateInt = format.stringFromDate(today).toInt()

        for i in routes {
            // if time is in hours[dateInt] --> add to online array
            //else --> add to offline array
        }
    }
    
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.reloadData()
        super.setUIColors()
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "DiningViewController"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}