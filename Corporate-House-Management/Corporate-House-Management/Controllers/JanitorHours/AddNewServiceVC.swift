//
//  AddNewServiceVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import UIKit

class AddNewServiceVC: UIViewController {

    let navigationView   = UIView(frame: .zero)
    let dismissButton    = CHButton(backgroundColor: .systemRed, title: "X")
    let titleLabel       = CHTitleLabel(textAlignment: .center, fontSize: 30)
    let dateTextField    = CHTextField(placeholder: "Choose the date")
    let serviceTextField = CHTextField(placeholder: "Choose the service")
    let feeTextField     = CHTextField(frame: .zero)
    let pickerView       = UIPickerView()
    
    let services = ["208", "212", "215", "218"]
    
    let dates    = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureNavigationView()
        configureDismissButton()
        configureTitleLabel()
        configureServiceTextField()
        configureDateTextField()
        configurePickerView()
    }


    func configureNavigationView() {
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.backgroundColor = .systemYellow
        
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
        view.addSubview(serviceTextField)
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            serviceTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: padding),
            serviceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            serviceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            serviceTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    
    func configureDateTextField() {
        view.addSubview(dateTextField)
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: serviceTextField.bottomAnchor, constant: padding),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configurePickerView() {
        pickerView.delegate         = self
        pickerView.dataSource       = self
        serviceTextField.inputView  = pickerView
        dateTextField.inputView     = pickerView
        
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}

extension AddNewServiceVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if serviceTextField.isFirstResponder {
            return services.count
        }else if dateTextField.isFirstResponder {
            return dates.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if serviceTextField.isFirstResponder {
            return services[row]
        }else if dateTextField.isFirstResponder {
            return dates[row]
        }
        return "title"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if serviceTextField.isFirstResponder {
            serviceTextField.text = services[row]
            serviceTextField.resignFirstResponder()
            print(Dictionaries.shared.unitNumberToCleaningFee[services[row]] ?? "0")
        }else if dateTextField.isFirstResponder {
            dateTextField.text = dates[row]
            serviceTextField.resignFirstResponder()
        }
    }
    
}
