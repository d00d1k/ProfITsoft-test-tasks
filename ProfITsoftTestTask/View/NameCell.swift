//
//  NameCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit
import Foundation

class NameCell: UITableViewCell {
    
    var worker: WorkerModel?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func getNameFromTextField() {
        
        worker?.name = nameTextField.text
    }
    
    func configureCell(_ model: WorkerModel) {
        
        self.worker = model
    }
}
