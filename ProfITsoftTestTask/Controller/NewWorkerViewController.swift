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
    
    var selectedCompany: String = "None"
    var worker = WorkerModel()
    
    
    @IBAction func saveButton(_ sender: Any) {
        alertMessage()
        saveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func alertMessage() {
        
        let alertController = UIAlertController(title: "", message: "Saving done ✅", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action:UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }
                
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func saveData() {

//        let workersDictionary: [String: Any] = [
//
//            "imageURL": ImageCell.imageFromImageCell,
//            "name": worker.name,
//            "lastname": LastnameCell.lastnameFromTextField,
//            "birthday": BirthdayCell.birthdayFromDAyPicker,
//            "company": CompanyCell.chosenCompany
//        ]
//        print(worker.name)

        DataManager.instance.saveData(worker)
    }
}
 
extension NewWorkerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            
            cell.configureCell(worker)
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell") as! NameCell
            
            cell.configureCell(worker)
            
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastnameCell") as! LastnameCell
            
            cell.configureCell(worker)
            
            return cell
            
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirthdayCell") as! BirthdayCell
            
            cell.configureCell(worker)
            
            return cell
            
        } else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell") as! CompanyCell
            
            cell.configureCell(selectedCompany, model: worker)
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            
            let companiesViewController = self.storyboard?.instantiateViewController(identifier: "CompaniesViewController") as! CompaniesViewController
            
            companiesViewController.delegate = self
            
            self.navigationController?.pushViewController(companiesViewController, animated: true)
        }
    }
}

extension NewWorkerViewController: CompaniesViewControllerDelegate {
    func dataReceive(data: String) {
        selectedCompany = data
    }
}

