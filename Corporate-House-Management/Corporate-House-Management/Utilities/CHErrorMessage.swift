//
//  CHErrorMessage.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/22/21.
//

import Foundation

//Added Error protocol for Result type Failure result type
enum CHError: String, Error {
    case invalidCredentials     = "Invalid Credentials."
    case unableToComplete       = "Unable to complete your request. Please check your internet connection."
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid, please try again."
    
    
}
