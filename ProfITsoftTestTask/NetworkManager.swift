//
//  NetworkManager.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 03.02.2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
