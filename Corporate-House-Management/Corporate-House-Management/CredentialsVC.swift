//
//  CredentialsVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/13/21.
//

import UIKit

class CredentialsVC: UIViewController {

    let credentialsImageView    = UIImageView()
    let clientIdTextField       = CHTextField()
    let clientSecretTextField   = CHTextField()
    let credentialsActionButton = CHButton(backgroundColor: .systemBlue, title: "Get Listings")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCredentialsImageView()
        configureClientIdTextField()
        configureClientSecretTextField()
        configureCredentialsActionButton()
        // Do any additional setup after loading the view.
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
        
        NSLayoutConstraint.activate([
            clientIdTextField.topAnchor.constraint(equalTo: credentialsImageView.bottomAnchor, constant: 48),
            clientIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            clientIdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            clientIdTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureClientSecretTextField() {
        view.addSubview(clientSecretTextField)
        
        NSLayoutConstraint.activate([
            clientSecretTextField.topAnchor.constraint(equalTo: clientIdTextField.bottomAnchor, constant: 24),
            clientSecretTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            clientSecretTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            clientSecretTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCredentialsActionButton() {
        view.addSubview(credentialsActionButton)
        
        NSLayoutConstraint.activate([
            credentialsActionButton.topAnchor.constraint(equalTo: clientSecretTextField.bottomAnchor, constant: 48),
            credentialsActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            credentialsActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            credentialsActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
