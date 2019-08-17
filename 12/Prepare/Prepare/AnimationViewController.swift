//
//  AnimationViewController.swift
//  Prepare
//
//  Created by Alex Motor on 8/13/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet private weak var loginField: UITextField!
    @IBOutlet private weak var passField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var aView: UIView!
    @IBOutlet private weak var centerLabel: UILabel!
    @IBOutlet private weak var leftLabel: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = UIScreen.main.bounds.width
        
        loginField.transform = CGAffineTransform(translationX: -width, y: 0)
        passField.transform = CGAffineTransform(translationX: width, y: 0)
        loginButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.loginField.transform = .identity
            self.passField.transform = .identity
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.loginButton.alpha = 1.0
            })
        })
    
        leftLabel.layer.anchorPoint = .zero
        
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.centerLabel.transform = self.centerLabel.transform.rotated(by: CGFloat.pi)
            self.leftLabel.transform = self.leftLabel.transform.rotated(by: CGFloat.pi)
            
        }, completion: { _ in
            self.animate()
        })
    }
    
    @IBAction private func buttonAction() {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut, .repeat, .autoreverse], animations: {
            self.aView.frame = CGRect(x: 200, y: 120, width: self.aView.frame.width, height: self.aView.frame.height)
        }, completion: nil)
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
