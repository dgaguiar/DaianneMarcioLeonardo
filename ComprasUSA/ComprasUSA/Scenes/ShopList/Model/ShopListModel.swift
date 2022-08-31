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
    var isCardPayment: Bool
    var place: String
    
    init(name: String, dolValue: Double, date: Date, realValue: Double, isCardPayment: Bool, place: String) {
        self.name = name
        self.dolValue = dolValue
        self.realValue = realValue
        self.date = date
        self.isCardPayment = isCardPayment
        self.place = place
    }
}
