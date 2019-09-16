//
//  Persistence.swift
//  Project20-2
//
//  Created by Alex Motor on 9/16/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Persistence {
    private let concurrentQueue = DispatchQueue(label: "ConcQ", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
    
    private var a = ""
    
    func read(text: @escaping (String) -> Void) {
        concurrentQueue.async {
            text(self.a)
        }        
    }
    
    func write(text: String) {
        concurrentQueue.async(group: nil, qos: .default, flags: .barrier) {
            let old = self.a
            if old.count > 30 {
                print("Will write char into text \(old.count)")
            } else {
                print("Will write \(text) in \(old)")
            }
            self.a = old + text
            if self.a.count > 30 {
                print("New value size: \(self.a.count)")
            } else {
                print("New value: \(self.a)")
            }
        }
    }
}
