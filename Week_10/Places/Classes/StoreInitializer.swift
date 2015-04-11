//
//  StoreInitializer.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class StoreInitializer {
    
    class func create(cdStack: CDStack) {
        
        // Add code to create data
        
        // For each object that you want to create...
        // Initialize an object
        // Set its properties
        // Save changes
        
        // This app will work with the "Example" entity that you can see in the object model
        
        // If you have not yet run the app (in the simulator), 
        // and you want to create your own object model, you can...
        // Comment out (or delete) the 'create data' code below
        // Delete the entity in the object model
        // Edit the Model class, and its fetched results controller
        // Comment out, delete, or edit the data access statements in the '...List' and '...Detail' controllers

        // If you have did run the app (in the simulator),
        // you will have to do the above, AND delete the app from the simulator
        
        let pb = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        pb.address = "111 Wellington Street, Ottawa, Ontario, Canada"
        
        let cw = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        cw.address = "9580 Jane Street, Vaughan, Ontario, Canada"
        
        let mr = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        mr.address = "1260 Remembrance Road, Montreal, Quebec, Canada"
        
        let wh = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        wh.address = "1600 Pennsylvania Avenue, Washington, D.C., United States of America"
        
        let bms = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        bms.address = "151 Speedway Boulevard, Bristol, Tennessee, United States of America"
        
        let apl = NSEntityDescription.insertNewObjectForEntityForName("Place", inManagedObjectContext: cdStack.managedObjectContext!) as! Place
        apl.address = "1 Infinite Loop, Cupertino, California, United States of America"

        cdStack.saveContext()
    }
    
    // Create a new date object
    class func newDate(year: Int, month: Int, day: Int) -> NSDate {
        
        // Configure the objects we need to create the date
        var cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        cal.timeZone = NSTimeZone(abbreviation: "GMT")!
        var dc = NSDateComponents()
        
        // Set the values of the date components
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = 12
        dc.minute = 0
        dc.second = 0
        
        return cal.dateFromComponents(dc)!
    }
    
}
