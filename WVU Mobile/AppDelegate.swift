//
//  AppDelegate.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow!
    var drawerController: DrawerController!
    var googleMapsApiKey = "AIzaSyCKBl3CNZJPKGBU8Nf6tiO3sTVhF4QyIj0"
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {        
        let menuViewController = MenuViewController()
        let mainViewController = HomeViewController()
        
        let mainNavController = UINavigationController(rootViewController: mainViewController)
        mainNavController.restorationIdentifier = "MainNavigationControllerRestorationKey"
        
        let menuNavController = UINavigationController(rootViewController: menuViewController)
        menuNavController.restorationIdentifier = "MenuNavigationControllerRestorationKey"
        
        self.drawerController = DrawerController(centerViewController: mainNavController, leftDrawerViewController: menuNavController)
        self.drawerController.showsShadows = true
        
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.maximumLeftDrawerWidth = (UIScreen.mainScreen().bounds.width * 0.8)
        self.drawerController.openDrawerGestureModeMask = .All
        self.drawerController.closeDrawerGestureModeMask = .All
        self.drawerController.shouldStretchDrawer = false
        
        //set Animation type
        //self.drawerController.drawerVisualStateBlock = DrawerVisualState.slideAndScaleVisualStateBlock
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // YO -Ricky
        self.window.rootViewController = self.drawerController
        
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window.backgroundColor = UIColor.whiteColor()
        self.window.makeKeyAndVisible()
        
        Parse.setApplicationId("aOEBvv5NNNAejk2IU1YKf2bhsEDFEChoGFncrpxc", clientKey: "ZAU0z5VPO7fFYloY39XLbC1clHf9ixPLC3L5lwBk")
        
        let userNotificationTypes = (UIUserNotificationType.Alert |
            UIUserNotificationType.Badge |
            UIUserNotificationType.Sound);
        
        let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        //Google Maps key
        GMSServices.provideAPIKey(googleMapsApiKey)
        
        //Twitter
        Fabric.with([Twitter()])

        
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        /*let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()*/
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        //PFPush.handlePush(userInfo)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        NSLog("Failed to get : \(error)")
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
