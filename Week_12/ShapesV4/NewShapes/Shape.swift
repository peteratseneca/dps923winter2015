//
//  Shape.swift
//  NewShapes
//
//  Created by Peter McIntyre on 2015-04-05.
//  Copyright (c) 2015 Seneca College. All rights reserved.
//

import UIKit

class Shape: UIView {
    
    // MARK: - Class members
    
    var shape: UIImage!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        // This is necessary (leave it out and you'll see why)
        self.backgroundColor = UIColor.clearColor()
        
        // Handle single taps
        let tapSingle = UITapGestureRecognizer(target: self, action: "tapSingleHandler")
        tapSingle.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapSingle)
        
        // Handle double taps
        let tapDouble = UITapGestureRecognizer(target: self, action: "tapDoubleHandler")
        tapDouble.numberOfTapsRequired = 2
        self.addGestureRecognizer(tapDouble)
        
        // Handle two-finger touch (tap)
        let tapTwo = UITapGestureRecognizer(target: self, action: "tapTwoHandler")
        tapTwo.numberOfTouchesRequired = 2
        self.addGestureRecognizer(tapTwo)
        
        // Handle pinch and zoom
        let pinchZoom = UIPinchGestureRecognizer(target: self, action: "pinchZoomHandler:")
        self.addGestureRecognizer(pinchZoom)
        
        // Handle rotation
        let rotate = UIRotationGestureRecognizer(target: self, action: "rotateHandler:")
        self.addGestureRecognizer(rotate)
        
        // Enable multi-touch on this view
        self.multipleTouchEnabled = true
    }
    
    // The Xcode editor and compiler required this method to be added
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // This method MUST be implemented in a UIView subclass like this
    override func drawRect(rect: CGRect) {
        
        shape.drawInRect(rect)
    }

    // MARK: - Touch handlers
    
    // FYI - The following are the touch-handling methods (for single-touch scenarios)
    // We're not using the first three in this app, but you could in other apps

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) { }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) { }
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) { }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {

        // This is the method that does the most work

        // In a single-touch scenario, the "touches" NSSet has one object in it
        // Get that object...
        // A UITouch object represents the presence or movement of a finger on the screen
        let aTouch = touches.anyObject() as UITouch
        
        // Now, get the starting and end points (in our drag operation)
        let location = aTouch.locationInView(self)
        let previousLocation = aTouch.previousLocationInView(self)
        
        // Get the frame for this view
        var shapeNewFrame = self.frame
        
        // Figure out where the new location is (compared to the previous location)
        let deltaX: CGFloat = location.x - previousLocation.x
        let deltaY: CGFloat = location.y - previousLocation.y
        
        // Set the new location
        shapeNewFrame.origin.x += deltaX
        shapeNewFrame.origin.y += deltaY;
        self.frame = shapeNewFrame
    }
    
    func tapSingleHandler() {

        // Move this to the top of the superview's view hierarchy
        self.superview?.bringSubviewToFront(self)
    }

    func tapDoubleHandler() {
        
        // Grow the shape by 10%
        var shapeNewFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width * 1.1, self.frame.height * 1.1)
        self.frame = shapeNewFrame
    }

    func tapTwoHandler() {
        
        // Shrink the shape by 10%
        var shapeNewFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width / 1.1, self.frame.height / 1.1)
        self.frame = shapeNewFrame
    }
    
    func pinchZoomHandler(recognizer: UIPinchGestureRecognizer) {
        
        // Handle pinch or zoom
        recognizer.view!.transform = CGAffineTransformScale(recognizer.view!.transform, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
    }
    
    func rotateHandler(recognizer: UIRotationGestureRecognizer) {
        
        // Handle rotation
        recognizer.view!.transform = CGAffineTransformRotate(recognizer.view!.transform, recognizer.rotation);
        recognizer.rotation = 0;
    }
    
}
