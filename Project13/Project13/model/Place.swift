//
//  Place.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Place: NSCopying, Decodable {
    var name: String
    let imageName: String
    
    init(name: String, image: String) {
        self.name = name
        self.imageName = image
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Place(name: name, image: imageName)
    }
}
