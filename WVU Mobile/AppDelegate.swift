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
        
        //Notifications
        let types = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(types)
        
        //Backgroud refresh
        UIApplication.sharedApplication().setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        
        return true
    }
    
    //PRT Notifications
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        println("Complete");
        
        var prtStatus = PRTJSON()
        
        if prtStatus.status != "1"{
            var notify = UILocalNotification()
            notify.alertBody = prtStatus.message
            notify.fireDate = NSDate()
            
            UIApplication.sharedApplication().scheduleLocalNotification(notify)
            
            completionHandler(UIBackgroundFetchResult.NewData)
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        NSLog("My Device toke in : \(deviceToken)")
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
