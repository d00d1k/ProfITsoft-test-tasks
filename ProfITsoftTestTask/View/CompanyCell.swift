//
//  CompanyCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    static var chosenCompany: String = "None"
    var worker: WorkerModel?
    
    @IBOutlet weak var companyName: UILabel!
    
    func configureCell(_ companyName: String, model: WorkerModel) {
        
        self.companyName.text = companyName
        self.worker = model
        worker?.company = companyName
    }
}

