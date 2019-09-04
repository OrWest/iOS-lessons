//
//  AddListViewController.swift
//  Project17
//
//  Created by Alex Motor on 9/4/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import CoreData

class AddListViewController: UIViewController {

//    var delegate: AddListViewControllerDelegate?
    var context: NSManagedObjectContext!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        _ = List(name: nameField.text ?? "", owner: User.fetchAlex(context: context)!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
//        delegate?.saveList(list)
        navigationController?.popViewController(animated: true)
    }
}

//protocol AddListViewControllerDelegate {
//    func saveList(_ list: List)
//}
