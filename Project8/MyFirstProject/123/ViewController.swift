//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Alex Motor on 7/31/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet var labels: [UILabel]!
    
    private var a = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var numbers = [3, 1, 0, 5 , 101]
        numbers = removeLast(array: numbers, count: 3)
        numbers = removeLast(array: numbers, count: 3)
        print(numbers)
        
        textLabel.text = "Counter: \(a)"
        button.setTitle("Press me, please!", for: .normal)
        addLabel()
    }
    
    private func addLabel() {
        let label = UILabel()
        label.text = "Prog created label"
        label.textColor = UIColor.red
        label.textColor = .red
        view.addSubview(label)
        label.frame = CGRect(x: 100, y: 400, width: 200, height: 45)
    }

    @IBAction func buttonPressed() {
        a += 1
        
        for label in labels {
            label.text = "Counter: \(a)"
        }
        
        //labels.forEach { $0.text = "Counter: \(a)" }
    }
    private func removeLast(array: [Int], count: Int) -> [Int] {
        var array = array
        
        var counter = 0
        while counter < count && !array.isEmpty {
            array.removeLast()
            counter += 1
        }
        
        return array
    }
    
    private func removeLastWithError(array: [Int], count: Int) -> [Int] {
        var array = array
        array.removeLast(count)
        return array
    }
}

