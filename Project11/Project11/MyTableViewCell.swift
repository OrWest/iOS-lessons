//
//  MyTableViewCell.swift
//  Project11
//
//  Created by Alex Motor on 8/12/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")

        avatarView.layer.cornerRadius = 40.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        topLabel.text = nil
        bottomLabel.text = nil
    }

}
