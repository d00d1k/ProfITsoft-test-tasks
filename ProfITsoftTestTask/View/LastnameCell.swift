//
//  LastnameCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class LastnameCell: UITableViewCell {

    static var lastnameFromTextField = String()
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBAction func getLastnameFromTextField() {
        LastnameCell.lastnameFromTextField = returnLastnameFromTextfield(optionalName: lastnameTextField?.text)
        print(LastnameCell.lastnameFromTextField)
    }
    
    func returnLastnameFromTextfield(optionalName: String?) -> String {
        
        if let name = lastnameTextField.text {
            return name
        } else {
            return "None"
        }
    }
}
