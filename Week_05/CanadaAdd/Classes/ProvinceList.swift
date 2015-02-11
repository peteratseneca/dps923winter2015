//
//  ProvinceList.swift
//  Canada
//
//  Created by Peter McIntyre on 2015-02-04.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreData

// Notice the protocol conformance
class ProvinceList: UITableViewController, NSFetchedResultsControllerDelegate, EditItemDelegate {
    
    // MARK: - Private properties
    
    var frc: NSFetchedResultsController!
    
    // MARK: - Properties
    
    // Passed in by the app delegate during app initialization
    var model: Model!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure and load the fetched results controller (frc)
        
        frc = model.frc_province
        
        // This controller will be the frc delegate
        frc.delegate = self;
        // No predicate (which means the results will NOT be filtered)
        frc.fetchRequest.predicate = nil;
        
        // Create an error object
        var error: NSError? = nil
        // Perform fetch, and if there's an error, log it
        if !frc.performFetch(&error) { println(error?.description) }
    }
    
    // MARK: - Table view methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.frc.sections?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionInfo = self.frc.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        self.configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        // Get the item for the selected index path
        let item = frc.objectAtIndexPath(indexPath) as Province
        // Configure the cell contents
        cell.textLabel!.text = item.provinceName
    }
    
    // This 'brute force' method will reload the table view
    // The method gets called by the Cocoa runtime,
    // when it notices that the fetched results controller's
    // 'fetchedObjects' (results) collection has changed
    // (because a new item was added)
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toProvinceDetail" {
            
            // Get a reference to the destination view controller
            let vc = segue.destinationViewController as ProvinceDetail
            
            // From the data source (the fetched results controller)...
            // Get a reference to the object for the tapped/selected table view row
            let item = frc.objectAtIndexPath(self.tableView.indexPathForSelectedRow()!) as Province
            
            // Pass on the object
            vc.detailItem = item
            
            // Configure the view if you wish
            vc.title = item.provinceName
        }
        
        if segue.identifier == "toProvinceEdit" {
            
            // Get a reference to the destination view controller
            let nav = segue.destinationViewController as UINavigationController
            let vc = nav.topViewController as ProvinceEdit

            // Configure the view
            vc.delegate = self
            vc.model = self.model
        }
            }

    // MARK: - Delegate methods
  
    func editItemController(controller: AnyObject, didEditItem item: AnyObject?) {
        
        self.model.saveChanges()
        
        // Dismiss the modal 'add item' controller
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
