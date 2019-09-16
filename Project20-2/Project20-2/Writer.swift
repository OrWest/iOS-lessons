//
//  Writer.swift
//  Project20-2
//
//  Created by Alex Motor on 9/16/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Writer {
    private let persistence: Persistence
    
    init(writeInto persistence: Persistence) {
        self.persistence = persistence
    }
    
    func write(text: String) {
        persistence.write(text: text)
    }
}
