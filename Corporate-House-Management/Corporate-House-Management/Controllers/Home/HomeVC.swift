//
//  HomeVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
  
    
    func getReservations() {
        let client_id = ""
        let client_secret = ""
        
        TokenService.shared.requestToken(client_id: client_id, client_secret: client_secret, userDefaultKey: "m_token")
//        delayWithSeconds(3) {
//            ReservationAPI.shared. { reservation, errorMessage in
//                guard let reservation = reservation else {
//                    print(errorMessage!)
//                    return
//                }
//                for i in reservation.data {
//                    let listingId = i.listingId
//                    let unitId:String = Dictionaries.shared.listingIdToUnitName[listingId] ?? "no found"
//                    print("Unit id \(unitId) " + "\(i.checkIn)" + "\(i._included[0].data.firstName)")
//                }
//            }
//        }
    }
    
}
