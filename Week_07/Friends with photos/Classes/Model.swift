//
//  Model.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class Model {

    // MARK: - Private properties
    
    private var cdStack: CDStack!
    
    lazy private var applicationDocumentsDirectory: NSURL = {
        
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        }()
    
    // MARK: - Public properties
    
    lazy var frc_friend: NSFetchedResultsController = {
        
        // Use this as a template to create other fetched results controllers
        let frc = self.cdStack.frcForEntityNamed("Friend", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: "course,true,friendName,true", andSectionNameKeyPath: "course")
        
        return frc
        }()

    // MARK: - Public methods
    
    init() {
        
        // Check whether the app is being launched for the first time
        // If yes, check if there's an object store file in the app bundle
        // If yes, copy the object store file to the Documents directory
        // If no, create some new data if you need to

        // URL to the object store file in the app bundle
        let storeFileInBundle: NSURL? = NSBundle.mainBundle().URLForResource("ObjectStore", withExtension: "sqlite")

        // URL to the object store file in the Documents directory
        let storeFileInDocumentsDirectory: NSURL = applicationDocumentsDirectory.URLByAppendingPathComponent("ObjectStore.sqlite")

        // System file manager
        let fs: NSFileManager = NSFileManager()
        
        // Check whether this is the first launch of the app
        let isFirstLaunch: Bool = !fs.fileExistsAtPath(storeFileInDocumentsDirectory.path!)
        
        // Check whether the app is supplied with starter data in the app bundle
        let hasStarterData: Bool = storeFileInBundle != nil
        
        if isFirstLaunch {
            
            if hasStarterData {
                
                // Use the supplied starter data
                fs.copyItemAtURL(storeFileInBundle!, toURL: storeFileInDocumentsDirectory, error: nil)
                // Initialize the Core Data stack
                cdStack = CDStack()
                
            } else {
                
                // Initialize the Core Data stack before creating new data
                cdStack = CDStack()
                // Create some new data
                StoreInitializer.create(cdStack)
            }
            
        } else {
            
            // This app has been used/started before, so initialize the Core Data stack
            cdStack = CDStack()
        }
    }
    
    // Generic 'add new' method
    func addNew(entityName: String) -> AnyObject {
        
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: cdStack.managedObjectContext!) as NSManagedObject
    }

    func saveChanges() { cdStack.saveContext() }
    
    // Add more methods here for data maintenance
    // For example, get-all, get-some, get-one, add, update, delete
    // And other command-oriented operations

}
