//
//  MenuViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/30/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MenuViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var labels: [String] = ["H O M E","D I N I N G","P R T","B U S E S","M A P","S P O R T S","N E W S","E V E N T S"]
    var images: [String] = ["home.png","coffee.png","tracks.png","bus.png","location.png","football.png","news.png","calendar.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "M  E  N  U"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 30)!]
        
        let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        
        //setup table view 
        self.tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.tableView.separatorStyle = .None
        
        //table visuals 
        self.tableView.backgroundColor = grayColor
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
        
        self.view.addSubview(self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "MenuViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MenuViewController"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Left will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Left did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Left will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Left did disappear")
    }
    
    // UI Table View Protocols 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.labels[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        
        cell.tintColor = UIColor.whiteColor()
        
        //selected background view color
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        cell.selectedBackgroundView = bgColorView
        
        let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        cell.backgroundColor = grayColor
        
        //icons
        //let image = UIImage(named: images[indexPath.row])
        //cell.imageView?.image = image
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
}
