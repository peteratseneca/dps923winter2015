//
//  ProvinceEdit.swift
//  Canada
//
//  Created by Peter McIntyre on 2015-02-10.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class ProvinceEdit: UIViewController {
    
    // MARK: - Properties

    var delegate: EditItemDelegate?
    var model: Model!
    var detailItem: AnyObject?
    
    // MARK: - User interface
    
    @IBOutlet weak var provinceName: UITextField!
    @IBOutlet weak var premierName: UITextField!
    @IBOutlet weak var areaInKm: UITextField!
    @IBOutlet weak var dateCreated: UIDatePicker!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - User interface tasks

    // Cancel...
    // Call back to the delegate, do not send an object
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.editItemController(self, didEditItem: nil)
    }
    
    // Save...
    // Call back to the delegate, send a new object
    @IBAction func save(sender: UIBarButtonItem) {
        
        // In this version of the app, we are not doing any data validation
        // or app/business logic checks - we would add those in the future 
        
        // Add a new object to the (managed object) context, and configure it
        let newItem = model.addNew("Province") as Province
        newItem.provinceName = provinceName.text
        newItem.premierName = premierName.text
        newItem.areaInKm = areaInKm.text.toInt()!
        newItem.dateCreated = dateCreated.date
        
        delegate?.editItemController(self, didEditItem: newItem)
    }
}

protocol EditItemDelegate {
    
    func editItemController(controller: AnyObject, didEditItem item: AnyObject?)
}
