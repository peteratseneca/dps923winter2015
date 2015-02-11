//
//  Province.swift
//  Canada
//
//  Created by Peter McIntyre on 2015-02-04.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Province: NSManagedObject {

    @NSManaged var areaInKm: NSNumber
    @NSManaged var dateCreated: NSDate
    @NSManaged var premierName: String
    @NSManaged var provinceName: String

}
