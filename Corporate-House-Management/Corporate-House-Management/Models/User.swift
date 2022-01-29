//
//  User.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/29/22.
//

import UIKit

enum UserType: String, Codable {
    case admin
    case manager
    case employee
    case airbnbHost
    case janitor
}

struct User: Codable {
    let name: String
    let phoneNumber: String
    let type: UserType
    let createdAt: String
    let profilePicture: String
    var onBoard: Bool
    let address: Address
}

struct Address: Codable {
    let address: String
    let city: String
    let state: String
    let zipCode: String
    
}
