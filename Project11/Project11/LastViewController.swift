//
//  LastViewController.swift
//  Project11
//
//  Created by Alex Motor on 8/12/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

    private let strings = (0..<20).map { String([Character](repeating: "a", count: $0)) }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

}

extension LastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "my") as? MyTableViewCell {
            cell.topLabel.text = strings[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}
