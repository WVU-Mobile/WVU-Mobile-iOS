//
//  NewFeedViewController.swift
//  RSSwift
//
//  Created by Arled Kola on 27/10/2014.
//  Copyright (c) 2014 Arled. All rights reserved.
//

import UIKit

class NewFeedViewController: ViewController {

    var textFieldNewFeedUrl =  UITextField()
    
    // Reusbale member
    var onDataAvailable : ((data: NSURL) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func doneTapped(sender: AnyObject) {
        
        // Send new Url
        self.onDataAvailable?(data: NSURL(string: textFieldNewFeedUrl.text)!)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
