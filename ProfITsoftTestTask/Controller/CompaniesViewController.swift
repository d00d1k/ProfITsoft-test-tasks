//
//  CompaniesViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

protocol CompaniesViewControllerDelegate: AnyObject {
    func dataReceive(data: String)
}

class CompaniesViewController: UITableViewController {
    
    weak var delegate: CompaniesViewControllerDelegate?
    
    private var companiesArray: [String] = [
    
        "Apple",
        "Google",
        "Tesla",
        "IBM",
        "Microsoft"
    ]
    
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
        
        delegate?.dataReceive(data: companiesArray[indexPath.row])
        
        self.navigationController?.popViewController(animated: true)
    }
}
