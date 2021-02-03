//
//  CompanyCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    static var chosenCompany: String = "None"
    
    @IBOutlet weak var companyName: UILabel!
    
    func configureCell(_ companyName: String) {
        
        self.companyName.text = companyName
        
        CompanyCell.chosenCompany = companyName
    }
}
