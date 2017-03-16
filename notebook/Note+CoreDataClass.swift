//
//  Note+CoreDataClass.swift
//  notebook
//
//  Created by Yiğit Can Türe on 14/03/2017.
//  Copyright © 2017 Yiğit Can Türe. All rights reserved.
//

import Foundation
import CoreData


public class Note: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.date = NSDate()
    }
}
