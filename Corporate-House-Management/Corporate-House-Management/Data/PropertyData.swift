//
//  PropertyData.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation

class PropertyData {
    
    static let shared = PropertyData()
    
    func getMayPropertiesNames() -> String {
        let properties =    "properties[]=631098&" +
                            "properties[]=631100&" +
                            "properties[]=631102&" +
                            "properties[]=631106&" +
                            "properties[]=631108&" +
                            "properties[]=631110&" +
                            "properties[]=631112&" +
                            "properties[]=631114&" +
                            "properties[]=631116&" +
                            "properties[]=631118&" +
                            "properties[]=631120&" +
                            "properties[]=631124&" +
                            "properties[]=631126&" +
                            "properties[]=631128&" +
                            "properties[]=631130&" +
                            "properties[]=631132&" +
                            "properties[]=631134&"
        
        return properties
    }
    
    
    func getAngelPropertiesNames() -> String {
        let properties =    "properties[]=612782&" +
                            "properties[]=618222&" +
                            "properties[]=619218&" +
                            "properties[]=619364&" +
                            "properties[]=619552&" +
                            "properties[]=622332&" +
                            "properties[]=622334&" +
                            "properties[]=624498&" +
                            "properties[]=669012&"

        return properties
    }
    
}

/*
 631098 - 215
 631100 - 212
 631102 - 410
 631106 - 409
 631108 - 403
 631110 - 411
 631112 - 405
 631114 - 402
 631116 - 416
 631118 - 415
 631120 - 406
 631124 - 414
 631126 - 413
 631128 - 412
 631130 - 401
 631132 - 218
 631134 - 407
 */


/*
 612782 - 308
 618222 - 307
 619218 - 209
 619364 - 310
 619552 - 309
 622332 - 208
 622334 - 316
 624498 - 314
 669012 - 306
 */
