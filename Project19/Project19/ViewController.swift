//
//  ViewController.swift
//  Project19
//
//  Created by Alex Motor on 9/11/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var fullAlpha = true
    private var scale: CGFloat = 1.0
    private var rotate: CGFloat = 0.0
    private var currentScale: CGFloat = 1.0
    
//    private var draggingView: UIView?
//    private var offset: CGPoint?
    private var center: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.isMultipleTouchEnabled = true
//        for _ in 0..<10 {
//            let view = UIView()
//            view.frame = CGRect(x: CGFloat.random(in: 0..<300), y: CGFloat.random(in: 0..<500), width: 100, height: 100)
//            view.backgroundColor = UIColor(
//                red: CGFloat.random(in: 0.0..<1.0),
//                green: CGFloat.random(in: 0.0..<1.0),
//                blue: CGFloat.random(in: 0.0..<1.0),
//                alpha: 1
//            )
//            self.view.addSubview(view)
//        }
        
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        self.view.addSubview(view)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
        tap.numberOfTouchesRequired = 1
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        tap.require(toFail: doubleTap)
        
        let long = UILongPressGestureRecognizer(target: self, action: #selector(long(gesture:)))
        long.minimumPressDuration = 1.0
        view.addGestureRecognizer(long)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        pinch.delegate = self
        view.addGestureRecognizer(pinch)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gesture:)))
        pinch.delegate = self
        view.addGestureRecognizer(rotation)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(gesture:)))
        view.addGestureRecognizer(pan)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc
    private func tap(gesture: UITapGestureRecognizer) {
        print("Tap")
        
        gesture.view!.backgroundColor = UIColor(
                        red: CGFloat.random(in: 0.0..<1.0),
                        green: CGFloat.random(in: 0.0..<1.0),
                        blue: CGFloat.random(in: 0.0..<1.0),
                        alpha: 1
                    )
    }
    
    
    @objc
    private func doubleTap(gesture: UITapGestureRecognizer) {
        
        let view = gesture.view!
        view.transform = view.transform.scaledBy(x: 1.2, y: 1.2)
    }
    
    @objc
    private func long(gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else {
             return
        }
        
        gesture.view!.alpha = fullAlpha ? 0.2 : 1.0
        fullAlpha.toggle()
        print("Long")
    }
    
    @objc
    private func pinch(gesture: UIPinchGestureRecognizer) {
        guard gesture.state != .ended else {
            scale *= gesture.scale
            return
        }
        
        let view = gesture.view!
        view.transform = CGAffineTransform(scaleX: scale * gesture.scale, y: scale * gesture.scale)
        currentScale = scale * gesture.scale
        
        print("Pinch: \(gesture.scale)")
    }
    
    @objc
    private func rotation(gesture: UIRotationGestureRecognizer) {
        guard gesture.state != .ended else {
            rotate += gesture.rotation
            return
        }
        
        let view = gesture.view!
        view.transform = CGAffineTransform(rotationAngle: rotate + gesture.rotation).scaledBy(x: currentScale, y: currentScale)
        
        print("Rotation: \(gesture.rotation)")
    }
    
    @objc
    private func pan(gesture: UIPanGestureRecognizer) {
        let view = gesture.view!
        if gesture.state == .began {
            center = view.center
        }
        
        let trans = gesture.translation(in: view)
        view.center = CGPoint(x: center!.x + trans.x, y: center!.y + trans.y)
        print("Pan: \(trans)")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//
//        let points = touches.map { $0.location(in: self.view) }
////        let point = touches.map { $0.location(in: self.greenView) }.randomElement()!
//        let point = points.randomElement()!
//        if let view = self.view.hitTest(point, with: event), view != self.view {
//            draggingView = view
//            self.view.bringSubviewToFront(view)
//            offset = CGPoint(x: point.x - view.center.x, y: point.y - view.center.y)
//        }
//        print("Touches begin: \(points)")
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//
//        let points = touches.map { $0.location(in: self.view) }
//
//        if let view = draggingView {
//            let point = points.randomElement()!
//            view.center = CGPoint(x: point.x - offset!.x, y: point.y - offset!.y)
//        }
//
//        print("Touches moved: \(points)")
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//
//        endTouches()
//        let points = touches.map { $0.location(in: self.view) }
//
//        print("Touches end: \(points)")
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//
//        endTouches()
//        let points = touches.map { $0.location(in: self.view) }
//
//        print("Touches cancelled: \(points)")
//    }
//
//    private func endTouches() {
//        draggingView = nil
//        offset = nil
//    }
}
