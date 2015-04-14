//
//  TestMapTable.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 4/13/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit

class TestMapTable: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    struct busCoordinate {
        var code: String
        var name: String
    }
    
    var tableView: UITableView!
    var filtered = [busCoordinate]()
    var searchBar: UISearchBar!
    
    var coords: Array <busCoordinate> =
        [busCoordinate(code: "WDB-D",name:"Woodburn Hall"),
        busCoordinate(code: "AEL-E", name:"Aerodynamics Laboratory"),
        busCoordinate(code: "AER-E", name:"Advanced Engineering Research Building"),
        busCoordinate(code: "AGS-E", name:"Agricultrial Sciences Building"),
        busCoordinate(code: "ALH",   name:"Allen Hall"),
        busCoordinate(code: "ARM-D", name:"Armstrong Hall"),
        busCoordinate(code: "ASA-E", name:"Agricultural Sciences Annex"),
        busCoordinate(code: "BIC-E", name:"Bicentennial Housing"),
        busCoordinate(code: "BKH-D", name:"Brooks Hall"),
        busCoordinate(code: "BMRF-H",name:"Biomedical Research Facility"),
        busCoordinate(code: "BUE-D", name:"Business and Economics Building"),
        busCoordinate(code: "CAC-E", name:"Creative Arts Center"),
        busCoordinate(code: "CHI-D", name:"Chitwood Hall"),
        busCoordinate(code: "CKH-D", name:"Clark Hall"),
        busCoordinate(code: "CLN-D", name:"Colson Hall"),
        busCoordinate(code: "COL-E", name:"Coliseum"),
        busCoordinate(code: "CS1-E", name:"Crime Scene House 1"),
        busCoordinate(code: "CS2-E", name:"Crime Scene House 2"),
        busCoordinate(code: "CS3-E", name:"Crime Scene House 3"),
        busCoordinate(code: "CSG-E", name:"Crime Scene Garage"),
        busCoordinate(code: "CRL-D", name:"Chemistry Research Laboratory"),
        busCoordinate(code: "CRP-E", name:"Chestnut Ridge Prof Building"),
        busCoordinate(code: "CRR-E", name:"Chestnut Ridge Research Building"),
        busCoordinate(code: "EIE-D", name:"Eisland Hall"),
        busCoordinate(code: "EMH-D", name:"Elizabeth Moore Hall"),
        busCoordinate(code: "ERA-E", name:"ERC RFL Annex Building"),
        busCoordinate(code: "ERB-E", name:"Engineering Research Building"),
        busCoordinate(code: "ESB-E", name:"Engineering Sciences Building"),
        busCoordinate(code: "EVL-E", name:"Evansdale Library"),
        busCoordinate(code: "EXT-E", name:"Pierpont Extended Housing"),
        busCoordinate(code: "FCH-E", name:"Fieldcrest Hall"),
        busCoordinate(code: "FH1-D", name:"650 Spruce"),
        busCoordinate(code: "FH2-D", name:"660 North High"),
        busCoordinate(code: "FH3-D", name:"670 North High"),
        busCoordinate(code: "FH4-D", name:"672 North High"),
        busCoordinate(code: "FH5-D", name:"216 Belmar"),
        busCoordinate(code: "FH6-D", name:"225 Belmar"),
        busCoordinate(code: "FRM-E", name:"Animal Science Farm"),
        busCoordinate(code: "GRH-E", name:"Green House 1"),
        busCoordinate(code: "GSK-D", name:"Gaskins House"),
        busCoordinate(code: "HOD-D", name:"Hodges Hall"),
        busCoordinate(code: "HSN-H", name:"Health Science North"),
        busCoordinate(code: "HSS-H", name:"Health Science South"),
        busCoordinate(code: "KNP-D", name:"Knapp Hall"),
        busCoordinate(code: "LIB-D", name:"Charles C. Wise Library"),
        busCoordinate(code: "LSB-D", name:"Life Science Building"),
        busCoordinate(code: "LWC-E", name:"Law Center"),
        busCoordinate(code: "MAR-D", name:"Martin Hall"),
        busCoordinate(code: "MBRC-H",name:"Mary Bab Randolph Cancer Center"),
        busCoordinate(code: "MEC-E", name:"Museum Education Center"),
        busCoordinate(code: "MHH-D", name:"Ming Hsieh Hall"),
        busCoordinate(code: "MRB-E", name:"Mineral Resouces Building"),
        busCoordinate(code: "MTL-D", name:"Mountain Lair"),
        busCoordinate(code: "NAT-E", name:"Natatorium-Shell"),
        busCoordinate(code: "NIO-E", name:"NIOSH Building"),
        busCoordinate(code: "NRC-E", name:"National Research Center"),
        busCoordinate(code: "NSH-E", name:"North Street House"),
        busCoordinate(code: "NUR-E", name:"Nursery School"),
        busCoordinate(code: "OGH-D", name:"Oglebay Hall"),
        busCoordinate(code: "OWP-D", name:"One Waterfront Place"),
        busCoordinate(code: "PAS-E", name:"CPASS Building"),
        busCoordinate(code: "PER-E", name:"Percival Hall"),
        busCoordinate(code: "PSK-E", name:"Milan Pusker Stadium"),
        busCoordinate(code: "PUR-D", name:"Puritan House"),
        busCoordinate(code: "SRC-E", name:"Student Recreation Center"),
        busCoordinate(code: "RRI-D", name:"Regional Research Institute"),
        busCoordinate(code: "SAS-E", name:"South Agricultrial Sciences"),
        busCoordinate(code: "SMT-D", name:"Summit"),
        busCoordinate(code: "SSC-D", name:"Student Services Center"),
        busCoordinate(code: "STA-D", name:"Stansbury Hall"),
        busCoordinate(code: "STH-E", name:"Student Health"),
        busCoordinate(code: "USC-E", name:"University Services Center"),
        busCoordinate(code: "VNB-D", name:"Vandalia Blue"),
        busCoordinate(code: "VNG-D", name:"Vandalia Gold"),
        busCoordinate(code: "WHI-D", name:"White Hall"),
        busCoordinate(code: "STL-D", name:"Stalnaker Hall"),
        busCoordinate(code: "SMT-D", name:"Summit"),
        busCoordinate(code: "SPH-D", name:"International House"),
        busCoordinate(code: "MCA-E", name:"Med Center Apartment - Building K"),
        busCoordinate(code: "MCB-E", name:"Med Center Apartment - Building J"),
        busCoordinate(code: "LYT-E", name:"Lyon Tower"),
        busCoordinate(code: "LNC-D", name:"Lincon Hall"),
        busCoordinate(code: "HON-D", name:"Honors Hall"),
        busCoordinate(code: "DAD-D", name:"Dadisman Dorm"),
        busCoordinate(code: "BXT-E", name:"Braxton Towner"),
        busCoordinate(code: "BRN-D", name:"Boreman Hall North"),
        busCoordinate(code: "BRS-D", name:"Boreman Hall South"),
        busCoordinate(code: "BRF-D", name:"Boreman Residential Facility"),
        busCoordinate(code: "BRT-E", name:"Brook Tower"),
        busCoordinate(code: "BTT-E", name:"Bennett Tower"),
        busCoordinate(code: "ARH-D", name:"Arnold Hall"),
        busCoordinate(code: "ST2", name:"Mountainlair Parking Garage"),
        busCoordinate(code: "ST7", name:"Public Parking"),
        busCoordinate(code: "PRT", name:"Walnut PRT Station"),
        busCoordinate(code: "PRT", name:"Beechurst PRT Station"),
        busCoordinate(code: "PRT", name:"Engineering PRT Station"),
        busCoordinate(code: "PRT", name:"Towers PRT Station"),
        busCoordinate(code: "PRT", name:"Medical PRT Station")]
    
    
    override func viewDidLoad() {
        self.title = "Buses"
        
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
        tableView.showsVerticalScrollIndicator = false
        
        searchBar = UISearchBar(frame: CGRectMake(0, 0, self.view.bounds.width, 40))
        searchBar.delegate = self
        
        self.tableView.addSubview(searchBar)
        self.view.addSubview(self.tableView)
        
        super.viewDidLoad()
        self.tableView.reloadData()

    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filtered.count
        } else {
            return self.coords.count
        }
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = coords[indexPath.row].code
        cell.detailTextLabel?.text = coords[indexPath.row].name
        
        var c : busCoordinate
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            c = filtered[indexPath.row]
        } else {
            c = coords[indexPath.row]
        }
        
        // Configure the cell
        cell.textLabel?.text = c.code
        cell.detailTextLabel?.text = c.name
        
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filtered = self.coords.filter({(cor : busCoordinate) -> Bool in
        let catMatch = cor.code.rangeOfString(searchText)
        let stringMatch = cor.name.rangeOfString(searchText)
        return (catMatch != nil) && (stringMatch != nil)
        })
    }

    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "Map"
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}