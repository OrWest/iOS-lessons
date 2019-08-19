//
//  SectionHeaderView.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
 
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    var girl: Girl? {
        didSet {
            if let imageName = girl?.name {
                avatarImageView.image = UIImage(named: imageName)
            }
            nameLabel.text = girl?.name
            if let count = girl?.places.count {
                countLabel.text = String(count)
            } else {
                countLabel.text = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
}
