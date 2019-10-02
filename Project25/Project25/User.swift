//
//  User.swift
//  Project25
//
//  Created by Alex Motor on 10/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class User {
    let name: String
    var partner: User?
    var phones: [Phone] = []
    var block: (() -> Void)?
    
    init(name: String) {
        print("Create user '\(name)'")
        self.name = name
    }
    
    deinit {
        print("User '\(name)' is going to deinit")
    }
}
