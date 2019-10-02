//
//  SecondViewController.swift
//  Project25
//
//  Created by Alex Motor on 10/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var newUser: User!
    private let user = User(name: "Second")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2: viewDidLoad")
        
        newUser.partner = user
        print("2: viewDidLoad ended")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
