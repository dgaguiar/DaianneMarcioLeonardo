//
//  TotalShopListViewModel.swift
//  ComprasUSA
//
//  Created by User on 30/08/22.
//

import Foundation

class TotalShopListViewModel {
    
    func getValue() -> (dolar: Double, real: Double) {
        var dolar: Double = 0.0
        var real: Double = 0.0
        
        let products = DataProvider.fetchProdutcs()
        
        for product in products {
            dolar = dolar + product.value
            real = real + product.realValue
        }
        
        return (dolar , real)
    }
    
}
