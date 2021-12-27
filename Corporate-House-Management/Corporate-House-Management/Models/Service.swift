//
//  Service.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import Foundation


struct MonthlyData: Codable {
    let date: String
    var monthlytotal: Double
    let dailyData: [ServiceDays]
}

struct ServiceDays: Codable {
    var date: String
    var dailyTotal: Double
    var services: [Service]
    
//        init(_dictionary: NSDictionary) {
//            date = _dictionary["date"] as! String
//            dailyTotal = _dictionary["dailyTotal"] as! Double
//            services = _dictionary["services"] as! [Service]
//        }
    
}

struct Service: Codable {
  //  let id: String
    var date: String
    var service: String
    var fee: String
//    let additionalNote: String?
//    let receiptImageLink: String?

//    let createdAt: String
//    let lastEditAt: Date
//    let editedBy: Date
    
//    init(_dictionary: NSDictionary) {
//        date = _dictionary["date"] as! String
//        service = _dictionary["service"] as! String
//        fee = _dictionary["fee"] as! String
//    }
}
