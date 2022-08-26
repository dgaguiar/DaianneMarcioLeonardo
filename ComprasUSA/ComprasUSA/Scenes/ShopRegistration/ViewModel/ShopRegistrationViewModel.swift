//
//  ShopRegistrationViewModel.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation
import CoreData
import UIKit

protocol ShopRegistrationViewModelProtocol: AnyObject {
    func fetchStates() -> [State]
    func saveProduct(item: Product, state: State)
}

class ShopRegistrationViewModel: ShopRegistrationViewModelProtocol {
    
    var stateCompletion = {}
    
    func fetchStates() -> [State] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managerContext = appDelegate.persistentContainer.viewContext
        
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
    
    func saveProduct(item: Product, state: State) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        // Created State
//        let state = State(context: managerContext)
//        state.name = "Sao Paulo"
        
        // Create Products
        let product = Product(context: managerContext)
        product.name = item.name
        product.place = item.place
        product.value = item.value
        
        state.addToShop(product)
        
        // save context
        do {
            try managerContext.save()
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
}
