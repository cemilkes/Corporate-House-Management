//
//  Service.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import Foundation

struct MonthlyData {
    var monthlytotal: Double
    let dailyData: [DailyData]
}


struct DailyData {
    var dailyTotal: Double
    let services: [Service]
}


struct Service {
  //  let id: String
    let date: String
    let service: String
    let fee: String
//    let additionalNote: String?
//    let receiptImageLink: String?

//    let createdAt: String
//    let lastEditAt: Date
//    let editedBy: Date
    
    init(_dictionary: NSDictionary) {
        date = _dictionary["date"] as! String
        service = _dictionary["service"] as! String
        fee = _dictionary["fee"] as! String
    }
}
