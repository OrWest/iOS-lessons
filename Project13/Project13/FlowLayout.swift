//
//  FlowLayout.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if let attributes = super.layoutAttributesForElements(in: rect) {
            for attr in attributes {
                if attr.representedElementKind == nil {
                    attr.frame = attr.frame.insetBy(dx: 10, dy: 10)
                }
            }
            return attributes
        } else {
            return nil
        }
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else {
            return nil
        }
        
        attributes.alpha = 0.0
        attributes.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        attributes.center = .zero
        return attributes
    }
}
