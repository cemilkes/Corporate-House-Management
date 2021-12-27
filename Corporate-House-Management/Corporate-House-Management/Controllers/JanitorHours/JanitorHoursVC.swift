//
//  JanitorHoursVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

class JanitorHoursVC: UIViewController {
    
    let tableView = UITableView()
    let floatingButton = CHButton(backgroundColor: .systemCyan, title: "Add New Service")
    var services: [Service] = []
    var serviceDays: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // System background will adapt dark-light mode
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        tableView.dataSource = self
        configureFloatingButton()
        getMonthlyServiceData()
    }
    
    
    func getMonthlyServiceData() {
        Firestore.firestore().collection("Janitor Hours") .document(Date().getCalendarYear() + ", " + Date().getCalendarMonth())
            .collection("Days").getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot else {
                    return
                }
                print(snapshot.documents.count)
            }
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    func configureFloatingButton() {
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(pushAddNewServiceVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            floatingButton.heightAnchor.constraint(equalToConstant: 44),
            floatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            floatingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    
    @objc func pushAddNewServiceVC() {
        let addNewServiceVC = AddNewServiceVC()
        addNewServiceVC.modalPresentationStyle = .overFullScreen
        present(addNewServiceVC, animated: true, completion: nil)
    }
}

extension JanitorHoursVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return serviceDays.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ""
        return cell
    }
}


/* https://stackoverflow.com/questions/26596090/adding-sections-separated-by-dates-to-uitableview-in-swift
 My solution:

 struct TableItem {
     let title: String
     let creationDate: NSDate
 }

 var sections = Dictionary<String, Array<TableItem>>()
 var sortedSections = [String]()

 @IBAction func saveButton(sender: AnyObject) {

     let date:String = "your date in string..."

     //if we don't have section for particular date, create new one, otherwise we'll just add item to existing section
     if self.sections.indexForKey(date) == nil {
         self.sections[date] = [TableItem(title: name, creationDate: date)]
     }
     else {
         self.sections[date]!.append(TableItem(title: name, creationDate: date))
     }

     //we are storing our sections in dictionary, so we need to sort it
     self.sortedSections = self.sections.keys.array.sorted(>)
     self.tableView.reloadData()
 }
 tableView dataSource methods:

 override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     return sections.count
 }

 override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return sections[sortedSections[section]]!.count
 }

 override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

     var cell = tableView.dequeueReusableCellWithIdentifier("Cell")

     let tableSection = sections[sortedSections[indexPath.section]]
     let tableItem = tableSection![indexPath.row]

     cell.titleLabel?.text = tableItem.title

     return cell
 }

 override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return sortedSections[section]
 }
 */
