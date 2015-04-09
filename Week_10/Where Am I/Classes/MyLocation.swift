//
//  MyLocation.swift
//  Location
//
//  Created by Peter McIntyre on 2015-03-17.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MyLocation: UIViewController, CLLocationManagerDelegate {

    // All methods in CLLocationManagerDelegate are optional
    // However, we will implement these methods...
    // locationManager(_:didChangeAuthorizationStatus:)
    // locationManager(_:didUpdateLocations locations:)
    
    // MARK: - Class-level variables
    
    var lm: CLLocationManager!
    
    // MARK: - User interface
    
    @IBOutlet weak var toggleLocationButton: UIButton!
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    
    // MARK: - UI interactions
    
    @IBAction func toggleLocation(sender: UIButton) {
        
        // Toggle the state
        // To be implemented
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureLocationObjects()
    }
    
    private func configureLocationObjects() {

        // Initialize and configure the location manager
        lm = CLLocationManager()
        lm.delegate = self
        
        // Change these values to affect the update frequency
        lm.distanceFilter = 100
        lm.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        // Set location to run only when the app is in the foreground
        lm.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("Location services enabled\n")
        }
    }

    // MARK: - Delegate methods

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
            
        case .Restricted:
            print("restricted\n")

        case .NotDetermined:
            print("not determined\n")
        
        case .Denied:
            println("denied")
        
        // The following will not compile on the College Macs, which have Xcode 6.1.x
        // If you have your own Mac, you can activate the statements
        /*
        case .AuthorizedAlways:
            println("authorized always")
        */
        
        case .AuthorizedWhenInUse:
            println("authorized when in use")
            myMap.showsUserLocation = true
            manager.startUpdatingLocation()
            
        default:
            break
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        // Most recent location is the last item in the 'locations' array
        // The array has CLLocation objects
        // 'coordinate' property has lat and long
        // Other properties are 'altitude' and 'timestamp'
        
        print("location update\n")
        
        if let l = locations.last as? CLLocation {

            // Display the latitude and longitude
            latitude.text = "Lat: \(l.coordinate.latitude)"
            longitude.text = "Long: \(l.coordinate.longitude)"
            
            // Set the display region of the map
            myMap.region = MKCoordinateRegionMakeWithDistance(l.coordinate, 2000, 2000)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        print("Error: \(error.description)")
    }

}
