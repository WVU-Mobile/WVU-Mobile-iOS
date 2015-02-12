//
//  AppDelegate.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//


import UIKit
import QuartzCore

public struct DrawerVisualState {
    
    /**
    Creates a slide and scale visual state block that gives an experience similar to Mailbox.app. It scales from 90% to 100%, and translates 50 pixels in the x direction. In addition, it also sets alpha from 0.0 to 1.0.
    
    :returns: The visual state block.
    */
    public static var slideAndScaleVisualStateBlock: DrawerControllerDrawerVisualStateBlock {
        let visualStateBlock: DrawerControllerDrawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) -> Void in
            let minScale: CGFloat = 0.9
            let scale: CGFloat = minScale + (percentVisible * (1.0-minScale))
            var scaleTransform = CATransform3DMakeScale(scale, scale, scale)
            
            let maxDistance: CGFloat = 50
            let distance: CGFloat = maxDistance * percentVisible
            var translateTransform = CATransform3DIdentity
            var sideDrawerViewController: UIViewController?
            
            sideDrawerViewController = drawerController.leftDrawerViewController
            translateTransform = CATransform3DMakeTranslation((maxDistance - distance), 0, 0)
            
            
            sideDrawerViewController?.view.layer.transform = CATransform3DConcat(scaleTransform, translateTransform)
            sideDrawerViewController?.view.alpha = percentVisible
        }

        return visualStateBlock
    }
    
    /**
    Creates a slide visual state block that gives the user an experience that slides at the same speed of the center view controller during animation. This is equal to calling `parallaxVisualStateBlockWithParallaxFactor:` with a parallax factor of 1.0.
    
    :returns: The visual state block.
    */
    public static var slideVisualStateBlock: DrawerControllerDrawerVisualStateBlock {
        return self.parallaxVisualStateBlock(1.0)
    }
    

    /**
    Creates a parallax experience that slides the side drawer view controller at a different rate than the center view controller during animation. For every parallaxFactor of points moved by the center view controller, the side drawer view controller will move 1 point. Passing in 1.0 is the  equivalent of a applying a sliding animation, while passing in MAX_FLOAT is the equivalent of having no animation at all.
    
    :param: parallaxFactor The amount of parallax applied to the side drawer conroller. This value must be greater than 1.0. The closer the value is to 1.0, the faster the side drawer view controller will be parallaxing.
    
    :returns: The visual state block.
    */
    public static func parallaxVisualStateBlock(parallaxFactor: CGFloat) -> DrawerControllerDrawerVisualStateBlock {
        let visualStateBlock: DrawerControllerDrawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) -> Void in
            
            assert({ () -> Bool in
                return parallaxFactor >= 1.0
            }(), "parallaxFactor must be >= 1.0")
            
            var transform: CATransform3D = CATransform3DIdentity
            var sideDrawerViewController: UIViewController?
            
            sideDrawerViewController = drawerController.leftDrawerViewController
            let distance: CGFloat = max(drawerController.maximumLeftDrawerWidth, drawerController.visibleLeftDrawerWidth)
                
            if (percentVisible <= 1.0) {
                transform = CATransform3DMakeTranslation((-distance) / parallaxFactor + (distance * percentVisible / parallaxFactor), 0.0, 0.0)
            } else {
                transform = CATransform3DMakeScale(percentVisible, 1.0, 1.0)
                transform = CATransform3DTranslate(transform, drawerController.maximumLeftDrawerWidth * (percentVisible - 1.0) / 2, 0.0, 0.0)
            }
        sideDrawerViewController?.view.layer.transform = transform
        }
            
        return visualStateBlock
    }
}