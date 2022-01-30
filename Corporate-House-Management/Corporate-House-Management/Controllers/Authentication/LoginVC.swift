//
//  LoginVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 1/29/22.
//

import UIKit

class LoginVC: UIViewController {

    
    let logoImageView           = UIImageView()
    let userNameTextField       = CHTextField(placeholder: "Enter your username")
    let phoneNumberTextField    = CHTextField(placeholder: "Enter your phone number")
    let verifyPhoneNumberButton = CHButton(backgroundColor: #colorLiteral(red: 0, green: 0.5843137255, blue: 0.7333333333, alpha: 1).withAlphaComponent(0.5) , title: "Verify Phone Number")
    
    private var viewModel       = LoginViewModel(username: "", phoneNumber: "", userType: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUserNameTextField()
        configurePhoneNumberTextField()
        configureVerifyPhoneNumberButton()
        configureNotificationObservers()
        // Do any additional setup after loading the view.
    }
 
    
    @objc func textDidChange(sender: UITextField) {
        if sender == userNameTextField {
            viewModel.username = sender.text
        }else if(sender == phoneNumberTextField) {
            viewModel.phoneNumber = sender.text
        }
        
        verifyPhoneNumberButton.backgroundColor = viewModel.buttonBackgroundColor
        verifyPhoneNumberButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
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
        verifyPhoneNumberButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.67), for: .normal)
        NSLayoutConstraint.activate([
            verifyPhoneNumberButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            verifyPhoneNumberButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            verifyPhoneNumberButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            verifyPhoneNumberButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureNotificationObservers() {
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}
