//
//  ShopListViewModel.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import Foundation
import CoreData

protocol ShopListViewModelProtocol: AnyObject {
    func getProductsList() -> [ShopListModel]
}

class ShopListViewModel: ShopListViewModelProtocol {
    
    var repository: Any?
    
    var products: [NSManagedObject] = []
    
    convenience init(repository: Any?) {
        self.init()
        self.repository = repository
    }
    
    func getProductsList() -> [ShopListModel] {
        var list: [ShopListModel] = []
        for product in products {
           let product =  ShopListModel(name: product.value(forKey: "name") as! String,
                          dolValue: product.value(forKey: "value") as! Double, date: Date(), realValue: 0.00)
            list.append(product)
        }
//        let list = [
//            ShopListModel(name: "MacbookPro", dolValue: 100.00, date: Date(), realValue: 500.00),
//            ShopListModel(name: "NoteBook", dolValue: 200.00, date: Date(), realValue: 1000.0),
//            ShopListModel(name: "Nike Shoe", dolValue: 300.00, date: Date(), realValue: 1500.00),
//            ShopListModel(name: "Bag", dolValue: 400.00, date: Date(), realValue: 1800.00)
//        ]
        
        return list
    }
}
