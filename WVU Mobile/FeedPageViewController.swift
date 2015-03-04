//
//  FeedPageViewController.swift
//  RSSwift
//
//  Created by Arled Kola on 27/10/2014.
//  Copyright (c) 2014 Arled. All rights reserved.
//

import UIKit

class FeedPageViewController: ViewController {

    var textView: UITextView!
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()
    var selectedFeedURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = self.colors.goldColor

        textView = UITextView(frame: self.view.bounds)
        textView.editable = false
        textView.contentInset = UIEdgeInsets(top: +60,left: 0,bottom: 0,right: 0)
        // Populate Text Area
        textView.text = "\(selectedFeedTitle)\n\n\(selectedFeedFeedContent)"
        
        self.view.addSubview(textView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
