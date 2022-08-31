//
//  ShopListViewModel.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import Foundation
import CoreData
import UIKit

protocol ShopListViewModelProtocol: AnyObject {
    func getProductsList() -> [ShopListModel]
    func cleanProducts(completion: @escaping () -> Void)
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
        
        // MARK: Fetch no Core Data
        let products = DataProvider.fetchProdutcs()
        
        for product in products {
            let product =  ShopListModel(name: product.name ?? "produto",
                                         dolValue: product.value,
                                         date: Date(),
                                         realValue: product.realValue,
                                         isCardPayment: product.isCardPayment,
                                         place: product.place?.name ?? "nao encontrado")
            list.append(product)
        }
        
        return list
    }
    
    func cleanProducts(completion: @escaping () -> Void) {
        DataProvider.deleteProduct()
    }
}
