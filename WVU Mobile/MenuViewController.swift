//
//  MenuViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/30/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MenuViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "M  E  N  U"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 30)!]
        
        let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        self.view.backgroundColor = grayColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
