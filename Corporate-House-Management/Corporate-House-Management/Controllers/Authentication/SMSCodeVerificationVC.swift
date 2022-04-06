//
//  SMSCodeVerificationVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 4/3/22.
//

import UIKit

class SMSCodeVerificationVC: UIViewController, UITextFieldDelegate {

    
    let submitButton = CHButton(backgroundColor: .systemCyan, title: "SUBMIT")
    
    private let smsCodeTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.placeholder = "Enter verification code"
        field.returnKeyType = .done
        field.keyboardType = .namePhonePad
        field.textAlignment = .center
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureSmsCodeTextField()
        configureSubmitButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        smsCodeTextField.becomeFirstResponder()
    }
    
    func configureSmsCodeTextField() {
        view.addSubview(smsCodeTextField)
        smsCodeTextField.delegate = self
        smsCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsCodeTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            smsCodeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smsCodeTextField.heightAnchor.constraint(equalToConstant: 50),
            smsCodeTextField.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = smsCodeTextField.text, !text.isEmpty {
            let verificationCode = text
            
            AuthManager.shared.verifyCode(smsCode: verificationCode) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc      = TabbarVC()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        }else {
            print("Phone number field is empty")
        }
        
        return true
    }

    func configureSubmitButton() {
        view.addSubview(submitButton)
        submitButton.addTarget(nil, action: #selector(didTapSubmitButton), for: .touchUpInside)
        let padding: CGFloat = 18
        
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -padding),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

    
    @objc func didTapSubmitButton() {
        smsCodeTextField.resignFirstResponder()
        if let text = smsCodeTextField.text, !text.isEmpty {
            let verificationCode = text
            
            AuthManager.shared.verifyCode(smsCode: verificationCode) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc      = TabbarVC()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        }else {
            print("Phone number field is empty")
        }
    }

}
