//
//  Data.swift
//  beta
//
//  Created by CHRIS WARNER on 01/12/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import Foundation
import CoreData

class Data: NSManagedObject {

    @NSManaged var crop: String
    @NSManaged var depth: String
    @NSManaged var harvestmonth: String
    @NSManaged var photoFullURL: String
    @NSManaged var photoThumbURL: String
    @NSManaged var plantedmonth: String
    @NSManaged var ref: String
    @NSManaged var rows: String
    @NSManaged var soiltype: String
    @NSManaged var spacing: String
    @NSManaged var variety: String
    @NSManaged var date: String
}
