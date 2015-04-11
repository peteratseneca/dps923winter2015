//
//  Place.swift
//  Scroll
//
//  Created by Peter McIntyre on 2015-04-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Place: NSManagedObject {

    @NSManaged var lat: NSNumber
    @NSManaged var address: String
    @NSManaged var long: NSNumber

}
