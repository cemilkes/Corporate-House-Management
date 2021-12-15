//
//  SettingsVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        // Do any additional setup after loading the view.
    }
    

    // Use this one on client id/secret - Search Screen UI Programatically - Sean Allen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.isNavigationBarHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
