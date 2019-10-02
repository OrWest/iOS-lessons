//
//  Phone.swift
//  Project25
//
//  Created by Alex Motor on 10/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Phone {
    let number: String
    var subscription: CarrierSubscription?
    weak var owner: User?
    
    init(number: String, subscription: CarrierSubscription? = nil) {
        self.number = number
        self.subscription = subscription
        print("Create phone \(number)")
    }
    
    deinit {
        print("Phone \(number) is going to deinit")
    }
}
