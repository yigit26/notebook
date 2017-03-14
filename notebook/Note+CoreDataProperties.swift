//
//  Note+CoreDataProperties.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var brief: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var category: Category?
    @NSManaged public var image: Images?

}
