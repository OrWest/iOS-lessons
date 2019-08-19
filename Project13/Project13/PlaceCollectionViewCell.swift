//
//  PlaceCollectionViewCell.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var place: Place? {
        didSet {
            titleLabel.text = place?.name
            if let imageName = place?.imageName {
                imageView.image = UIImage(named: imageName)
            } else {
                imageView.image = nil
            }
        }
    }
    
}
