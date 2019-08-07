//
//  ViewController.swift
//  Project10
//
//  Created by Alex Motor on 8/7/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var progresView: UIProgressView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        progresView.progress = 0
    }

    @IBAction func buttonAction(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.progresView.progress < 1.0 {
                self.progresView.progress += 0.01
            }
        }
        
        activity.stopAnimating()
        effectView.isHidden = false
    }
    
    @IBAction func buttonsAction(_ sender: UIButton) {
        sender.isHidden = true
    }
    
    @IBAction func unwindToSelf(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
        print("unwindToSelf")
    }
    
    
    @IBAction func nextScreenAction(_ sender: Any) {
        print(123)
        
//        let controller = storyboard!.instantiateViewController(withIdentifier: "next")
//        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func addAction(_ sender: Any) {
        print("Add action")
    }
}
