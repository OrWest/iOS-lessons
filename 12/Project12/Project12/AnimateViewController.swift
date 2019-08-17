//
//  AnimateViewController.swift
//  Project12
//
//  Created by Alex Motor on 8/14/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit
import SpriteKit

class AnimateViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftTopLabel.layer.anchorPoint = CGPoint(x: 0, y: 1)
        //animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.centerLabel.transform = self.centerLabel.transform.rotated(by: CGFloat.pi / 2)
            self.centerLabel.center = CGPoint(x: self.centerLabel.center.x + 40, y: self.centerLabel.center.y - 40)
            
            self.leftTopLabel.transform = self.leftTopLabel.transform.translatedBy(x: -20, y: -20).rotated(by: CGFloat.pi)
        }, completion: { _ in
            self.animate()
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width = UIScreen.main.bounds.width
        loginField.transform = CGAffineTransform(translationX: -width, y: 0)
        passwordField.transform = CGAffineTransform(translationX: width, y: 0)
        button.alpha = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.loginField.transform = .identity
            self.passwordField.transform = .identity
        }, completion: { _ in
            UIView.animate(withDuration: 0.6, animations: {
                self.button.alpha = 1.0
            })
        })
    }

    @IBAction func buttonAction(_ sender: Any) {
//        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut, .repeat, .autoreverse], animations: {
//            self.redView.frame = CGRect(x: 200, y: 120, width: self.redView.frame.width, height: self.redView.frame.height)
//        })
        
//        UIView.animate(withDuration: 1.0, animations: {
//            self.aView.layer.cornerRadius = 60.0
//            self.aView.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
//        }, completion: { _ in
//            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, options: [], animations: {
//                self.aView.transform = .identity
//            }, completion: nil)
//        })
        
        UIView.animate(withDuration: 2, animations: {
//            self.loginField.alpha = 0.0
//            self.passwordField.alpha = 0.0
            self.loginField.transform = CGAffineTransform(scaleX: -1, y: -1)
            self.passwordField.transform = CGAffineTransform(scaleX: -1, y: -1)
            
//            self.button.alpha = 0.0
            self.button.transform = CGAffineTransform(translationX: 0, y: -1000)
        }, completion: { _ in
            //self.buttonAction(sender)
        })
    }
}
