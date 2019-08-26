//
//  ViewController.swift
//  Project14
//
//  Created by Alex Motor on 8/26/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NetworkManager.shared.requestToDos(id: "2") { result in
//            switch result {
//            case .success(let text):
//                print(text)
//            case .failure(let error):
//                print(error)
//            }
//        }
//        print(1)
        
        NetworkManager.shared.loadImage { result in
            switch result {
            case .success(let url):
                self.imageView.image = UIImage(data: try! Data(contentsOf: url))
            case .failure(let error):
                print(error)
                switch error {
                case .error(let error as NSError):
                    print("Canceled = \(error.code == NSURLErrorCancelled)")
                default: print(error)
                }
            }
        }
    }


}

