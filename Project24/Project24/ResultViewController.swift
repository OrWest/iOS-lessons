//
//  ResultViewController.swift
//  Project24
//
//  Created by Alex Motor on 9/30/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import CoreLocation

class ResultViewController: UITableViewController {

    var places: [CLPlacemark] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var didSelectPlace: ((CLPlacemark) -> Void)?

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "id") ?? UITableViewCell(style: .default, reuseIdentifier: id)

        cell.textLabel?.text = places[indexPath.row].formatAddress()

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectPlace?(places[indexPath.row])
    }
}
