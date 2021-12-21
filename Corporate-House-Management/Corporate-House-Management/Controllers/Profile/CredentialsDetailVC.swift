//
//  CredentialsDetailVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/14/21.
//

import UIKit

class CredentialsDetailVC: UIViewController {

    var clientId: String!
    var clientSecret: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
