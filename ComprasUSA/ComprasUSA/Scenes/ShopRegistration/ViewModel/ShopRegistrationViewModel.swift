//
//  ShopRegistrationViewModel.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation
import CoreData
import UIKit

struct RegisterProduct {
    var name: String
    var value: Double
    var realValue: Double
    var isCard: Bool
    var image: String
    var state: State
}

protocol ShopRegistrationViewModelProtocol: AnyObject {
    func fetchStates() -> [State]
    func saveProduct(product: RegisterProduct, state: State)
}

class ShopRegistrationViewModel: ShopRegistrationViewModelProtocol {
    
    var stateCompletion = {}
    
    func fetchStates() -> [State] {
        return DataRouter.fetchStates()
    }
    
    func saveProduct(product: RegisterProduct, state: State) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        // Created State
//        let state = State(context: managerContext)
//        state.name = "Sao Paulo"
        
        // Create Products
        let product = Product(context: managerContext)
        product.name = product.name
//        product.place = state
        product.value = product.value
        product.image = product.image
        product.realValue = product.realValue
        
        state.addToShop(product)
        
        // save context
        do {
            try managerContext.save()
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
}
