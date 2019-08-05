//
//  ViewController.swift
//  Project9
//
//  Created by Alex Motor on 8/5/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var turner: UISwitch!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        <#code#>
//    }
    
//    override var isViewLoaded: Bool
    
//    override func loadView() {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //turner.isOn = false
        turner.addTarget(self, action: Selector("switchChanged:"), for: .valueChanged)
        
    }

    @objc private func switchChanged(_ sender: UISwitch) {
        label.text = "Switch \(sender.isOn)"
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func loginChanged(_ sender: UITextField) {
        print("Login changed: \(sender.text!)")
    }
    
    @IBAction func passChanged(_ sender: UITextField) {
              print("Pass changed: \(sender.text!)")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Value changed.")
        return true
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        label.text = "Switch ---> \(sender.selectedSegmentIndex) ->>> \(sender.titleForSegment(at: sender.selectedSegmentIndex)!)"
        segmented.setEnabled(false, forSegmentAt: sender.selectedSegmentIndex)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let alertController = UIAlertController(
            title: "Alert title",
            message: "Some alert message",
            preferredStyle: .alert
        )
        let aAction = UIAlertAction(title: "A?", style: .default) { _ in
            print("A action")
        }
        let bAction = UIAlertAction(title: "B!", style: .default) { _ in
            print("B action")
        }
        let cAction = UIAlertAction(title: "C±", style: .destructive) { _ in
            print("C ACTION")
        }
        alertController.addAction(aAction)
        alertController.addAction(bAction)
        alertController.addAction(cAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        <#code#>
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        <#code#>
//    }
    
//    deinit {
//
//    }
    
//    override func didReceiveMemoryWarning() {
//        <#code#>
//    }
    
}

