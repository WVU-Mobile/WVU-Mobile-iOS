//
//  CenterViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class CenterViewController: ViewController {
    
    override func viewDidLoad() {
        self.setupLeftMenuButton()
        self.setUIColors()
    
        self.view.tag = ViewTag.Center.rawValue

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
    
    // IDK
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: "leftDrawerButtonPress:")
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
    }
    
    // IDK
    func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    // IDK
    override func setUIColors() {
        self.view.backgroundColor = colors.mainViewColor
        self.navigationController?.navigationBar.barTintColor = colors.navBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 30)!, NSForegroundColorAttributeName: colors.textColor]
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
