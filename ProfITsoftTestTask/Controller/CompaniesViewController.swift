//
//  CompaniesViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class CompaniesViewController: UITableViewController {
    
    private var companiesArray: [String] = [
    
        "Apple",
        "Google",
        "Tesla",
        "IBM",
        "Microsoft"
    ]
    
    private var selectedCompany = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }   
}

extension CompaniesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyNameCell", for: indexPath)
        
        cell.textLabel?.text = companiesArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCompany = companiesArray[indexPath.row]
        
        if let viewController = presentingViewController as? NewWorkerViewController {
            dismiss(animated: true) {
                viewController.returnCompany(company: self.selectedCompany)
            }
        }
    }
}
