//
//  BirthdayCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import UIKit

class BirthdayCell: UITableViewCell {
    
    static var birthdayFromDAyPicker = NSDate()
    var worker: WorkerModel?
    
    @IBOutlet weak var birthdayOutlet: UIDatePicker!
    
    @IBAction func birthdayDayPicker(_ sender: UIDatePicker) {
        
        worker?.birthday = birthdayOutlet.date
    }
    
    func configureCell(_ model: WorkerModel) {
        
        self.worker = model
    }
}
