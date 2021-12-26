//
//  AddNewServiceVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class AddNewServiceVC: UIViewController {
    
    let containerView    = UIView(frame: .zero)
    let titleLabel       = CHTitleLabel(textAlignment: .center, fontSize: 20.0)
    let dateTextField    = CHTextField(placeholder: "Choose the date")
    let serviceTextField = CHTextField(placeholder: "Choose the service")
    let feeLabel         = CHTitleLabel(textAlignment: .center, fontSize: 24)
    let pickerView       = UIPickerView()
    let datePickerView   = UIDatePicker()
    let actionButton     = CHButton(backgroundColor: .systemRed, title: "Ok")
    let saveButton       = CHButton(backgroundColor: .systemGreen, title: "Save")
    let dismissButton    = CHButton(backgroundColor: .systemRed, title: "Cancel")
    let padding: CGFloat = 15.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        // Do any additional setup after loading the view.
        configureContainerView()
        configureTitleLabel()
        configureDateTextField()
        configureFeeLabel()
        configureServiceTextField()
        configurePickerView()
        configureDatePicker()
        configureSaveButton()
        configureDismissButton()
        dateTextField.becomeFirstResponder()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDatePicker()
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
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            
        ])
    }
    
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.backgroundColor  = .systemBackground
        titleLabel.text             = "New Service"
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }

    
    func configureDateTextField() {
        containerView.addSubview(dateTextField)
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            dateTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            dateTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            dateTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureFeeLabel() {
        containerView.addSubview(feeLabel)
        
        NSLayoutConstraint.activate([
            feeLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: padding),
            feeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            feeLabel.heightAnchor.constraint(equalToConstant: 44),
            feeLabel.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureServiceTextField() {
        containerView.addSubview(serviceTextField)
        
        NSLayoutConstraint.activate([
            serviceTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: padding),
            serviceTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            serviceTextField.trailingAnchor.constraint(equalTo: feeLabel.leadingAnchor, constant: -padding),
            serviceTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    
    func configureSaveButton() {
        containerView.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
     func configureDismissButton() {
         containerView.addSubview(dismissButton)
         dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
         
         NSLayoutConstraint.activate([
             dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
             dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
             dismissButton.widthAnchor.constraint(equalToConstant: 120),
             dismissButton.heightAnchor.constraint(equalToConstant: 44)
         ])
     }
     
    
    @objc func saveButtonPressed() {
        
      
        let data: [String:Any] = ["date": dateTextField.text!,
                                  "unit": serviceTextField.text!,
                                  "fee":  feeLabel.text!
                                ]

        Firestore.firestore().collection("Janitor Hours")
            .document(Date().getCalendarYear())
            .collection(Date().getCalendarMonth())
            .document("\(dateTextField.text!)")
            .collection("Services")
            .document("\(serviceTextField.text!)")
            .setData(data)
            
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
    func configurePickerView() {
        pickerView.delegate         = self
        pickerView.dataSource       = self
        serviceTextField.inputView  = pickerView
    }
    
    
    func configureDatePicker() {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
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
        formatter.dateFormat = "MMM dd, E"
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
