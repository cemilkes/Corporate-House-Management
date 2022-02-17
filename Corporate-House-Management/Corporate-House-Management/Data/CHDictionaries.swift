//
//  CHDictionaries.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation

class Dictionaries {
    
    //https://stackoverflow.com/questions/27218669/swift-dictionary-get-key-for-value/56140965
    
    static let shared = Dictionaries()
    
    var listingIDtoUnitNumber: [String:String] = [
        
        "51490479" : "208",
        "51393373" : "209",
        "49013052" : "212",
        "48907008" : "215",
        "50979272" : "218",
        "53341948" : "306",
        "51349885" : "307",
        "51045862" : "308",
        "51412351" : "309",
        "51408850" : "310",
        "51616754" : "314",
        "51505665" : "316",
        
        "50899825" : "401",
        "50195113" : "402",
        "49968858" : "403",
        "50035152" : "405",
        "50465322" : "406",
        "51454628" : "407",
        "49551970" : "409",
        "49200971" : "410",
        "50035032" : "411",
        "50757958" : "412",
        "50700292" : "413",
        "50698891" : "414",
        "50343204" : "415", // change as  AppConstants.unit414 = AppConstants.unit414ListingId
        "50306955" : "416"
    ]
    
    var unitNumberToPropertyID: [String:String] = [
        
        "208" : "622332",
        "209" : "619218",
        "212" : "631100",
        "215" : "631098",
        "218" : "631132",
        
        "306" : "669012",
        "307" : "618222",
        "308" : "612782",
        "309" : "619552",
        "310" : "619364",
        "314" : "624498",
        "316" : "622334",
         
        "401" : "631130",
        "402" : "631114",
        "403" : "631108",
        "405" : "631112",
        "406" : "631120",
        "407" : "631134",
        "409" : "631106",
        "410" : "631102",
        "411" : "631110",
        "412" : "631128",
        "413" : "631126",
        "414" : "631124",
        "415" : "631118",
        "416" : "631116"
    ]
    
    
    var unitNumberToParkingSpot: [String:String] = [
        "208" : "44/43",
        "209" : "15/16",
        "212" : "3/4",
        "215" : "1/2",
        "218" : "46/45",
        
        "306" : "28/27",
        "307" : "60",
        "308" : "19/20",
        "309" : "57",
        "310" : "619364",
        "314" : "63",
        "316" : "42/41",
         
        "401" : "73",
        "402" : "72",
        "403" : "71",
        "405" : "69",
        "406" : "13/14",
        "407" : "9/10",
        "409" : "68",
        "410" : "67",
        "411" : "66",
        "412" : "30/29",
        "413" : "34/33",
        "414" : "Retail",
        "415" : "38/37",
        "416" : "32/31"
    ]
    
    
    var unitNumberToServiceFee: [String: String] = [
        
        "208" : AppConstants.cleaningFee2B2B,
        "209" : AppConstants.cleaningFee1B1B,
        "212" : AppConstants.cleaningFee2B2B,
        "214" : AppConstants.cleaningFee2B2B,
        "215" : AppConstants.cleaningFee2B2B,
        "218" : AppConstants.cleaningFee3B3B,
        
        "306" : AppConstants.cleaningFee1B1B,
        "307" : AppConstants.cleaningFee2B2B,
        "308" : AppConstants.cleaningFee2B2B,
        "309" : AppConstants.cleaningFee1B1B,
        "310" : AppConstants.cleaningFee1B1B,
        "313" : AppConstants.cleaningFee2B2B,
        "314" : AppConstants.cleaningFee2B2B,
        "316" : AppConstants.cleaningFee2B2B,
        
        "401" : AppConstants.cleaningFee1B1B,
        "402" : AppConstants.cleaningFee2B2B,
        "403" : AppConstants.cleaningFee2B2B,
        "405" : AppConstants.cleaningFee2B2B,
        "406" : AppConstants.cleaningFee1B1B,
        "407" : AppConstants.cleaningFee2B2B,
        "409" : AppConstants.cleaningFee1B1B,
        "410" : AppConstants.cleaningFee1B1B,
        "411" : AppConstants.cleaningFee1B1B,
        "412" : AppConstants.cleaningFee2B2B,
        "413" : AppConstants.cleaningFee2B2B,
        "414" : AppConstants.cleaningFee2B2B,
        "415" : AppConstants.cleaningFee2B2B,
        "416" : AppConstants.cleaningFee1B1B,
        
        "Vacuum(Hallways)"      : AppConstants.cleaningFeeHallwaysVacuum,
        "Lobby&Bathroom"        : AppConstants.cleaningFeeLobbyAndBathroom,
        "Courtyard Bathroom"    : AppConstants.cleaningFeeCourtyardBathroom,
        "Elevator&Stain Carpet" : AppConstants.cleaningFeeElevatorAndStainCarpet
    ]
    
}

//        "Jose-Labor": ""
//        "Power Wash(Garage)":
//        "Shopping":

/*
 631100 - 212
 631098 - 215
 631132 - 218
 
 631130 - 401
 631114 - 402
 631108 - 403
 631112 - 405
 631120 - 406
 631134 - 407
 631106 - 409
 631102 - 410
 631110 - 411
 631128 - 412
 631126 - 413
 631124 - 414
 631118 - 415
 631116 - 416
 */


/*
 622332 - 208
 619218 - 209
 
 669012 - 306
 618222 - 307
 612782 - 308
 619552 - 309
 619364 - 310
 624498 - 314
 622334 - 316
 */
