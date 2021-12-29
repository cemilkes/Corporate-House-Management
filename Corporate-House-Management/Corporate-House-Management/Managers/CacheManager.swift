//
//  CacheManager.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/29/21.
//

import UIKit

class CacheManager {
    
    static let shared = CacheManager()
    
    let cache = NSCache<NSString, UIImage>()
    
}
