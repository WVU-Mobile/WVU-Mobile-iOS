//
//  AppDelegate.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow!
    var drawerController: DrawerController!
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        let menuViewController = MenuViewController()
        let mainViewController = MainViewController()
        
        let mainNavController = UINavigationController(rootViewController: mainViewController)
        mainNavController.restorationIdentifier = "MainNavigationControllerRestorationKey"
        
        let menuNavController = UINavigationController(rootViewController: menuViewController)
        menuNavController.restorationIdentifier = "MenuNavigationControllerRestorationKey"
        
        self.drawerController = DrawerController(centerViewController: mainNavController, leftDrawerViewController: menuNavController)
        self.drawerController.showsShadows = false
        
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.maximumLeftDrawerWidth = 220.0
        self.drawerController.openDrawerGestureModeMask = .All
        self.drawerController.closeDrawerGestureModeMask = .All
        
        /*self.drawerController.drawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) in
            let block = ExampleDrawerVisualStateManager.sharedManager.drawerVisualStateBlockForDrawerSide(drawerSide)
            block?(drawerController, drawerSide, percentVisible)
        }*/
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let tintColor = UIColor(red: 29 / 255, green: 173 / 255, blue: 234 / 255, alpha: 1.0)
        self.window.tintColor = tintColor
        
        // YO -Ricky
        self.window.rootViewController = self.drawerController
        
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window.backgroundColor = UIColor.whiteColor()
        self.window.makeKeyAndVisible()
        
        return true
    }
    
    func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [AnyObject], coder: NSCoder) -> UIViewController? {
        if let key = identifierComponents.last as? String {
            if key == "Drawer" {
                return self.window.rootViewController
            }
            else if key == "MainNavigationControllerRestorationKey" {
                return (self.window.rootViewController as DrawerController).centerViewController
            }
            else if key == "MenuNavigationControllerRestorationKey" {
                return (self.window.rootViewController as DrawerController).leftDrawerViewController
            }
            else if key == "MenuViewController" {
                if let leftVC = (self.window.rootViewController as? DrawerController)?.leftDrawerViewController {
                    if leftVC.isKindOfClass(UINavigationController) {
                        return (leftVC as UINavigationController).topViewController
                    }
                    else {
                        return leftVC
                    }
                }
            }
        }
        return nil
    }
}
