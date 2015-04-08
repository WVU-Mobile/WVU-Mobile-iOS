//
//  LineViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/31/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import MapKit
import TwitterKit

class LineViewController: MainViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var line: BusLine!
    
    override func viewDidLoad() {
        self.title = line.name
        
        /*
        Set up table view.
        */
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.separatorStyle = .None
        tableView.backgroundColor = colors.menuViewColor
        tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.tableView)
        
        setUIColors()
        super.viewDidLoad()
    }
    
    // Return number of rows in section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return line.stops.count + 2
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        self.setupGesture()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.evo_drawerController?.removeGestureRecognizers()
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.evo_drawerController?.setupGestureRecognizers()
        super.viewWillDisappear(true)
    }
    
    // Return number of sections in table view.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return UITableViewAutomaticDimension
        } else if indexPath.row == 2{
            return 100
        }else {
            return 60
        }
    }
    
    // Return cell for row at index.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.textLabel?.textColor = colors.textColor
        
        if indexPath.row == 0 {
            var point1 = CLLocationCoordinate2DMake(39.645670, -79.974281);
            var point2 = CLLocationCoordinate2DMake(39.635020,-79.955750);
            var point3 = CLLocationCoordinate2DMake(39.655504, -79.957020);
            var point4 = CLLocationCoordinate2DMake(39.645670, -79.974281);
            
            var points = [point1, point2, point3, point4]
            var map = MKMapView(frame: CGRectMake(0, 0, self.view.bounds.width, 200))
            
            var geodesic = MKGeodesicPolyline(coordinates: &points[0], count: 4)
            map.addOverlay(geodesic)
            
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region1 = MKCoordinateRegion(center: point1, span: span)
            map.setRegion(region1, animated: true)
            
            cell.addSubview(map)
            
        } else if indexPath.row == 1 {
            cell.backgroundColor = colors.secondaryColor
            cell.textLabel?.text = line.hoursString
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 13)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .ByWordWrapping
        } else if indexPath.row == 2{
            Twitter.sharedInstance().logInGuestWithCompletion { (session: TWTRGuestSession!, error: NSError!) in
                // Swift
                let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
                let params = ["screen_name": self.line.twitter, "count" : "1"]
                var clientError : NSError?
                
                let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod("GET", URL: statusesShowEndpoint, parameters: params, error: &clientError)
                
                if request != nil {
                    Twitter.sharedInstance().APIClient.sendTwitterRequest(request) {
                        (response, data, connectionError) -> Void in
                        if (connectionError == nil) {
                            var jsonError : NSError?
                            let json = NSJSONSerialization.JSONObjectWithData(data,
                                options: nil,
                                error: &jsonError) as NSArray
                            
                            var js = json[0] as NSDictionary
                            var tweetID = js.objectForKey("id_str") as String
                            Twitter.sharedInstance().APIClient.loadTweetWithID(tweetID) { (tweet: TWTRTweet!, error: NSError!) in
                                var t = TWTRTweetView(tweet: tweet)
                                t.frame = CGRectMake(0, 0, self.view.bounds.width, 100)
                                t.theme = .Dark
                                t.backgroundColor = self.colors.headerColor
                                t.primaryTextColor = self.colors.textColor
                                    
                                cell.addSubview(t)
                            }
                            
                        }
                        else {
                            cell.textLabel?.text = "There was an error retrieving the twitter feed."
                        }
                    }
                }
                else {
                    cell.textLabel?.text = "There was an error retrieving the twitter feed."
                }
            }
            
            
            cell.backgroundColor = colors.headerColor

        }else{
            cell.backgroundColor = colors.mainViewColor
            cell.textLabel?.text = line.stops[indexPath.row-3]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 18)
            if !NSUserDefaults.standardUserDefaults().boolForKey("nightMode"){
                cell.imageView?.image = UIImage(named: "stops.png")
            }else{
                cell.imageView?.image = UIImage(named: "dstops.png")
            }
        }
        return cell
    }
    
    override func setUIColors() {
        self.tableView.backgroundColor = colors.menuViewColor
        self.tableView.reloadData()
        super.setUIColors()
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