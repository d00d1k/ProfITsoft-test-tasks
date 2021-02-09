//
//  WorkersListViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 05.02.2021.
//

import UIKit

class WorkersListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var workersDataSource = [WorkerEntity]()
    
    @IBAction func createNewWorkerButton(_ sender: Any) {
        
        let newWorkerViewController = self.storyboard?.instantiateViewController(identifier: "NewWorkerViewController") as! NewWorkerViewController
        
        self.navigationController?.pushViewController(newWorkerViewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.workersDataSource = DataManager.instance.fetchData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.workersDataSource = DataManager.instance.fetchData()
    }
}

extension WorkersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workersDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerInformationCell") as! WorkerInformationCell
        
        cell.worker = workersDataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let workerDetailedInformationViewController = self.storyboard?.instantiateViewController(identifier: "WorkerDetailedInformationViewController") as! WorkerDetailedInformationViewController
        
        workerDetailedInformationViewController.workerDetails = workersDataSource[indexPath.row]
        
        self.navigationController?.pushViewController(workerDetailedInformationViewController, animated: true)
    }
}
