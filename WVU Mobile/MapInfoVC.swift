//
//  MapInfoVC.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/23/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MapInfoVC: MainViewController, UITableViewDelegate, UITableViewDataSource {
    var name: String!
    var code: String!
    var tableView: UITableView!
    var pinInfo: MapsJSON!
    var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        self.title = name
        
        // loader
        loading = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.size.width/2 - 10, self.view.frame.size.height/2 - 10, 20, 20))
        loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        loading.startAnimating()
        self.view.addSubview(loading)

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //JSON Objects
            self.pinInfo = MapsJSON(code: self.code)
            
            dispatch_async(dispatch_get_main_queue(), {
                // stop and remove the spinner on the background when done
                self.loading.stopAnimating()
                self.setupView()
            })
        })

        super.viewDidLoad()
    }
    
    func setupView(){
        /*
        Set up table view.
        */
        tableView = UITableView(frame: CGRectMake(0,64,self.view.bounds.width,self.view.bounds.height-64), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = colors.menuViewColor
        
        self.view.addSubview(self.tableView)
        
        setUIColors()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 100
        case 1:
            return 100
        default:
            return 150
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
            reuseIdentifier: "cell")
        cell.textLabel?.textColor = colors.textColor
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        cell.textLabel?.lineBreakMode = .ByWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .None

        switch indexPath.row {
        case 0:
            var image = UIImageView(frame: CGRectMake(0, 0, cell.bounds.width, cell.bounds.height))
            image.image = UIImage(named: "WBD-D.jpg")
            cell.backgroundView = image
        case 1:
           // cell.textLabel?.text = pinInfo.address
            cell.backgroundColor = colors.mainViewColor
        case 2:
            //cell.textLabel?.text = pinInfo.description
            cell.backgroundColor = colors.menuViewColor
        default:
            break
        }
        return cell
    }
    
    func pullJSON(){
        
    }
        
    override func viewWillAppear(animated: Bool) {
        self.evo_drawerController?.removeGestureRecognizers()
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.evo_drawerController?.setupGestureRecognizers()
        super.viewWillDisappear(true)
    }
    
    override func setUIColors() {
        super.setUIColors()
    }   
}