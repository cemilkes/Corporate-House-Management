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
        
        guard let client_id_a = Bundle.main.infoDictionary?["CLIENT_ID_A"] as? String,
              let client_id_m = Bundle.main.infoDictionary?["CLIENT_ID_M"] as? String,
              let client_server_a = Bundle.main.infoDictionary?["CLIENT_SECRET_A"] as? String,
              let client_server_m = Bundle.main.infoDictionary?["CLIENT_SECRET_M"] as? String else {
                  return
        }
        
        print(client_id_a)
        print(client_id_m)
        print(client_server_a)
        print(client_server_m)
        
    }
  
    
    func getReservations() {
        let client_id = ""
        let client_secret = ""
        
        TokenService.shared.requestToken(client_id: client_id, client_secret: client_secret, userDefaultKey: "m_token")
//        delayWithSeconds(3) {
//            ReservationAPI.shared. { reservation, errorMessage in
//                guard let reservation = reservation else {
//                    print(errorMessage!.rawValue)
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
