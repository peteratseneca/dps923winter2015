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
    
    var shapeType: NSString!
    var shapeColor: CGColorRef!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // This is necessary (leave it out and you'll see why)
        self.backgroundColor = UIColor.clearColor()
    }
    
    // The Xcode editor and compiler required this method to be added
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // This method MUST be implemented in a UIView subclass like this
    override func drawRect(rect: CGRect) {
        
        // Get the graphics context
        let context = UIGraphicsGetCurrentContext()
        
        // Configure the drawing settings with the passed-in color
        CGContextSetLineWidth(context, 1.0);
        CGContextSetStrokeColorWithColor(context, shapeColor);
        CGContextSetFillColorWithColor(context, shapeColor);
        
        // Draw the shape's word/name inside the passed-in rectangle
        
        switch self.shapeType {
            
        case "Square", "Rectangle":
            // ...AddRect... can draw both squares and rectangles
            CGContextAddRect(context, rect);
            CGContextFillRect(context, rect);
            
        case "Circle", "Ellipse":
            // ...AddEllipse... can draw both circles and ellipses
            CGContextAddEllipseInRect(context, rect);
            CGContextFillEllipseInRect(context, rect);
            
        default:
            break
        }
        
        // Position the shape's word/name a little better
        // This is a hacky way to do it, but it keeps the lines of code to a minimum
        shapeType = "\n\(shapeType)"
        let centerTextStyle = NSMutableParagraphStyle()
        centerTextStyle.alignment = NSTextAlignment.Center
        
        // Draw the shape's word/name on the shape
        shapeType.drawInRect(rect, withAttributes: [NSFontAttributeName : UIFont.systemFontOfSize(20), NSParagraphStyleAttributeName : centerTextStyle])
    }

    // MARK: - Touch handlers
    
    // The following are the touch-handling methods (for single-touch scenarios)

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

}
