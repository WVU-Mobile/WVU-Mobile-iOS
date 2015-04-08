//
//  PRTTableViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/20/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class PRTViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var myViewControllers : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.     
        self.delegate = self
        self.dataSource = self
        self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200)
        
        let p1 = aViewController()
        let p2 = bViewController()
        
        myViewControllers = [p1,p2]
        
        
        for var index = 0; index < myViewControllers.count; ++index {
            NSLog("\(myViewControllers[index])")
        }
        
       
        
        let startingViewController = self.viewControllerAtIndex(0)
        let viewControllers: NSArray = [startingViewController]
        
        self.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: {(done: Bool) in
        })
        
        NSLog("loaded!");
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Private Function
    func viewControllerAtIndex (index: NSInteger) -> UIViewController{
        return myViewControllers[index]
    }
    
    //Delegates and Datasource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        NSLog("Entered to BeforeViewController")
        
        var index = find(myViewControllers, viewController)!
        NSLog("\(index)")
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index--
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        NSLog("Entered to BeforeViewController")
        
        var index = find(myViewControllers, viewController)!
        NSLog("\(index)")
        if index == NSNotFound {
            return nil
        }
        index++
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return myViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "PRTTableViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "PRTTableViewController"
    }
    
    override init(transitionStyle: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [NSObject : AnyObject]?){
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
