//
//  ExampleList.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreData

// Notice the protocol conformance
class ExampleList: UITableViewController, NSFetchedResultsControllerDelegate {

    // MARK: - Private properties
    
    var frc: NSFetchedResultsController!
    var arr: [AnyObject]?
    
    // MARK: - Properties

    // Passed in by the app delegate during app initialization
    var model: Model!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Increase the table cell height
        tableView.rowHeight = 55.0
        
        // Configure the data from the network
        
        // First, listen for the notification (from the WebServiceRequest instance)
        // that indicates that the download is complete
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "programsGet", name: "Model_programs_fetch_completed", object: nil)
        // Next, cause the request to run
        arr = model.programsGet()

        // The frc-related code below is not used in this controller
        // The table view data comes from the web service fetch results
        
        // Configure and load the fetched results controller (frc)
        
        frc = model.frc_example

        // This controller will be the frc delegate
        frc.delegate = self;
        // No predicate (which means the results will NOT be filtered)
        frc.fetchRequest.predicate = nil;
        
        // Create an error object
        var error: NSError? = nil
        // Perform fetch, and if there's an error, log it
        if !frc.performFetch(&error) { println(error?.description) }
    }

    func programsGet() {
        
        // This method is called when there's new/updated data from the network
        // It's the 'listener' method
        
        // Diagnostic
        println("Get all:\n\(model.programs.description)")
        
        // Set the table view data source to the proper value
        arr = model.programs
        tableView.reloadData()
    }
    
    // MARK: - Table view methods

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
        //return self.frc.sections?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr!.count
        
        //let sectionInfo = self.frc.sections![section] as NSFetchedResultsSectionInfo
        //return sectionInfo.numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        self.configureCell(cell, atIndexPath: indexPath)

        return cell
    }

    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        let item: AnyObject = arr![indexPath.row]

        cell.textLabel!.text = item.valueForKey("Code") as? String
        
        cell.detailTextLabel!.text = item.valueForKey("Name") as? String
        
        //let item: AnyObject = frc.objectAtIndexPath(indexPath)
        //cell.textLabel!.text = item.valueForKey("attribute1")! as? String
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toExampleDetail" {

            // Get a reference to the destination view controller
            let vc = segue.destinationViewController as ExampleDetail
            
            // From the data source (the fetched results controller)...
            // Get a reference to the object for the tapped/selected table view row
            let item: AnyObject = arr![self.tableView.indexPathForSelectedRow()!.row]
            //let item: AnyObject = frc.objectAtIndexPath(self.tableView.indexPathForSelectedRow()!)
            
            // Pass on the object
            vc.detailItem = item
            
            // Configure the view if you wish
            vc.title = item.valueForKey("Code") as? String
        }
    }

}
