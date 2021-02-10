//
//  LastnameCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class LastnameCell: UITableViewCell {

    static var lastnameFromTextField = String()
    var worker: WorkerModel?
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBAction func getLastnameFromTextField() {
        worker?.lastname = lastnameTextField.text
    }
    
    func configureCell(_ model: WorkerModel) {
        
        self.worker = model
    }
}
