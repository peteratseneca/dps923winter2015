//
//  Friends.swift
//  Friends
//
//  Created by Peter McIntyre on 2015-02-23.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Friend: NSManagedObject {

    @NSManaged var course: String
    @NSManaged var dateAdded: NSDate
    @NSManaged var email: String
    @NSManaged var friendName: String
    @NSManaged var phone: String
    @NSManaged var photo: NSData

}
