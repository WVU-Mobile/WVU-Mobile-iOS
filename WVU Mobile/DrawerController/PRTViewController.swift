//
//  PRTViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class PRTViewController: CenterViewController {
    var msgLabel: UILabel!
    var colorLabel: UILabel!
    var statusLabel: UILabel!
    var hoursLabel: UILabel!
    var imageView: UIImageView!

    override func viewDidLoad() {
        self.title = "P R T"
        //JSON Objects
        var prtInfo = PRTJSON()
        
        self.loadLabels()
        
        super.viewDidLoad()
    }
    
    func loadLabels() {
        
        var backgroundColor: UIColor
        var image: UIImage
        var statusText: String
        var statusTextColor: UIColor
        
        //JSON Objects
        var prtInfo = PRTJSON()
        
        //Switch view elements based on PRT status
        switch prtInfo.status{
            //PRT Okay
            case "1":
                backgroundColor = self.colors.greenColor
                image = UIImage(named: "check.png")!
                statusText = "O N L I N E"
                statusTextColor = self.colors.greenColor
            //PRT Partially down
            case "2", "5", "6", "10":
                backgroundColor = self.colors.orangeColor
                image = UIImage(named: "yield.png")!
                statusText = "W A R N I N G"
                statusTextColor = self.colors.orangeColor
            //PRT Out of Service
            case "4", "8", "9":
                backgroundColor = self.colors.redColor
                image = UIImage(named: "stop.png")!
                statusText = "O F F L I N E"
                statusTextColor = self.colors.pinkColor
            default:
                backgroundColor = self.colors.greenColor
                image = UIImage(named: "check.png")!
                statusText = "O N L I N E"
                statusTextColor = self.colors.greenColor
        }
        
        //Color label
        // height -- 37 %
        self.colorLabel = UILabel(frame: CGRectMake(0,64, self.view.bounds.width, (self.view.bounds.height - 64) * 0.37))
        self.colorLabel.backgroundColor = backgroundColor
        
        //Image view
        self.imageView = UIImageView(frame: CGRectMake(self.view.bounds.width/2 - (((self.view.bounds.height - 64) * 0.33)/2), 64 + ((self.view.bounds.height - 64) * 0.02) , (self.view.bounds.height - 64) * 0.33, (self.view.bounds.height - 64) * 0.33))
        self.imageView.image = image
        
        //Status Label
        // height -- 12 %
        self.statusLabel = UILabel(frame: CGRectMake(0, 64 + (self.view.bounds.height - 64) * 0.37, self.view.bounds.width, (self.view.bounds.height - 64) * 0.12))
        self.statusLabel.backgroundColor = self.colors.prtGray1
        self.statusLabel.text = statusText
        self.statusLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 40)
        self.statusLabel.textColor = statusTextColor
        self.statusLabel.textAlignment = .Center
        
        //Message Label
        // height --  29 %
        self.msgLabel = UILabel(frame: CGRectMake(0,64 + (self.view.bounds.height - 64) * 0.49,self.view.bounds.width,(self.view.bounds.height - 64) * 0.29))
        self.msgLabel.backgroundColor = self.colors.darkBlueColor
        self.msgLabel.textColor = self.colors.goldColor
        self.msgLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
        self.msgLabel.lineBreakMode = .ByWordWrapping
        self.msgLabel.numberOfLines = 0
        self.msgLabel.textAlignment = .Center
        self.msgLabel.text = prtInfo.message
        
        //Hours Label
        // height -- 22%
        self.hoursLabel = UILabel(frame: CGRectMake(0,64 + (self.view.bounds.height - 64) * 0.78,self.view.bounds.width,(self.view.bounds.height - 64) * 0.22))
        self.hoursLabel.backgroundColor = self.colors.blackColor
        self.hoursLabel.textColor = self.colors.goldColor
        self.hoursLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        self.hoursLabel.textAlignment = .Center
        
        var attributedText = NSAttributedString(string: "Monday to Friday 6:30 AM to 10:15 PM \nSaturday 9:30 AM to 5 PM \nSunday CLOSED")
        self.hoursLabel.attributedText = attributedText
        self.hoursLabel.lineBreakMode = .ByWordWrapping
        self.hoursLabel.numberOfLines = 3
        
        //Add to subviews
        self.view.addSubview(msgLabel)
        self.view.addSubview(colorLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(statusLabel)
        self.view.addSubview(hoursLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "PRTViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "PRTViewController"
    }

    func setupNotifications(){
        var prtDown = UILocalNotification()
        
    }
}