//
//  List+CoreDataProperties.swift
//  Project17
//
//  Created by Alex Motor on 9/4/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//
//

import UIKit
import CoreData

extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var name: String
    @NSManaged public var owner: User?

    convenience init(name: String, owner: User? = nil) {
        self.init(entity: List.entity(), insertInto: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        self.name = name
        self.owner = owner
    }
}
