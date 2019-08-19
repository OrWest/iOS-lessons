//
//  ViewController.swift
//  Project12
//
//  Created by Alex Motor on 8/14/19.
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

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var colorField: UITextField!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDateField()
        
        let rec = UITapGestureRecognizer(target: self, action: #selector(endDateEditing))
        view.addGestureRecognizer(rec)
    }
    
    @objc private func endDateEditing() {
        dateField.resignFirstResponder()
    }
    
    private func configureDateField() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateInputAction(sender:)), for: .valueChanged)
        
        dateField.inputView = datePicker
    }
    
    @objc private func dateInputAction(sender: UIDatePicker) {
        dateField.text = dateFormatter.string(from: sender.date)
    }

    @IBAction func dateAction(_ sender: Any) {
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Color.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let colorEnum = Color.allCases[row]
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        
        let label = UILabel(frame: CGRect(x: 28, y: 0, width: 72, height: 20))
        label.text = colorEnum.rawValue
        containerView.addSubview(label)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let color: UIColor
        switch colorEnum {
            case .red:
                color = UIColor.red
            case .green:
                color = UIColor.green
            case .blue:
                color = UIColor.blue
            case .white:
                color = UIColor.white
            case .black:
                color = UIColor.black
        }
        view.backgroundColor = color

        containerView.addSubview(view)
        
        return containerView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let color = Color.allCases[row]
        colorField.text = color.rawValue
    }
}
