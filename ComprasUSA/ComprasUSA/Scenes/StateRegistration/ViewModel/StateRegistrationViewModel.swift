//
//  StateRegistrationViewModel.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation

protocol StateRegistrationViewModelProtocol: AnyObject {
    func fetchStates() -> [State]
    func postState(name: String, tax: Double)
}

class StateRegistrationViewModel: StateRegistrationViewModelProtocol {
    func fetchStates() -> [State] {
        return DataRouter.fetchStates()
    }
    
    func postState(name: String, tax: Double) {
        guard let managerContext = DataRouter.context() else { return }
        let state = State(context: managerContext)

        state.name = name
        state.tax = tax
        
        do {
            try managerContext.save()
            print(">>>>> sucesso ao salvar")
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
}
