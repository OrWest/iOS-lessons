//
//  TableViewController.swift
//  Project11
//
//  Created by Alex Motor on 8/12/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

struct Line {
    let text: String
    var isSelected: Bool
}

class TableViewController: UITableViewController {

    private let lines = (0..<100).map { "line\($0)" }
    private var strings = (0..<50).map { Line(text: "string\($0)", isSelected: false) }
    private let numbers = (0..<100).map { $0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(UINib(nibName: "XTableViewCell", bundle: nil), forCellReuseIdentifier: "x")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
    }

    @objc func refreshAction() {
        strings.shuffle()
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return lines.count
        case 1:
            return strings.count
        default:
            return numbers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HeaderView {
            let text: String
            let color: UIColor
            if section == 0 {
                text = "Lines"
                color = .yellow
            } else if section == 1 {
                text = "Strings"
                color = .red
            } else {
                text = "Numbers"
                color = UIColor(red: 128.0/255.0, green: 1, blue: 1, alpha: 0.5)
            }
            header.titleLabel.text = text
            header.bgView.backgroundColor = color
            return header
        }
        
        return nil
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Lines"
//        } else if section == 1 {
//            return "Strings"
//        } else {
//            return "Numbers"
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let identifier: String
            if indexPath.row % 2 == 0 {
                identifier = "my"
            } else {
                identifier = "my2"
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MyTableViewCell {
                let text = lines[indexPath.row]
                cell.bottomLabel.text = text
                cell.topLabel.text = "\(text)\(text)"
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "basic") {

                let line = strings[indexPath.row]
                cell.textLabel?.text = line.text
                cell.accessoryType = line.isSelected ? .checkmark : .none
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "x") as? XTableViewCell {
                
                cell.titleLabel?.text = "\(numbers[indexPath.row])"
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        guard indexPath.section == 1 else { return }
//
//        strings = strings.map {
//            var line = $0
//            line.isSelected = false
//            return line
//        }
//
//        var line = strings[indexPath.row]
//        line.isSelected.toggle()
//        strings[indexPath.row] = line
//
//        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        super.tableView(tableView, heightForRowAt: indexPath)
        if indexPath.section == 0 {
            return 100.0
        } else {
            return 44.0
        }
    }
 
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let line: Line
        if indexPath.section == 0 {
            line = lines.map { Line(text: $0, isSelected: false) }[indexPath.row]
        } else if indexPath.section == 1 {
            line = strings[indexPath.row]
        } else {
            line = numbers.map { Line(text: "\($0)", isSelected: false) }[indexPath.row]
        }
    
//        if let id = segue.identifier, id == "123" {
//
//        }
        (segue.destination as! LineTableViewController).line = line
    }
    

}
