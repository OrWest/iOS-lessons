//
//  ViewController.swift
//  Project16
//
//  Created by Alex Motor on 9/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import KeychainSwift

struct Person: Codable {
    let name: String
    let age: Int
}

class ViewController: UIViewController {

    private let keychain = KeychainSwift()
    
    private let people = [
        Person(name: "Alex", age: 24),
        Person(name: "Pepe", age: 34),
        Person(name: "Oma", age: 101),
        Person(name: "ZZZ", age: 12)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        //writePlist()
    }


    private func setup() {
//        let key = "date"
//        let ud = UserDefaults.standard
//        ud.set(1.2, forKey: "percent")
        
//        print(ud.double(forKey: "percent"))
//        print(ud.object(forKey: "percent"))
        
        print(keychain.get("key"))
        print(keychain.getData("key"))
        keychain.getData(<#T##key: String##String#>, asReference: <#T##Bool#>)
        
        keychain.set("sdfg3492d57fhfdgh20347502afgsg39485", forKey: "key")
    }
    
    private func writePlist() {
        let urlToWrite = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("people.plist")
        
        print(urlToWrite)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(people)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: urlToWrite)
        } catch {
            print(error)
        }
        
        do {
            let data = try Data(contentsOf: urlToWrite)
            let people = try PropertyListDecoder().decode([Person].self, from: data)
            guard let peopleDict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String : Any]] else { fatalError() }
            print(people.first!.name)
            print(peopleDict.first!["name"]!)
        } catch {
            print(error)
        }
    }
}

