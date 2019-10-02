//
//  CarrierSubscription.swift
//  Project25
//
//  Created by Alex Motor on 10/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class CarrierSubscription {
    weak var owner: User?
    
    init() {
        print("Create CarrierSubscription")
    }
    
    deinit {
        print("CarrierSubscription is going to deinit")
    }
}
