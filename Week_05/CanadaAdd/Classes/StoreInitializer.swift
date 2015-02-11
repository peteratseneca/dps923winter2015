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
        
        var on = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        on.provinceName = "Ontario"
        on.premierName = "Kathleen Wynne"
        on.areaInKm = 1076395
        on.dateCreated = newDate(1867, month: 7, day: 1)
        
        var bc = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        bc.provinceName = "British Columbia"
        bc.premierName = "Christy Clark"
        bc.areaInKm = 944735
        bc.dateCreated = newDate(1871, month: 7, day: 20)
        
        var nb = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        nb.provinceName = "New Brunswick"
        nb.premierName = "Brian Gallant"
        nb.areaInKm = 72908
        nb.dateCreated = newDate(1867, month: 7, day: 1)
        
        /*
        var mb = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        mb.provinceName = "Manitoba"
        mb.premierName = "Gary Selinger"
        mb.areaInKm = 649950
        mb.dateCreated = newDate(1870, month: 7, day: 15)
        
        var nl = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        nl.provinceName = "Newfoundland and Labrador"
        nl.premierName = "Paul Davis"
        nl.areaInKm = 405212
        nl.dateCreated = newDate(1949, month: 3, day: 31)
        */
        
        cdStack.saveContext()
    }
    
    // Create a new date object
    class func newDate(year: Int, month: Int, day: Int) -> NSDate {
        
        // Configure the objects we need to create the date
        let cal = NSCalendar(identifier: NSGregorianCalendar)!
        cal.timeZone = NSTimeZone(abbreviation: "GMT")!
        let dc = NSDateComponents()
        
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
