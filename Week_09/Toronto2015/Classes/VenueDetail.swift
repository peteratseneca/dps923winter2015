//
//  VenueDetail.swift
//  Toronto 2015
//
//  Created by Peter McIntyre on 2015-03-14.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class VenueDetail: UIViewController {

    // Data object, passed in by the parent view controller in the segue method
    var detailItem: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Simply display some data in the debug console
        let att1 = detailItem.venueDescription
        let att2 = detailItem.location
        println("Detail item: \(att1), \(att2)")
        let att3 = detailItem.sports.count
        println("\nHosts \(att3) sports")
        
        for vn in detailItem.sports {
            
            let sport = vn as Sport
            println("...hosts sport \(sport.sportName)")
        }
    }

}
