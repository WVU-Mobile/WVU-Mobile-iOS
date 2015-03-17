//
//  MainViewController.swift
//  WVU Mobile
//
//  Created by Ricky Deal on 3/16/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MainViewController: ViewController {    
    override func viewDidLoad() {
        self.setupGesture()
        self.setUIColors()
        super.viewDidLoad()
    }
    
    func setupGesture(){
        /*
        Toggle night mode
        */
        let tapGesture = UITapGestureRecognizer(target: self, action: "toggleNightMode")
        tapGesture.numberOfTapsRequired = 3
        self.navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }
    
    // Toggle Night Mode
    func toggleNightMode() {
        colors.nightModeToggle = !colors.nightModeToggle
        colors.toggleUIColors()
        self.setUIColors()
    }
    
    // Set UI colors.
    override func setUIColors() {
        self.view.backgroundColor = colors.mainViewColor
        self.navigationController?.navigationBar.barTintColor = colors.navBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 30)!, NSForegroundColorAttributeName: colors.textColor]
        self.view.backgroundColor = self.colors.menuViewColor
        self.navigationController?.navigationBar.tintColor = self.colors.textColor
        super.setUIColors()
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