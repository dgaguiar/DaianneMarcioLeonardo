//
//  StateRegistrationViewModel.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation

protocol StateRegistrationViewModelProtocol: AnyObject {
  func fetchStates() -> [State]
  func postState(name: String, tax: Double, completion: @escaping (Bool) -> Void)
  func deleteState(_ state: State)
}

class StateRegistrationViewModel: StateRegistrationViewModelProtocol {
  func fetchStates() -> [State] {
    return DataProvider.fetchStates()
  }
  
  func postState(name: String, tax: Double, completion: @escaping (Bool) -> Void) {
    guard let managerContext = DataProvider.context() else { return }
    let state = State(context: managerContext)
    
    state.name = name
    state.tax = tax
    
    do {
      try managerContext.save()
      completion(true)
      print(">>>>> sucesso ao salvar")
    } catch let error as NSError {
      completion(false)
      print("Erro retornar os produtos : \(error)")
    }
  }
  
  func deleteState(_ state: State) {
    DataProvider.deleteState(state)
  }
}
