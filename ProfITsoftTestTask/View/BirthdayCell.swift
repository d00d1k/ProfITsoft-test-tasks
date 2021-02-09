//
//  BirthdayCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class BirthdayCell: UITableViewCell {
    
    static var birthdayFromDAyPicker = NSDate()
    
    @IBOutlet weak var birthdayOutlet: UIDatePicker!
    
    @IBAction func birthdayDayPicker(_ sender: UIDatePicker) {
        
        BirthdayCell.birthdayFromDAyPicker = birthdayOutlet.date as NSDate
    }
}
