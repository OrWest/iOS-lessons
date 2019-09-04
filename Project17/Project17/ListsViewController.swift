//
//  ListsViewController.swift
//  Project17
//
//  Created by Alex Motor on 9/4/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import CoreData

class ListsViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var container: NSPersistentContainer!
    private var context: NSManagedObjectContext!
    private var fetchController: NSFetchedResultsController<List>!
    
    private var nextView: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        container = appDelegate.persistentContainer
        context = container.viewContext
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        fetchUserOrCreate()
        
        fetchData()
    }
    
    private func fetchUserOrCreate() {
        
        var user = User.fetchAlex(context: context)
        if user == nil {
            user = User()
        }
        
        print("Lists: \(user!.lists )")
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: animated)
    }
    
    private func fetchData() {
        
        let request: NSFetchRequest<List> = List.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \List.name, ascending: true)]
        
        fetchController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "cache0")
        fetchController.delegate = self
        
        do {
            try fetchController.performFetch()
        } catch {
            print(error)
        }
        
        let secondRequest: NSFetchRequest<List> = List.fetchRequest()
        secondRequest.predicate = NSPredicate(format: "name LIKE %@", "Hello*")
        
        do {
            let count = try context.count(for: secondRequest)
            print(count)
            //print(try context.fetch(secondRequest))
            title = "\(count)"
        } catch {
            print(error)
        }
    }
    
//    func saveList(_ list: List) {
//        lists.append(list)
//        appDelegate.saveContext()
//    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let list = fetchController.fetchedObjects![indexPath.row]
        cell.textLabel?.text = list.name

        return cell
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .right)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let object = fetchController.object(at: indexPath)
            fetchController.managedObjectContext.delete(object)
            appDelegate.saveContext()
        default:
            break
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddListViewController else {
             return
        }
        
        vc.context = context
//        vc.delegate = self
        nextView = vc
    }
}
