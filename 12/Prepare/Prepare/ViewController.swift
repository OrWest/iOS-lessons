//
//  ViewController.swift
//  Prepare
//
//  Created by Alex Motor on 8/13/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

enum Color: String, CaseIterable {
    case red
    case green
    case blue
    case white
    case black
}

class ViewController: UIViewController {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var colorTextField: UITextField!

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateActionFromKeyboard(_:)), for: .valueChanged)

        
        dateTextField.inputView = datePicker
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeAction)))
    }
    
    @IBAction func dateAction(_ sender: UIDatePicker) {
        dateLabel.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func dateActionFromKeyboard(_ sender: UIDatePicker) {
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func closeAction() {
        dateTextField.resignFirstResponder()
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Color.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Color.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorTextField.text = Color.allCases[row].rawValue
    }
}
