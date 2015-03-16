//
//  CenterViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class CenterViewController: MainViewController {
    var leftDrawerButton = DrawerBarButtonItem()

    override func viewDidLoad() {
        self.setupLeftMenuButton()
        self.setUIColors()

        super.viewDidLoad()
    }
    
    // Center will appear.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Center did appear
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Center will disappear.
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // Center did disappear.
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // Set up left menu button.
    func setupLeftMenuButton() {
        //leftDrawerButton = DrawerBarButtonItem(target: self, action: "leftDrawerButtonPress:")
        //self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
        
        var menuView = UIImageView(frame: CGRectMake(0, 0, 30, 30))
        menuView.image = UIImage(named: "Menu.png")
        
        var menuButton = UIButton(frame: (menuView.bounds))
        menuButton.setBackgroundImage(menuView.image, forState: UIControlState.Normal)
        menuButton.addTarget(self, action: "leftDrawerButtonPress:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var menuButtonItem = UIBarButtonItem(customView: menuButton)
        self.navigationItem.leftBarButtonItem = menuButtonItem
        
        self.navigationController?.navigationBar.tintColor = self.colors.textColor
    }
    
    // Detect hamburger press.
    func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    // Set UI colors.
    override func setUIColors() {
        self.view.backgroundColor = colors.mainViewColor
        super.setUIColors()
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "CenterViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "CenterViewController"
    }
}