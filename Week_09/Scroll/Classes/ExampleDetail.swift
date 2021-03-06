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
    var detailItem: Sport!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Simply display some data in the debug console
        let att1 = self.detailItem.valueForKey("sportDescription") as? String
        let att2 = self.detailItem.valueForKey("history") as? Int
        println("Detail item: \(att1), \(att2)")
    }

}
