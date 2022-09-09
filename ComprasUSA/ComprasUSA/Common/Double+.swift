//
//  Double+.swift
//  ComprasUSA
//
//  Created by User on 30/08/22.
//

import Foundation

extension Double {
  func getRealCurrencyValue() -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.locale = Locale(identifier: "pt-BR")
    
    currencyFormatter.minimumFractionDigits = 2
    currencyFormatter.maximumFractionDigits = 2
    currencyFormatter.numberStyle = .currency
    return currencyFormatter.string(for: self) ?? "undefined"
  }

//  func setRealCurrencyValue() {
//    let currencyFormatter = NumberFormatter()
//    currencyFormatter.locale = Locale(identifier: "pt-BR")
//    
//    currencyFormatter.minimumFractionDigits = 2
//    currencyFormatter.maximumFractionDigits = 2
//    currencyFormatter.numberStyle = .decimal
//    return currencyFormatter.string(for: self)
//  }
}
