//
//  CameraController.swift
//  What-Test
//
//  Created by Mahmud Assamaray on 9/22/15.
//  Copyright © 2015 Mahmud Assamaray. All rights reserved.
//


import Foundation
import UIKit
import AVFoundation

class Camera {
    
    //constants and variables
    //let captureSession = AVCaptureSession()
    
    //var captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    
    //functions and logic
    
    func getVideoCaptureDevice() -> AVCaptureDevice {
        return AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    }
    
    func beginSession(cameraView: UIView, superView: UIView) {
        let captureSession = AVCaptureSession()
        configureDeviceFocusMode()
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        let err : NSError? = nil
        
        do {
            try captureSession.addInput(AVCaptureDeviceInput(device: getVideoCaptureDevice()))
        }
        catch {
            print(err)
        }
        
        if (err != nil) {
            print("error: \(err?.localizedDescription)")
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        superView.layer.insertSublayer(previewLayer, below: cameraView.layer)
        previewLayer?.frame = superView.layer.frame
        captureSession.startRunning()
    }
    
    func configureDeviceFocusMode() {
        let device = getVideoCaptureDevice()
        
        do {
            try device.lockForConfiguration()
        } catch _ {
        }
        device.focusMode = .Locked
        device.unlockForConfiguration()
    }
    
    func updateDeviceSettings(focusValue : Float, isoValue: Float) {
        if let device = getVideoCaptureDevice() as AVCaptureDevice? {
            do {
                try device.lockForConfiguration()
                defer {
                    device.unlockForConfiguration()
                }
                device.setFocusModeLockedWithLensPosition(focusValue, completionHandler: { (time) -> Void in })
                
                let minISO = device.activeFormat.minISO
                let maxISO = device.activeFormat.maxISO
                let clampedISO = isoValue * (maxISO - minISO) + minISO
                
                device.setExposureModeCustomWithDuration(AVCaptureExposureDurationCurrent, ISO: clampedISO, completionHandler: { (time) -> Void in })
                
                device.unlockForConfiguration()
                
            } catch { }
        }
    }
}
//loops through available devices and looks for device with media type video/position on back
/*for device in devices {
if (device.hasMediaType(AVMediaTypeVideo)) {
if (device.position == AVCaptureDevicePosition.Back) {
captureDevice = device as? AVCaptureDevice
}
}
}*/