//
//  ViewController.swift
//  Project23
//
//  Created by Alex Motor on 9/25/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "nav_title".localized
        
        label.text = String(format: "unread_messages".localized, "12")
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

