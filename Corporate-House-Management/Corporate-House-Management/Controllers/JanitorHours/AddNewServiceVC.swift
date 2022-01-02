//
//  AddNewServiceVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/20/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

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
    var dailyTotal: Double = 0
    var currentMonthlyTotal: Double = 0
    var serviceArray: [Service] = []
    var ref: DatabaseReference!

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
        //dateTextField.becomeFirstResponder()
        serviceTextField.becomeFirstResponder()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDatePicker()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        if let janitorHoursVC = presentingViewController as? JanitorHoursVC {
//            janitorHoursVC.getData()
//            print("janitor hours get data called")
//        }
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
 

    func serviceDictionaryFrom(_ service: Service) -> NSDictionary {
        return NSDictionary(objects: [service.date, service.service, service.fee],
                            forKeys: ["date" as NSCopying, "service" as NSCopying, "fee" as NSCopying])
    }

    
//    func getDailyTotal(completion: @escaping ) {
//
//    }
    
    
    func downloadServiceDaysFromFirestore(completion: @escaping (_ serviceDictArray: Array<Dictionary<String, Any>>, _ dailyTotal: Double)-> Void) {

        Firestore.firestore().collection("Janitor Hours") .document(Date().getCalendarYear() + ", " + Date().getCalendarMonth())
            .collection("Days").document(Date().getCalendarDate()).getDocument { (snapshot, error) in

            guard let snapshot = snapshot else {
                print("no data")
                completion([], 0.0)
                return
            }
  
                //print(snapshot.data())
                if let services = snapshot.data()?["services"] as? Array<Dictionary<String,Any>> {
                    let serviceDictArray = services
                    completion(serviceDictArray, snapshot.data()!["dailyTotal"] as! Double)
                }else{
                    completion([], 0.0)
                }
        }
    }

    
    func addNewServiceData(){
        let service = Service(date: dateTextField.text!,
                              service: serviceTextField.text!,
                              fee: feeLabel.text!)
        let serviceDict = serviceDictionaryFrom(service)
        let dailyTotal = Double(feeLabel.text!)
        
        var serviceArray: [NSDictionary] = []
        serviceArray.append(serviceDict)
        
        let data: [String:Any] = [
            "date": dateTextField.text!,
            "dailyTotal": dailyTotal!,
            "services": serviceArray
        ]
        
        Firestore.firestore().collection("Janitor Hours")
            .document(Date().getCalendarYear() + ", " + Date().getCalendarMonth())
            .collection("Days")
            .document(Date().getCalendarDate()).setData(data)
    }
    
    
    @objc func saveButtonPressed() {
        var serviceArray: Array<Dictionary<String,Any>> = []
        
        showLoadingView()
        
        delayWithSeconds(2) {
            self.downloadServiceDaysFromFirestore { serviceDictArray, dailyTotal in
                if serviceDictArray.isEmpty {
                    self.addNewServiceData()
                }else {
                    let newService = Service(date: self.dateTextField.text!,
                                             service: self.serviceTextField.text!,
                                             fee: self.feeLabel.text!)
                    let serviceDict = self.serviceDictionaryFrom(newService)
                    serviceArray = serviceDictArray
                    serviceArray.append(serviceDict as! Dictionary<String, Any>)
                    
                    var newDailyTotal = dailyTotal
                    newDailyTotal = newDailyTotal + (Double(self.feeLabel.text!) ?? 0.0)

                    let data: [String:Any] = [
                        "date": self.dateTextField.text!,
                        "dailyTotal": newDailyTotal,
                        "services": serviceArray
                    ]
                    
                    Firestore.firestore().collection("Janitor Hours")
                        .document(Date().getCalendarYear() + ", " + Date().getCalendarMonth())
                        .collection("Days")
                        .document(Date().getCalendarDate()).setData(data)
                    
                    
                    
                }
                self.dismissLoadingView()
            }
        }
        
        dismissVC()
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
     
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, E"
        dateTextField.text = formatter.string(from: Date())
        dateTextField.isEnabled = false
    }
    
    
    @objc func doneButtonPressed() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, E"
        dateTextField.text  = formatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
    
    
    func configureToolBar() {
        
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
        feeLabel.text = (Dictionaries.shared.unitNumberToServiceFee[ServiceData.shared.services[row]] ?? "0")
        serviceTextField.resignFirstResponder()
        
    }
    
}
