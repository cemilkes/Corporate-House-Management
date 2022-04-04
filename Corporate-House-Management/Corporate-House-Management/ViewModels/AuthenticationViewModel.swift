//
//  AuthenticationViewModel.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/29/22.
//

import UIKit

struct LoginViewModel {
    
    var username: String?
    var phoneNumber: String?
    var userType: UserType?
    
    var formIsValid: Bool {
        return username?.isEmpty == false && phoneNumber?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0, green: 0.5843137255, blue: 0.7333333333, alpha: 1) : #colorLiteral(red: 0, green: 0.5843137255, blue: 0.7333333333, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.67)
    }
    
    
    
}
