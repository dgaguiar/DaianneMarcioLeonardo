//
//  StateRegistrationViewController.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import Foundation
import UIKit

class StateRegistrationViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var lbDolar: UILabel!
  @IBOutlet weak var tfStateName: UITextField!
  @IBOutlet weak var tfStateIof: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var lbIOF: UILabel!
  // MARK: Properties
  
  var viewModel: StateRegistrationViewModelProtocol = StateRegistrationViewModel()
  var states: [State] = []
  
  // MARK: Actions
  
  @IBAction func editDolarValue(_ sender: Any) {
    alertEditDolar()
  }
  
  @IBAction func addState(_ sender: Any) {
    let data = getStateData()
    guard let name = data.name, let iof = data.iof else {
      alert("o campo Nome ou iof esta vazio")
      return }
    viewModel.postState(name: name, tax: iof){ result in
      if result {
        self.tfStateName.text = ""
        self.tfStateIof.text = ""
      }else{
        self.alert("Não Foi possível no momento, tente mais tarde.")
      }
    }
    states = viewModel.fetchStates()
    tableView.reloadData()
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tfStateIof.text = String()
    tfStateName.text = String()
    lbIOF.text = UserDefaults.standard.string(forKey: "IOF") ?? "0.00 %"
    lbDolar.text = UserDefaults.standard.string(forKey: "dolar") ?? "U$ 0.00"
  }
  
  // MARK: Setup
  
  func setup() {
    tableView.delegate = self
    tableView.dataSource = self
    states = viewModel.fetchStates()
    tableView.reloadData()
  }
  
  func getStateData() -> (name: String?, iof: Double?) {
    if let name = tfStateName.text, let iof = tfStateIof.text {
      let iofDouble = Double(iof)
      return (name, iofDouble)
    }
    
    return (nil, nil)
  }
  
  private func alert(_ message: String) {
    let alertEmptyState = UIAlertController(title: "Atenção!", message: message, preferredStyle: .alert)
    let acaoAvançar = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertEmptyState.addAction(acaoAvançar)
    self.present(alertEmptyState, animated: true, completion: nil)
  }
  
  private func alertEditDolar() {
    let alert = UIAlertController(title: "Editar", message: "Digite o valor atual do dolar", preferredStyle: .alert)
    alert.addTextField { (textField) in
      
      textField.keyboardType = .decimalPad
      textField.placeholder = "dólar"
    }
    
    alert.addTextField { (textField) in
      
      textField.keyboardType = .decimalPad
      textField.placeholder = "IOF"
    }
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
      if let dolarTextField = alert?.textFields![0].text as? String, !dolarTextField.isEmpty {
        self.lbDolar.text = "U$ \(dolarTextField)"
        UserDefaults.standard.set("U$ \(dolarTextField)", forKey: "dolar")
        print("Text field: \(dolarTextField)")
      }
      
      if let iofTextField = alert?.textFields![1].text as? String, !iofTextField.isEmpty {
        self.lbIOF.text = "\(iofTextField) %"
        UserDefaults.standard.set("\(iofTextField)%", forKey: "IOF")
        print("Text field: \(iofTextField)")
      }
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

extension StateRegistrationViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return states.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = StateRegistrationTableViewCell()
    guard let name = states[indexPath.row].name else { return UITableViewCell() }
    cell.set(state: "\(name)",
             iofValue: "\(states[indexPath.row].tax)")
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      viewModel.deleteState(states[indexPath.row])
      states = viewModel.fetchStates()
      tableView.reloadData()
    }
  }
  
}
