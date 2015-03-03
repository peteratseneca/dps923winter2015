//
//  Launch.swift
//  Toronto 2015
//
//  Created by Peter McIntyre on 2015-02-26.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class Launch: UIViewController {

    // MARK: - Properties
    
    var model: Model!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar for this 'launch' scene only
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other scenes in the app
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toSportList" {
            
            // Get a reference to the view controller
            let vc = segue.destinationViewController as ExampleList
            
            // Pass the model object to the controller
            vc.model = model
        }
        
        if segue.identifier == "toVenueList" {
            
            // More to come...
        }
    }

    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
}
