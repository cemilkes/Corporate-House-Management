//
//  UIButton+Extension.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/28/22.
//

import UIKit

extension UIButton {
    
    func attributeTitle(regularTitle: String, boldTitle: String) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),
                                                   .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "\(regularTitle) ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),
                                                   .font: UIFont.boldSystemFont(ofSize: 16)]
        
        attributedTitle.append(NSAttributedString(string: boldTitle, attributes: boldAtts))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
