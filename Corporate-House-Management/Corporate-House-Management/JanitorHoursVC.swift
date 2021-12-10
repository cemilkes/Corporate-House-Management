//
//  JanitorHoursVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit

class JanitorHoursVC: UIViewController {
    let tableView = UITableView()
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JanitorHoursVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = characters[indexPath.row]
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
