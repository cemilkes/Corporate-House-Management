//
//  CHAlertVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/18/21.
//

import UIKit

class CHAlertVC: UIViewController {

    let containerView    = UIView(frame: .zero)
    let titleLabel       = CHTitleLabel(textAlignment: .center, fontSize: 20.0)
    let messageLabel        = CHBodyLabel(textAlignment: .left)
    let actionButton = CHButton(backgroundColor: .systemRed, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var actionButtonTitle: String?
    
    let padding: CGFloat = 20.0
    
    init(alertTitle: String, message: String, actionButtonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle         = alertTitle
        self.message            = message
        self.actionButtonTitle  = actionButtonTitle
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }

    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground

        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.systemBackground.cgColor
        
        //widht height centerX centerY
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            containerView.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong."
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28.0)
        ])
    }
    
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(actionButtonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
    
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to Complete"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
