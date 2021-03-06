//
//  UIViewController+Ext.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/18/21.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
        
    func presentCHAlertOnMainThread(title:String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CHAlertVC(alertTitle: title, message: message, actionButtonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }
    
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.color = .systemGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    
    func configureBackgroundGradientLayer(in view: UIView) {
        let gradient        = CAGradientLayer()
        gradient.colors     = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations  = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame      = view.frame
        
    }
    
    // Phone number formatting
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }

    
}
