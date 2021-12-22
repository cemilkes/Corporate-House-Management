//
//  Reservations.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation

struct Reservation : Codable {
    let data: [Reservations]
}

struct Reservations : Codable {
    let listingId: String
    let status: String
    let checkIn: String
    let _included: [GuessData]
}

struct GuessData : Codable {
    let data: GuessInfo
}

struct GuessInfo : Codable {
    let uuid: String
    let firstName: String
    let lastName: String
    let phone: String
}
