//
//  ShopListModel.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import Foundation

struct ShopListModel {
    var name: String
    var dolValue: Double
    var realValue: Double
    var date: Date
    
    init(name: String, dolValue: Double, date: Date, realValue: Double) {
        self.name = name
        self.dolValue = dolValue
        self.realValue = realValue
        self.date = date
    }
}
