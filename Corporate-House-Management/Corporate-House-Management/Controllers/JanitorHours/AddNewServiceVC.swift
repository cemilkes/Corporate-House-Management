//
//  AddNewServiceVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import UIKit

class AddNewServiceVC: UIViewController {

    let navigationView  = UIView(frame: .zero)
    let dismissButton   = CHButton(backgroundColor: .systemRed, title: "X")
    let titleLabel      = CHTitleLabel(textAlignment: .center, fontSize: 30)
    
    let serviceTextField = CHTextField(placeholder: "Choose a service")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureDismissButton()
        configureNavigationView()
        configureTitleLabel()
    }


    func configureNavigationView() {
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationView.heightAnchor.constraint(equalToConstant: 64)
        
        ])
    }
   

    
    func configureDismissButton() {
        navigationView.addSubview(dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: padding),
            dismissButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: padding),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalToConstant: 44)
        
        ])
    }
    
    
    func configureTitleLabel() {
        navigationView.addSubview(titleLabel)
        titleLabel.backgroundColor = .systemBlue
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureScrollView() {
        
    }
    
    
    func configureServiceTextField() {
        
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
