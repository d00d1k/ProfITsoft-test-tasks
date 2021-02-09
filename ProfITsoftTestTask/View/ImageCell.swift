//
//  ImageCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell {
    
    static var imageFromImageCell = Data()
    
    @IBOutlet weak var imageOfProfile: UIImageView! {
        didSet {
            self.imageOfProfile.isUserInteractionEnabled = true
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        self.imageOfProfile.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped() {
        
        DispatchQueue.global().async {
            
            NetworkManager.shared.getData(from: URL(string: "https://picsum.photos/200")!) { (data, response, error) in
                guard let data = data,
                      error == nil else { return }
                
                DispatchQueue.main.async() { [weak self] in
                    ImageCell.imageFromImageCell = data
                    self?.imageOfProfile.image = UIImage(data: data)
                }
            }
        }
    }
}


