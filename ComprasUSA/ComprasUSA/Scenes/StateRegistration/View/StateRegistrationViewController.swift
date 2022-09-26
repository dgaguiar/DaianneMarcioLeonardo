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
        alertAddState()
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            if let dolarTextField = alert?.textFields![0].text as? String, !dolarTextField.isEmpty, let dolarValue = Double(dolarTextField) {
                self.lbDolar.text = "\(dolarValue.getDolarCurrencyValue())"
                UserDefaults.standard.set("U$ \(dolarTextField)", forKey: "dolar")
                print("Text field: \(dolarTextField)")
            }
            
            if let iofTextField = alert?.textFields![1].text as? String, !iofTextField.isEmpty , let iofValue = Double(iofTextField) {
                self.lbIOF.text = "\(iofValue.formatTwoZeros()) %"
                UserDefaults.standard.set("\(iofTextField)%", forKey: "IOF")
                print("Text field: \(iofTextField)")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func alertAddState() {
        let alert = UIAlertController(title: "Adicionar Estado", message: "Digite o nome e valor do imposto do estado", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .default
            textField.placeholder = "Nome do estado"
        }
        
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
            textField.placeholder = "Valor imposto ex. 2.35"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            var name = String()
            var tax = Double()
            if let nameTextField = alert?.textFields![0].text as? String, !nameTextField.isEmpty,
                let taxTextField = alert?.textFields![1].text as? String, !taxTextField.isEmpty {
                name = nameTextField
                tax = Double(taxTextField) ?? 0.0
                self.viewModel.postState(name: name, tax: tax) { result in
                    if result {
                        self.alert("Estado salvo com sucesso")
                        self.states = self.viewModel.fetchStates()
                        self.tableView.reloadData()
                    }else{
                        self.alert("Não Foi possível no momento, tente mais tarde.")
                    }
                }
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
                 iofValue: "\(states[indexPath.row].tax.formatTwoZeros())")
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
