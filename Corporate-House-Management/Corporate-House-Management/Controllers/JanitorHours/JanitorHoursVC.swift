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
    
    let tableView                   = UITableView()
    let floatingButton              = CHButton(backgroundColor: .systemCyan, title: "Add New Service")
    var services: [Service]         = []
    var serviceDays: [NSDictionary] = []
    var totalServiceFees: Double    = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // System background will adapt dark-light mode
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        configureFloatingButton()
        tableView.dataSource = self
        //getData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        delayWithSeconds(2) {
            print("totalServiceFees: \(self.totalServiceFees)")
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func getData() {
        getMonthlyServiceData { serviceDays  in
            
            self.serviceDays = serviceDays
            //print(serviceDays)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    func getMonthlyServiceData(completion: @escaping ([NSDictionary]) -> Void) {
        
        Firestore.firestore().collection("Janitor Hours").document(Date().getCalendarYear() + ", " + Date().getCalendarMonth())
            .collection("Days").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
                
                var serviceDays: [NSDictionary] = []
                var totalServiceFeesSoFar = 0.0
               // var services: Array<Dictionary<String,Any>> = []
                
                guard let snapshot = snapshot else {
                    return
                }
                if !snapshot.isEmpty && snapshot.documents.count > 0 {
                    for days in snapshot.documents{
                        serviceDays.append(days.data() as NSDictionary)
                        totalServiceFeesSoFar = totalServiceFeesSoFar + (days.data()["dailyTotal"] as! Double)
                        //services.append(contentsOf: days.data()["services"] as! Array<Dictionary<String,Any>>)
                    }
                    self.totalServiceFees = totalServiceFeesSoFar
                    print("Total: \(totalServiceFeesSoFar)")
                    completion(serviceDays)
                }else{
                    print(error?.localizedDescription as Any)
                }
            }
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(JanitorHoursCell.self, forCellReuseIdentifier: JanitorHoursCell.reuseID)
    }

    
    func configureFloatingButton() {
        tableView.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(pushAddNewServiceVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            floatingButton.heightAnchor.constraint(equalToConstant: 44),
            floatingButton.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            floatingButton.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            floatingButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    
    @objc func pushAddNewServiceVC() {
        let addNewServiceVC = AddNewServiceVC()
        addNewServiceVC.modalPresentationStyle = .overCurrentContext
        present(addNewServiceVC, animated: true, completion: nil)
    }
}

extension JanitorHoursVC: UITableViewDataSource, UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50.0
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return serviceDays.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print((self.serviceDays[section]["services"] as! Array<Dictionary<String,Any>>).count)
        return (self.serviceDays[section]["services"] as! Array<Dictionary<String,Any>>).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JanitorHoursCell.reuseID, for: indexPath) as! JanitorHoursCell
        cell.configure()
        let service = self.serviceDays[indexPath.section]["services"] as! Array<Dictionary<String,Any>>
        
        cell.unitNumberLabel.text = "Unit " + (service[indexPath.row]["service"] as! String)
        cell.unitNumberCleaningFeeLabel.text = "$" + Dictionaries.shared.unitNumberToServiceFee[(service[indexPath.row]["service"] as! String)]!

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return ((serviceDays[section]["date"] as? String)!) + " - Daily Total: $" + "\(((serviceDays[section]["dailyTotal"] as? Double)!))"
        
        
    }

    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
//        sectionHeaderView.backgroundColor = .red
//        return sectionHeaderView
//    }
    
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
