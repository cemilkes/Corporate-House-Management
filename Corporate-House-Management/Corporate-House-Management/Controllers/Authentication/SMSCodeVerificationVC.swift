//
//  SMSCodeVerificationVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 4/3/22.
//

import UIKit

class SMSCodeVerificationVC: UIViewController, UITextFieldDelegate {

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
        view.backgroundColor = .systemGreen
        view.addSubview(smsCodeTextField)
        smsCodeTextField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        smsCodeTextField.center = view.center
        smsCodeTextField.delegate = self
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
