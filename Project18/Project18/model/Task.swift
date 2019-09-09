//
//  Task.swift
//  Project18
//
//  Created by Alex Motor on 9/9/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name: String?
    let owner = LinkingObjects(fromType: User.self, property: "tasks")
}
