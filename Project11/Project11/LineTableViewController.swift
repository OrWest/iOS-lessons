//
//  LineTableViewController.swift
//  Project11
//
//  Created by Alex Motor on 8/12/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class LineTableViewController: UITableViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var isSelectedLabel: UILabel!
    
    var line: Line!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = line.text
        isSelectedLabel.text = line.isSelected ? "true" : "false"
    }
}
