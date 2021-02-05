//
//  NewWorkerViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import Foundation
import UIKit
import CoreData

class NewWorkerViewController: UITableViewController {
    
    static let shared = NewWorkerViewController()
    
    var worker: [WorkerEntity] = []
    var selectedCompany = String()
    
    @IBAction func saveButton(_ sender: Any) {
        alertMessage()
        saveWorker()
    }
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func returnCompany(company: String) {
        
        self.selectedCompany = company
        self.tableView.reloadData()
    }
    
    private func alertMessage() {
        
        let alertController = UIAlertController(title: "", message: "Saving done ✅", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
        }
                
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func saveWorker() {
        
        let workersDictionary: [String: Any] = [
        
            "imageURL": ImageCell.imageFromImageCell,
            "name": NameCell.nameFromTextField,
            "lastname": LastnameCell.lastnameFromTextField,
            "birthday": BirthdayCell.birthdayFromDAyPicker,
            "company": CompanyCell.chosenCompany
        ]
        
        DataManager.instance.saveData(workersDictionary)
    }
}
 
extension NewWorkerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell") as! NameCell
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastnameCell") as! LastnameCell
            return cell
            
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirthdayCell") as! BirthdayCell
            return cell
            
        } else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell") as! CompanyCell
            
            cell.configureCell(selectedCompany)
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
}
