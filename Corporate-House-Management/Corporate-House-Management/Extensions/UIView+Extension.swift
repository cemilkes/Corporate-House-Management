//
//  UIView+Extension.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/14/21.
//

import UIKit

extension UIView {
     
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius      = cornerRadius
        layer.masksToBounds     = true
        layer.shadowRadius      = 4.0
        layer.shadowOpacity     = 0.30
        layer.shadowColor       = UIColor.gray.cgColor
        layer.shadowOffset      = CGSize(width: 0, height: 5)
    }
    
    
}
