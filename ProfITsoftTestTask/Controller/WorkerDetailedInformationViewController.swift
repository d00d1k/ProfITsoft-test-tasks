//
//  WorkerDetailedInformationViewController.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 05.02.2021.
//

import UIKit

class WorkerDetailedInformationViewController: UIViewController {
    
    @IBOutlet weak var imageOfProfile: UIImageView!
    @IBOutlet weak var workersNameLabel: UILabel!
    @IBOutlet weak var workersLastnameLabel: UILabel!
    @IBOutlet weak var workersCompanyLabel: UILabel!
    @IBOutlet weak var workersBirthdayLabel: UILabel!
    
    var workerDetails: WorkerEntity?
    
    override func viewWillAppear(_ animated: Bool) {
        
        workersNameLabel.text = "Name: \(workerDetails?.name ?? "empty")"
        workersLastnameLabel.text = "lastname: \(workerDetails?.second_name ?? "empty")"
        workersCompanyLabel.text = "company: \(workerDetails?.company ?? "empty")"
        
        let dateFormatter = DateFormatter()
        let today = Date()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if let formattedDate = dateFormatter.date(from: dateFormatter.string(from: workerDetails?.birthday ?? today )) {
            workersBirthdayLabel.text = dateFormatter.string(from: formattedDate)
        } else {
            workersBirthdayLabel.text = "No birthday date"
        }
        
        if let imageData = workerDetails?.imageURL {
            imageOfProfile.image = UIImage(data: imageData)
        } else {
            imageOfProfile.image = UIImage(named: "sticker-png-question-mark-desktop-computer-icons-question-mark-miscellaneous-angle-thumbnail")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
