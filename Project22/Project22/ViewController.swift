//
//  ViewController.swift
//  Project22
//
//  Created by Alex Motor on 9/23/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private enum Source {
        case camera
        case library
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        showChoose { [weak self] source in
            guard let source = source else { return }
            
            let picker = UIImagePickerController()
            picker.delegate = self
            
            switch source {
            case .camera:
                picker.sourceType = .camera
                picker.cameraCaptureMode = .photo
            case .library:
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
            }
            
            self?.present(picker, animated: true)
            self?.imagePicker = picker
        }
    }
    
    private func showChoose(choosen: @escaping (Source?) -> Void) {
        let alert = UIAlertController(title: "Choose source", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
                choosen(.camera)
            })
        }
        alert.addAction(UIAlertAction(title: "Library", style: .default) { _ in
            choosen(.library)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            choosen(nil)
        })
        
        present(alert, animated: true)
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image picked.")
        
        let image = info[.originalImage] as! UIImage
        let cropped = info[.editedImage] as! UIImage
        imageView.image = cropped
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel")
        picker.dismiss(animated: true)
    }
}
