//
//  ViewController.swift
//  Project25
//
//  Created by Alex Motor on 10/2/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var user = User(name: "First")
    private var phoneX = Phone(number: "X")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("1: viewDidLoad")
        
//        let u = User(name: "Alex")
        let subscr = CarrierSubscription()
        subscr.owner = user

        let phone1 = Phone(number: "1", subscription: subscr)
        let phone2 = Phone(number: "2", subscription: subscr)
        let phone3 = Phone(number: "3", subscription: subscr)
        user.phones.append(phone1)
        user.phones.append(phone2)
        user.phones.append(phone3)
        user.phones.append(phoneX)

        phone1.owner = user
        phone2.owner = user
        phone3.owner = user
        phoneX.owner = user
//
//        user = u
        
        let u = User(name: "Alex")
        u.block = { [u] in
            u.partner = User(name: "AAA")
        }
        
        u.block?()
        
        //print("1: viewDidLoad ended")
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let vc = SecondViewController()
        vc.newUser = user
        navigationController?.pushViewController(vc, animated: true)
    }
}

