//
//  DiningViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class DiningViewController: CenterViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var labels: [String] = ["Cafe Evansdale",
        "Summit Cafe",
        "Arnold's Diner",
        "Boreman Bistro",
        "Terrace Room",
        "Hatfields"]
    
    var pictures: [String] = ["evansdale.jpg",
        "boreman.jpg",
        "evansdale.jpg",
        "boreman.jpg",
        "evansdale.jpg",
        "boreman.jpg"]

    override func viewDidLoad() {
        self.title = "D I N I N G"
        self.navigationItem.backBarButtonItem?.title = ""
        
        /*
            Set up table view.
        */
        self.tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        self.tableView.rowHeight = 100.0
        self.tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
        self.tableView.backgroundColor = colors.menuViewColor
        self.navigationItem.backBarButtonItem?.title = "h"
        
        /*
            Remove vertical scroll bar.
        */
        self.tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        /*
            Turn off translucency in Nav Bar.
        */
        // self.navigationController?.navigationBar.translucent = false

        super.viewDidLoad()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.labels[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        
        //selected background view color
        var bgColorView = UIView()
        bgColorView.backgroundColor = colors.selectColor
        cell.selectedBackgroundView = bgColorView
        
        cell.backgroundColor = colors.menuViewColor
        cell.textLabel?.textColor = colors.textColor
        
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        
        return cell
    }
    
    // Load Dining Hall view after cell selection.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected \(indexPath.row).")
        switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(CafeEvansdaleVC(), animated: true)
            default:
                break
        }
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "DiningViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "DiningViewController"
    }
    
}
