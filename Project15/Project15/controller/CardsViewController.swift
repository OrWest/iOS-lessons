//
//  CardsViewController.swift
//  Project15
//
//  Created by Alex Motor on 8/28/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class CardsViewController: UITableViewController {

    private var cards: [Card] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let cardNames = [
        "Ysera",
        "Ancient Watcher",
        "Argent Protector",
        "Cruel Taskmaster",
        "Defias Ringleader",
        "Dire Wolf Alpha",
        "Doomsayer",
        "Eviscerate"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        CardManager.shared.loadCards(withNames: cardNames) { result in
            switch result {
            case .success(let cards):
                self.cards = cards
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CardTableViewCell else {
            return UITableViewCell()
        }
        
        let card = cards[indexPath.row]
        cell.titleLabel.text = card.title
        cell.cardTextLabel.text = card.text
        cell.loadCardImage(url: card.imageURL)
        cell.loadGoldImage(url: card.imageGoldURL)

        return cell
    }


}
