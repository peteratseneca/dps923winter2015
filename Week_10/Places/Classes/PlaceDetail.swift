//
//  PlaceDetail.swift
//  Scroll
//
//  Created by Peter McIntyre on 2015-04-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import MapKit

class PlaceDetail: UIViewController {
    
    // MARK: - Class variables
    
    // Data object, passed in by the parent view controller in the segue method
    var item: Place!
    
    // MARK: - User interface
    
    @IBOutlet weak var map: MKMapView!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Simply display some data in the debug console
        let address = self.item.address
        print("Item: \(address)\n")
        
        // Forward geocoder tasks
        
        // Create a geocoder object
        let geocoder = CLGeocoder()
        
        // Use the Apple Maps web service to fetch a 'placemark' object
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            
            // Work with the first placemark that is returned
            if let pm = placemarks?[0] as? CLPlacemark {
                
                // Configure the map to be centered on the placemark's location coordinate
                self.map.region = MKCoordinateRegionMakeWithDistance(pm.location.coordinate, 2000, 2000)
                
                // Drop a red pin on the map
                self.map.addAnnotation(MKPlacemark(placemark: pm))
            }
        })
    }
    
}
