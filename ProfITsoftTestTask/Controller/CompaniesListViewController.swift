//
//  CompaniesListViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 05.02.2021.
//

import UIKit

class CompaniesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func createNewCompany(_ sender: UIButton) {
        showAlertWithTextField()
    }
    
    private var workersEntityDataSource = [WorkerEntity]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.workersEntityDataSource = DataManager.instance.fetchData()
    }
    
    private func showAlertWithTextField() {
        
        let alertController = UIAlertController(title: "Создать новую компания", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Создать", style: .default) { (_) in
            
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                // operations
                print("Text==>" + text)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Название компании"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CompaniesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workersEntityDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyFromDataBase") {
            
            cell.textLabel?.text = workersEntityDataSource[indexPath.row].company
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
