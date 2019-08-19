//
//  Girl.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Girl: Decodable {
    let name: String
    var places: [Place]
    
    init(name: String, places: [Place]) {
        self.name = name
        self.places = places
    }
}
