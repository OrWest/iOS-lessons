//
//  User.swift
//  Project18
//
//  Created by Alex Motor on 9/9/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String?
    let age: RealmOptional<Int> = RealmOptional()
    
    let tasks = List<Task>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
