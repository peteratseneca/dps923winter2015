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
        
        
        // Geocoder
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            
            if let pm = placemarks?[0] as? CLPlacemark {
                
                self.map.region = MKCoordinateRegionMakeWithDistance(pm.location.coordinate, 2000, 2000)
                
                self.map.addAnnotation(MKPlacemark(placemark: pm))
            }
        })

        /*

        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
        
        if let pm = placemarks?[0] as? CLPlacemark {
        self.map.addAnnotation(MKPlacemark(placemark: pm))
        }
        })

        */
        
        //        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
        //
        //            if let pm: CLPlacemark = placemarks?[0] {
        //
        //                self.map.addAnnotation(MKPlacemark(placemark: pm))
        //            }
        //        })
    }
    
}
