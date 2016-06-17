//
//  ViewController.swift
//  What-Test
//
//  Created by Mahmud Assamaray on 9/22/15.
//  Copyright © 2015 Mahmud Assamaray. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //variables
    @IBOutlet var SuperView: UIView!
    @IBOutlet weak var CameraView: UIView!
    
    let camera = Camera()
    
    //functions and logic
    func touchPercentage(touch: UITouch) -> CGPoint {
        let screenSize = UIScreen.mainScreen().bounds.size
        
        var touchPercent = CGPointZero
        touchPercent.x = touch.locationInView(SuperView).x / screenSize.width
        touchPercent.y = touch.locationInView(SuperView).y / screenSize.height
        
        return touchPercent
        
    }
    
    //move to CameraViewController
    /*override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    if (!blurViewOn) {
    let touchPercent = touchPercentage(touches.first as! UITouch)
    camera.updateDeviceSettings(Float(touchPercent.x), isoValue: Float(touchPercent.y))
    }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    if (!blurViewOn) {
    let touchPercent = touchPercentage(touches.first as! UITouch)
    camera.updateDeviceSettings(Float(touchPercent.x), isoValue: Float(touchPercent.y))
    }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            /*if ((camera.getVideoCaptureDevice() as AVCaptureDevice?) != nil) {
            camera.beginSession(CameraView, superView: SuperView)
            
            }
            else {
            
            }*/
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

