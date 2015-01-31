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
        
        let twoFingerDoubleTap = UITapGestureRecognizer(target: self, action: "twoFingerDoubleTap:")
        twoFingerDoubleTap.numberOfTapsRequired = 2
        twoFingerDoubleTap.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(twoFingerDoubleTap)
        
        self.setupLeftMenuButton()
        
        let barColor = UIColor(red: 247/255, green: 249/255, blue: 250/255, alpha: 1.0)
        
        self.view.backgroundColor = UIColor(red: 150/255, green: 200/255, blue: 250/255, alpha: 1.0)
        self.navigationController?.view.layer.cornerRadius = 10.0
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
    
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: "leftDrawerButtonPress:")
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
    }
    
    func twoFingerDoubleTap(gesture: UITapGestureRecognizer) {
        self.evo_drawerController?.bouncePreviewForDrawerSide(.Right, completion: nil)
    }
    
    func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}
