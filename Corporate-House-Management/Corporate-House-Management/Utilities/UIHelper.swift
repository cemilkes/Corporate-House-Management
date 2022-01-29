//
//  UIHelper.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/27/21.
//

import UIKit

struct UIHelper {
    
    static func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        //let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2)
        let itemWidth = availableWidth
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * (2/3))
        
        return flowLayout
    }
    
    
    static func createGradient(in view: UIView) {
        let gradient        = CAGradientLayer()
        gradient.colors     = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations  = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame      = view.frame
        
    }
}
