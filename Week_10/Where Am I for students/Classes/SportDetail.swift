//
//  SportDetail.swift
//  Toronto 2015
//
//  Created by Peter McIntyre on 2015-03-14.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class SportDetail: UIViewController {

    // Data object, passed in by the parent view controller in the segue method
    var detailItem: Sport!
    
    @IBOutlet weak var sportPhoto: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Simply display some data in the debug console
        let att1 = detailItem.sportDescription
        let att2 = detailItem.history
        println("Detail item: \(att1), \(att2)")
        let att3 = detailItem.venues.count
        println("\nAt \(att3) venues")
            
        for vn in detailItem.venues {
            
            let venue = vn as Venue
            println("...in venue \(venue.venueName)")
        }

        // Display the photo, sized to fit
        sportPhoto.contentMode = UIViewContentMode.ScaleAspectFit
        sportPhoto.image = UIImage(data: detailItem.photo)
    }

}
