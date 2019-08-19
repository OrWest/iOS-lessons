//
//  PlaceViewController.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    var place: Place!
    var girl: Girl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = girl.name
        
        nameLabel.text = place.name
        placeImage.image = UIImage(named: place.imageName)
    }
    
}
