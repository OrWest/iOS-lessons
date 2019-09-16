//
//  AppDelegate.swift
//  Project20-2
//
//  Created by Alex Motor on 9/16/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let chars = "abcdefghijklmnopqrstuwvxyz1234567890"
    
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
//        for i in 0..<30 {
//            concurrentQueue.async { print(i) }
//        }
//
//        print(123)
        
        let p = Persistence()
        
        let readers = (0..<1000).map { _ in Reader(readFrom: p) }
        let writers = (0..<100).map { _ in Writer(writeInto: p) }
        
        for i in 0..<10_000 {
                let needToWrite = Int.random(in: 0..<10)
                if needToWrite == 0 {
                    writers.randomElement()!.write(text: String(chars.randomElement()!))
                } else {
                    readers.randomElement()!.read()
                }
        }
        print("Finish")
    }
}

