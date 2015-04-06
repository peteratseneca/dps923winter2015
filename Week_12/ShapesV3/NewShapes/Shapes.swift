//
//  ViewController.swift
//  NewShapes
//
//  Created by Peter McIntyre on 2015-04-05.
//  Copyright (c) 2015 Seneca College. All rights reserved.
//

import UIKit

class Shapes: UIViewController {
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - User interface actions

    // Create and configure instances of our custom view object

    @IBAction func toggleSquare(sender: UISwitch) {

        if sender.on {
            
            // Create a shape, first two arguments are relative to the upper-left corner
            // The last two arguments are the x-width and the y-height
            let newShape = Shape(frame: CGRectMake(20, 110, 100, 100))
            
            // Configure the properties
            newShape.shapeType = "Square"
            newShape.shapeColor = UIColor.orangeColor().CGColor
            newShape.tag = 1
            
            // Add the new shape to the view
            self.view.addSubview(newShape)

        } else {
            
            // Locate the shape to be removed
            let shapeToBeRemoved = self.view.viewWithTag(1)!
            // Remove the shape
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
    @IBAction func toggleRectangle(sender: UISwitch) {

        if sender.on {
            let newShape = Shape(frame: CGRectMake(60, 150, 100, 225))
            newShape.shapeType = "Rectangle"
            newShape.shapeColor = UIColor.redColor().CGColor
            newShape.tag = 2
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(2)!
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
    @IBAction func toggleCircle(sender: UISwitch) {

        if sender.on {
            let newShape = Shape(frame: CGRectMake(100, 190, 150, 150))
            newShape.shapeType = "Circle"
            newShape.shapeColor = UIColor.magentaColor().CGColor
            newShape.tag = 3
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(3)!
            shapeToBeRemoved.removeFromSuperview()
        }
    }
    
    @IBAction func toggleEllipse(sender: UISwitch) {
        if sender.on {
            let newShape = Shape(frame: CGRectMake(140, 230, 225, 100))
            newShape.shapeType = "Ellipse"
            newShape.shapeColor = UIColor.blueColor().CGColor
            newShape.tag = 4
            self.view.addSubview(newShape)
        } else {
            let shapeToBeRemoved = self.view.viewWithTag(4)!
            shapeToBeRemoved.removeFromSuperview()
        }
    }

}

