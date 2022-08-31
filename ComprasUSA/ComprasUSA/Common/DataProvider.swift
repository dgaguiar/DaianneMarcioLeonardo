//
//  DataRouter.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation
import CoreData
import UIKit

class DataProvider {
    
    static func context() -> NSManagedObjectContext?  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managerContext = appDelegate.persistentContainer.viewContext
        return managerContext
    }
    
    static  func fetchStates() -> [State] {
        guard let managerContext = DataProvider.context() else { return [] }
        
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
    
    static func fetchProdutcs() -> [Product] {
        guard let managerContext = DataProvider.context() else { return [] }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")
        
        do {
            let products = try managerContext.fetch(fetchRequest) as! [Product]
            print("Lista de Estados : \(products)")
            return products
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
            return []
        }
    }
    
    static func deleteProduct() {
        guard let managerContext = DataProvider.context() else { return }
        let products = DataProvider.fetchProdutcs()
        for product in products {
            managerContext.delete(product)
        }
    }
    
    static func deleteAllState() {
        guard let managerContext = DataProvider.context() else { return }
        let states = DataProvider.fetchStates()
        for state in states {
            managerContext.delete(state)
        }
    }
    
    static func deleteState(_ state: State) {
        guard let managerContext = DataProvider.context() else { return }
        managerContext.delete(state)
    }
}
