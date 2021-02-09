//
//  WorkerInformationCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 05.02.2021.
//

import UIKit
import Foundation

class WorkerInformationCell: UITableViewCell {
    
    
    @IBOutlet weak var imageOfProfile: UIImageView!
    @IBOutlet weak var workersName: UILabel!
    @IBOutlet weak var workersLastname: UILabel!
    
    var worker: WorkerEntity? {
        didSet {
            
            workersName.text = "Name: \(worker?.name ?? "errName")"
            workersLastname.text = "Lastname: \(worker?.second_name ?? "errLastname")"
            
            if let imageData = worker?.imageURL {
                imageOfProfile.image = UIImage(data: imageData)
            } else {
                imageOfProfile.image = UIImage(named: "sticker-png-question-mark-desktop-computer-icons-question-mark-miscellaneous-angle-thumbnail")
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(false, animated: true)
    }

}
