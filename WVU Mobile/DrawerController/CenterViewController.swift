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
        
        //let wv = UIImage(named: "fwv.png")
        //self.navigationItem.titleView = UIImageView(image: wv)
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "CenterViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "CenterViewController"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setUIColors()
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
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
    }
    
    func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    override func setUIColors() {
        super.setUIColors()
        self.view.backgroundColor = colors.mainViewColor
        self.navigationController?.navigationBar.barTintColor = colors.navBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, NSForegroundColorAttributeName: colors.textColor]
    }
}
