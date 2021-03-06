//
//  Images+CoreDataProperties.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import Foundation
import CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images");
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var note: Note?

}
