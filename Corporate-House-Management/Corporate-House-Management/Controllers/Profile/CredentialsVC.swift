//
//  CredentialsVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/13/21.
//

import UIKit

class CredentialsVC: UIViewController, UITextFieldDelegate {

    let credentialsImageView    = UIImageView()
    let clientIdTextField       = CHTextField()
    let clientSecretTextField   = CHTextField()
    let credentialsActionButton = CHButton(backgroundColor: .systemBlue, title: "Get Listings")
    
    var credentialsEntered: Bool {
        return (!clientIdTextField.text!.isEmpty && !clientSecretTextField.text!.isEmpty)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCredentialsImageView()
        configureClientIdTextField()
        configureClientSecretTextField()
        configureCredentialsActionButton()
        createDismissKeyboardTapGesture()
        // Do any additional setup after loading the view.
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func configureCredentialsImageView() {
        view.addSubview(credentialsImageView)
        credentialsImageView.translatesAutoresizingMaskIntoConstraints = false
        credentialsImageView.image = UIImage(named: "credentials")
        
        NSLayoutConstraint.activate([
            credentialsImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            credentialsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            credentialsImageView.heightAnchor.constraint(equalToConstant: 100),
            credentialsImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    func configureClientIdTextField() {
        view.addSubview(clientIdTextField)
        clientIdTextField.delegate      = self
        clientIdTextField.returnKeyType = .next
        
        NSLayoutConstraint.activate([
            clientIdTextField.topAnchor.constraint(equalTo: credentialsImageView.bottomAnchor, constant: 48),
            clientIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            clientIdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            clientIdTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureClientSecretTextField() {
        view.addSubview(clientSecretTextField)
        clientSecretTextField.delegate  = self
        clientIdTextField.returnKeyType = .go
        
        NSLayoutConstraint.activate([
            clientSecretTextField.topAnchor.constraint(equalTo: clientIdTextField.bottomAnchor, constant: 24),
            clientSecretTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            clientSecretTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            clientSecretTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCredentialsActionButton() {
        view.addSubview(credentialsActionButton)
        credentialsActionButton.addTarget(self, action: #selector(pushCredentialsDetailVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            credentialsActionButton.topAnchor.constraint(equalTo: clientSecretTextField.bottomAnchor, constant: 48),
            credentialsActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            credentialsActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            credentialsActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func pushCredentialsDetailVC() {
        
        guard credentialsEntered else {
            print("Please enter credentials")
            presentCHAlertOnMainThread(title: "Empty Credentials",
                                       message: "Please enter the crendetials",
                                       buttonTitle: "Ok")
            return
        }
        
        let credentialsDetailVC             = CredentialsDetailVC()
        credentialsDetailVC.clientId        = clientIdTextField.text ?? ""
        credentialsDetailVC.clientSecret    = clientSecretTextField.text ?? ""
        credentialsDetailVC.title           = "Credentials"
        navigationController?.pushViewController(credentialsDetailVC, animated: true)
    }
    
}

extension CredentialsVC: UITextViewDelegate {
    // THis acts when you pressed the "Return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == clientIdTextField) {
            print("id tapped")
        }else if(textField == clientSecretTextField) {
            pushCredentialsDetailVC()
            print("secret tapped")
        }
        
        return true
    }
}
