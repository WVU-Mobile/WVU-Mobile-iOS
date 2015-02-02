//
//  ViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MainViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLeftMenuButton()
        
        //UI Colors
        let blueColor = UIColor(red: 159/255, green: 197/255, blue: 232/255, alpha: 1.0)
        let yellowColor = UIColor(red: 255/255, green: 242/255, blue: 204/255, alpha: 1.0)
        //let goldColor = UIColor(red: 247/255, green:222/255, blue:150/255, alpha:1.0)
        let goldColor = UIColor(red: 235/255, green:211/255, blue:140/255, alpha:0.95)
        //let goldColor = UIColor(red: 241/255, green:196/255, blue:15/255, alpha: 1.0)
        let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        
        //let wv = UIImage(named: "fwv.png")
        //self.navigationItem.titleView = UIImageView(image: wv)
                
        self.view.backgroundColor = goldColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "MainViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MainViewController"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Center will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Center did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Center will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Center did disappear")
    }
    
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: "leftDrawerButtonPress:")
        //let leftDrawerButton = UIBarButtonItem(image: UIImage(named: "menu.png"), style: UIBarButtonItemStyle.Plain, target: self, action: "leftDrawerButtonPress")
        //leftDrawerButton.tintColor = UIColor.blackColor()
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
    }
    
    func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}
