//
//  LoginVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/29/22.
//

import UIKit

class LoginVC: UIViewController {

    
    let logoImageView = UIImageView()
    let userNameTextField = CHTextField(placeholder: "Enter your username")
    let phoneNumberTextField = CHTextField(placeholder: "Enter your phone number")
    let verifyPhoneNumberButton = CHButton(backgroundColor: Color.primaryColor, title: "Verify Phone Number")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUserNameTextField()
        configurePhoneNumberTextField()
        configureVerifyPhoneNumberButton()
        // Do any additional setup after loading the view.
    }
 
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = Images.neoOnFirstLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 233),
            logoImageView.heightAnchor.constraint(equalToConstant: 46)
        ])
        
    }
    
    
    func configureUserNameTextField() {
        view.addSubview(userNameTextField)
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            userNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            userNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userNameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configurePhoneNumberTextField() {
        view.addSubview(phoneNumberTextField)
        NSLayoutConstraint.activate([
            phoneNumberTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            phoneNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureVerifyPhoneNumberButton() {
        view.addSubview(verifyPhoneNumberButton)
        NSLayoutConstraint.activate([
            verifyPhoneNumberButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            verifyPhoneNumberButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            verifyPhoneNumberButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            verifyPhoneNumberButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
