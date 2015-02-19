//
//  ExampleDetail.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class ExampleDetail: UIViewController {

    // Data object, passed in by the parent view controller in the segue method
    var detailItem: AnyObject!
    
    // MARK: - User interface
    
    @IBOutlet weak var programName: UILabel!
    @IBOutlet weak var credential: UILabel!
    @IBOutlet weak var semesters: UILabel!
    @IBOutlet weak var programDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        programName.text = self.detailItem.valueForKey("Name") as? String
        
        credential.text = self.detailItem.valueForKey("Credential") as? String
        
        let sems = self.detailItem.valueForKey("Semesters") as Int
        semesters.text = "Semesters: \(sems)"
        
        programDescription.text = self.detailItem.valueForKey("Description") as String
    }

}
