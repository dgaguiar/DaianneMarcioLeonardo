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
        return DataProvider.fetchStates()
    }
    
    func saveProduct(product: RegisterProduct, state: State) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        // Create Products
        let productM = Product(context: managerContext)
        productM.name = product.name
        productM.place = state
        productM.value = product.value
        productM.image = product.image
        productM.realValue = product.realValue
        productM.isCardPayment = product.isCard

        print(">>>>>> SAVE PRODUCT \(product)")

        // save context
        do {
            try managerContext.save()
            print(">>>>>> SUCCESS SAVE")
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
}
