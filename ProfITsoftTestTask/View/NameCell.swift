//
//  NameCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit
import Foundation

class NameCell: UITableViewCell {
    
    static var nameFromTextField = String()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func getNameFromTextField() {
        NameCell.nameFromTextField = returnNameFromTextfield(optionalName: nameTextField?.text)
        print(NameCell.nameFromTextField)
    }
    
    func returnNameFromTextfield(optionalName: String?) -> String {
        
        if let name = nameTextField.text {
            return name
        } else {
            return "None"
        }
    }
}
