//
//  HorizontalSegue.swift
//  What-Test
//
//  Created by Mahmud Assamaray on 9/22/15.
//  Copyright © 2015 Mahmud Assamaray. All rights reserved.
//

import Foundation
import UIKit

class horizontalSegue : UIStoryboardSegue {
 
    override func perform() {
        
        let oldView = self.sourceViewController.view as UIView
        let newView = self.destinationViewController.view as UIView
    
        oldView.window?.insertSubview(newView, aboveSubview: oldView)
        newView.window?.insertSubview(oldView, atIndex: 0)
        
        newView.center.x = oldView.center.x + oldView.frame.width
        newView.center.y = oldView.center.y
        
        UIView.animateWithDuration(0.45, animations: { newView.center = oldView.center }, completion:  { finished in Void() })
        
    }
}

