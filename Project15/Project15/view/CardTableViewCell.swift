//
//  CardTableViewCell.swift
//  Project15
//
//  Created by Alex Motor on 8/28/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var goldImageView: UIImageView!
    @IBOutlet weak var cardTextLabel: UILabel!
    
    private weak var cardImageTask: URLSessionDataTask?
    private weak var goldImageTask: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cardImageTask?.cancel()
        goldImageTask?.cancel()
        
        cardImageView.image = nil
        goldImageView.image = nil
    }
    
    func loadCardImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.cardImageView.image = UIImage(data: data)
            }
        }
        cardImageTask = task
        task.resume()
    }
    
    func loadGoldImage(url: URL) {        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.goldImageView.image = UIImage(data: data)
            }
        }
        goldImageTask = task
        task.resume()
    }
}
