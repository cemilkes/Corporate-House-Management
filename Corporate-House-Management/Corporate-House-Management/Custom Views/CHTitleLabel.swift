//
//  CHTitleLabel.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/18/21.
//

import UIKit

class CHTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    
    private func configure() {
        textAlignment               = .center
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
