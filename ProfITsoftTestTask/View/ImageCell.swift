//
//  ImageCell.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 01.02.2021.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell {
    
    var worker: WorkerModel?
    
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
            
            NetworkManager.shared.getData(from: URL(string: "https://picsum.photos/200")!) { [self] (data, response, error) in
                worker?.imageURL = data
                guard let data = data,
                      error == nil else { return }
                
                print("img\(worker?.imageURL)")
                DispatchQueue.main.async() { [weak self] in
                    //self?.worker?.imageURL = data
                    print("name\(worker?.name)")
                    self?.imageOfProfile.image = UIImage(data: data)
                }
                
            }
        }
    }
    
    func configureCell(_ model: WorkerModel) {
        
        self.worker = model
    }
}


