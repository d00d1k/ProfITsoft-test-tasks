//
//  DataManager.swift
//  ProfITsoftTestTask
//
//  Created by Nikita Kalyuzhnyy on 02.02.2021.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    static var instance = DataManager()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
//    func saveData(_ dictionary: [String: Any]) {
//
//        let workers = NSEntityDescription.insertNewObject(forEntityName: "WorkerEntity", into: context!) as! WorkerEntity
//
//        workers.setValue(dictionary["imageURL"] as! Data, forKey: "imageURL")
//        workers.setValue(dictionary["name"] as! String, forKey: "name")
//        workers.setValue(dictionary["lastname"] as! String, forKey: "second_name")
//        workers.setValue(dictionary["birthday"] as! NSDate, forKey: "birthday")
//        workers.setValue(dictionary["company"] as! String, forKey: "company")
//
//        do {
//            try context?.save()
//            print("Data is saved")
//
//        } catch {
//            print("Data is not save")
//        }
//    }
    
    func saveData(_ worker: WorkerModel) {
        
        let workers = NSEntityDescription.insertNewObject(forEntityName: "WorkerEntity", into: context!) as! WorkerEntity
        
        print(worker.name)
        
        if let name = worker.name,
           let lastname = worker.lastname,
           let company = worker.company,
           let birthday = worker.birthday,
           let imageURL = worker.imageURL {
            
            workers.name = name
            workers.second_name = lastname
            workers.birthday = birthday
            workers.company = company
            workers.imageURL = imageURL
        }
        
//        workers.imageURL = worker.imageURL
//
//        workers.second_name = worker.lastname
//        workers.birthday = worker.birthday
//        workers.company = worker.company
        //workers.setValue(worker.name, forKey: "")
        
        do {
            try context?.save()
            print("Data is saved")
            
        } catch {
            print("Data is not save")
        }
    }
    
    func fetchData() -> [WorkerEntity]    {
        
        var workersEntity = [WorkerEntity]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "WorkerEntity")
        
        do {
            workersEntity = try context?.fetch(fetchRequest) as! [WorkerEntity]
            
            for workers in 0..<workersEntity.count {
                let data = workersEntity[workers]
                print("name \(data.value(forKey: "name") ?? "No name")")
                print("lastname \(data.value(forKey: "second_name") ?? "No lastname")")
                print("birthday \(data.value(forKey: "birthday") ?? "No birthday")")
                print("company \(data.value(forKey: "company") ?? "No company")")
            }
            
        } catch let err {
            print("Error fetch -: \(err.localizedDescription)")
        }
        return workersEntity
    }
}
