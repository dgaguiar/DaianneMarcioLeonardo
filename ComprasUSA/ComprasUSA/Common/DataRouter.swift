//
//  DataRouter.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation
import CoreData
import UIKit

class DataRouter {
    
    static func context() -> NSManagedObjectContext?  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managerContext = appDelegate.persistentContainer.viewContext
        return managerContext
    }
    
    static  func fetchStates() -> [State] {
        guard let managerContext = DataRouter.context() else { return [] }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "State")
        
        do {
            let states = try managerContext.fetch(fetchRequest) as! [State]
            print("Lista de Estados : \(states)")
            return states
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
            return []
        }
    }
}
