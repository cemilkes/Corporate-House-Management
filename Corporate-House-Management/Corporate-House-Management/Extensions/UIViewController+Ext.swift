//
//  UIViewController+Ext.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/18/21.
//

import UIKit

extension UIViewController {
        
    func presentCHAlertOnMainThread(title:String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CHAlertVC(alertTitle: title, message: message, actionButtonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }
}
