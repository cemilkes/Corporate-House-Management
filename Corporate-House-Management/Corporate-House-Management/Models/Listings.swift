//
//  Listings.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/22/21.
//

import Foundation

struct Listings: Codable, Hashable {
    let data: [Listing]
}

struct Listing: Codable, Hashable {
    
    let id: String // listingID
    let rating: Double
    
    
}
