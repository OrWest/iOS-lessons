//
//  User+CoreDataProperties.swift
//  Project17
//
//  Created by Alex Motor on 9/4/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//
//

import UIKit
import CoreData

extension User {
    private static let alexName = "Alex"
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var lists: Set<List>?
    
    convenience init() {
        self.init(entity: User.entity(), insertInto: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        self.name = User.alexName
    }
    
    public class func fetchAlex(context: NSManagedObjectContext) -> User? {
        let name = alexName
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "name LIKE %@", name)
        
        do {
            return try context.fetch(request).first
        } catch {
            print(error)
        }
        
        return nil
    }
}

// MARK: Generated accessors for lists
extension User {

    @objc(addListsObject:)
    @NSManaged public func addToLists(_ value: List)

    @objc(removeListsObject:)
    @NSManaged public func removeFromLists(_ value: List)

    @objc(addLists:)
    @NSManaged public func addToLists(_ values: NSSet)

    @objc(removeLists:)
    @NSManaged public func removeFromLists(_ values: NSSet)

}
