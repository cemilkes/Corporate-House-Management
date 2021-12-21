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
    let id: String
    let service: String
    let fee: Double
    let additionalNote: String?
    let receiptImageLink: String?
    let serviceDate: String
    let createdAt: String
    let lastEditAt: Date
    let editedBy: Date
}
