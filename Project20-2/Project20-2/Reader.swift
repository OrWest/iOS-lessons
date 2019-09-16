//
//  Reader.swift
//  Project20-2
//
//  Created by Alex Motor on 9/16/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Reader {
    private let persistence: Persistence
    
    init(readFrom persistence: Persistence) {
        self.persistence = persistence
    }
    
    func read() {
        persistence.read { text in
//            if text.count > 30 {
//                print(text.count)
//            } else {
//                print(text)
//            }
            print(text.count > 30 ? String(text.count) : text)
        }
    }
}
