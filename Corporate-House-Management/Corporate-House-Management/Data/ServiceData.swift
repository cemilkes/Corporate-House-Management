//
//  ServiceData.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/24/21.
//

import Foundation

class ServiceData {
    
    static let shared = ServiceData()
    
    private init() {}
    
    let services = ["207", "208", "209", "212", "214", "215", "218",
                    "306", "307", "308", "309", "310",
                    "313", "314", "316", "401", "402", "403",
                    "405", "406", "407", "409", "410",
                    "411", "412", "413", "414", "415", "416",
                    "Vacuum(Hallways)",
                    "Lobby&Bathroom",
                    "Courtyard Bathroom",
                    "Elevator&Stain Carpet"
                    //"Jose-Labor"
                    //"Shopping"
                    //"Power Wash(Garage)"
    ]
    
    
    
}
