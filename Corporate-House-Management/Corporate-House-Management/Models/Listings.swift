//
//  Listings.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/22/21.
//

import Foundation

struct Listings: Codable {
    let data: [Listing]
}

struct Listing: Codable {
    
    let id: String // listingID
    let rating: Double
    
    
}
