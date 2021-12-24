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
    let titleLabel       = CHTitleLabel(textAlignment: .center, fontSize: 24)
    let dateTextField    = CHTextField(placeholder: "Choose the date")
    let serviceTextField = CHTextField(placeholder: "Choose the service")
    let feeLabel         = CHTitleLabel(textAlignment: .center, fontSize: 20)
    let pickerView       = UIPickerView()
    let datePickerView   = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureNavigationView()
        configureDismissButton()
        configureTitleLabel()
        configureDateTextField()
        configureFeeLabel()
        configureServiceTextField()
        configurePickerView()
        //configureDatePicker()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDatePicker()
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
        titleLabel.backgroundColor  = .systemBackground
        titleLabel.text             = "Add New Service"
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureScrollView() {
        
    }
    
    
    func configureDateTextField() {
        view.addSubview(dateTextField)
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: padding),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureFeeLabel() {
        view.addSubview(feeLabel)
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            feeLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: padding),
            feeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            feeLabel.heightAnchor.constraint(equalToConstant: 44),
            feeLabel.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureServiceTextField() {
        view.addSubview(serviceTextField)
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            serviceTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: padding),
            serviceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            serviceTextField.trailingAnchor.constraint(equalTo: feeLabel.leadingAnchor, constant: -padding),
            serviceTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    

    func configurePickerView() {
        pickerView.delegate         = self
        pickerView.dataSource       = self
        serviceTextField.inputView  = pickerView
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
    func configureDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
        toolBar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView        = toolBar
        dateTextField.inputView                 = datePickerView
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode           = .date
        datePickerView.date                     = Date()
        datePickerView.locale                   = .current
    }
    
    
    @objc func doneButtonPressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dateTextField.text  = formatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
    
}

extension AddNewServiceVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return ServiceData.shared.services.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return ServiceData.shared.services[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        serviceTextField.text = ServiceData.shared.services[row]
        feeLabel.text = "$" + (Dictionaries.shared.unitNumberToServiceFee[ServiceData.shared.services[row]] ?? "0")
        serviceTextField.resignFirstResponder()
        
    }
    
}
