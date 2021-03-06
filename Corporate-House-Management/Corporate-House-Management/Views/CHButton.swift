//
//  CHButton.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/11/21.
//

import UIKit

class CHButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //Requires for storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        //self.titleLabel?.text = title  // read (get)
        self.setTitle(title, for: .normal) // write (set)
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius      = 10
        //titleLabel?.textColor   = .white // (get)
        setTitleColor(.white, for: .normal) // (set)
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
