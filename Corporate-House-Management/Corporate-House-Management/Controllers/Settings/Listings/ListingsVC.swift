//
//  ListingsVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit

class ListingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        // Do any additional setup after loading the view.
        
        TokenService.shared.requestToken(client_id: "",
                                         client_secret: "", userDefaultKey: "m_listings")
        
        delayWithSeconds(3.0) {
            ListingsAPI.shared.getListings(for: "",
                                           clientSecret: "",
                                           hostUserDefault: "m_listings", page: 1) { result in
                
                switch result {
                    
                case .success(let listings):
                    print(listings)
                case .failure(let error):
                    print(error.rawValue)
                }
                
            }
        }
    }

}
