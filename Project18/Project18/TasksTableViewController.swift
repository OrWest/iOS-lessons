//
//  TasksTableViewController.swift
//  Project18
//
//  Created by Alex Motor on 9/9/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import RealmSwift

class TasksTableViewController: UITableViewController {
    private var notificationToken: NotificationToken!

    private lazy var realm = try! Realm()
    
    private weak var okAction: UIAlertAction?
    
    private var tasks: Results<Task>!
//    private var tasks: Results<Task> {
//        return realm.objects(Task.self)
//    }
    
    private var user: User = {
        let name = "Alex"
        let realm = try! Realm()
        
        var user: User!
        if let alex = realm.objects(User.self).filter("name == %s", name).first {
            user = alex
        } else {
            let alex = User()
            alex.name = "Alex"
            alex.age.value = 99
            try! realm.write {
                realm.add(alex)
            }
            user = alex
        }
        return user
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        
        tasks = realm.objects(Task.self)
        
        notificationToken = tasks.observe { [weak self] change in
            guard let self = self else { return }
            
            switch change {
            case .initial:
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .fade)
                self.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .fade)
                self.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .fade)
                self.tableView.endUpdates()
            case .error(let error):
                print(error)
            }
        }
    }
    
    deinit {
        notificationToken.invalidate()
    }

    @IBAction func addAction(_ sender: Any) {
        let alert = UIAlertController(title: "Add task", message: "Enter name for new task", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let textField = alert.textFields!.first!
            
            let newTask = Task()
            newTask.name = textField.text!
            try! self.realm.write {
                self.user.tasks.append(newTask)
                self.realm.add(newTask)
            }
            //self.tableView.reloadData()
        }
        okAction.isEnabled = false
        self.okAction = okAction
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(okAction)
        alert.addTextField { textField in
            textField.placeholder = "Task name"
            textField.textAlignment = .center
            textField.textColor = UIColor.green
            textField.addTarget(self, action: #selector(self.textFieldWasEdited(sender:)), for: .allEditingEvents)
        }
        
        present(alert, animated: true)
    }
    
    @objc
    private func textFieldWasEdited(sender: UITextField) {
        okAction?.isEnabled = sender.text!.count >= 3
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        
        print("Index \(indexPath.row):\n\(task)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            try! realm.write {
                realm.delete(task)                
            }
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .left)
//            tableView.endUpdates()
        }
    }
}
