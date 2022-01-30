//
//  Config.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/22/22.
//

import UIKit

enum Config {
    static let baseURL = NSURL(string: "http://www.example.org/")!
    static let splineReticulatorName = "foobar"
}

enum Color {

    static let primaryColor     = #colorLiteral(red: 0, green: 0.5843137255, blue: 0.7333333333, alpha: 1)
    static let secondaryColor   = #colorLiteral(red: 0, green: 0.7529411765, blue: 0.7803921569, alpha: 1)
    static let tertiaryColor    = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.2470588235, alpha: 1)
    static let successColor     = #colorLiteral(red: 0, green: 0.6823529412, blue: 0.337254902, alpha: 1)
    static let errorColor       = #colorLiteral(red: 0.9411764706, green: 0.1960784314, blue: 0.2196078431, alpha: 1)
    static let warningColor     = #colorLiteral(red: 0.9215686275, green: 0.5490196078, blue: 0.1529411765, alpha: 1)
    
}

enum Images {
    static let neoOnFirstLogo           = UIImage(named: "neo-on-first-logo")
    //static let emptyStateLogo           = UIImage(named: "empty-state-logo")
    //static let ghLogo                   = UIImage(named: "gh-logo")
    
}
