//
//  ShopRegistrationViewController.swift
//  ComprasUSA
//
//  Created by User on 26/08/22.
//

import UIKit

class ShopRegistrationViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var switchIsCard: UISwitch!
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbRealValue: UILabel!
    
    @IBOutlet weak var tfState: UITextField!
    
    // MARK: Actions
    
    @IBAction func selectImage(_ sender: Any) {
        // TODO: Chamada para biblioteca de fotos
    }
    
    @IBAction func register(_ sender: Any) {
        guard let product = setProduct() else { return }
        viewModel?.saveProduct(product: product, state: selectedState)
        self.dismiss(animated: true)
    }
    
    @IBAction func selectState(_ sender: Any) {
        selectState()
    }
    
    @objc func selectState() {
        guard let states = viewModel?.fetchStates() else {
            alert("Voce nao tem estados cadastrados")
            return }
    
        if !states.isEmpty {
            presentStateAlert(states)
        } else {  alert("Voce nao tem estados cadastrados") }

    }
    
    private func presentStateAlert(_ states: [State]) {
        let alert = UIAlertController(title: "Estados", message: "Escolha o estado", preferredStyle: .actionSheet)
        for state in states {
            let action = UIAlertAction(
                title: state.name,
                style: .default)
            { _ in
                self.selectedState = state
                self.tfState.text = state.name
                self.lbStateTax.text = "IOF:  \(state.tax) %"
                alert.dismiss(animated: true)
                }
            alert.addAction(action)
        }
        self.present(alert, animated: true)
        return
    }
    
    private func alert(_ message: String) {
        let alertEmptyState = UIAlertController(title: "Atenção!", message: message, preferredStyle: .alert)
        let acaoAvançar = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertEmptyState.addAction(acaoAvançar)
        self.present(alertEmptyState, animated: true, completion: nil)
    }
    
    // MARK: Properties
    
    var viewModel: ShopRegistrationViewModelProtocol? = ShopRegistrationViewModel()
    var selectedState: State = State()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Cadastrar Produto"
        setup()
    }
    
    // MARK: Setups
    func set(viewModel: ShopRegistrationViewModel) {
        self.viewModel = viewModel
    }

    func setProduct() -> RegisterProduct? {
        if let name = tfName.text,
            let value = tfValue.text {
            let product = RegisterProduct(
                name: name,
                value: Double(value) ?? 0.0,
                realValue: 0.0,
                isCard: switchIsCard.isOn,
                image: String(),
                state: selectedState)
            return product
        }
        
        var messagem = "Algo deu errado"
        if  tfName.text == nil {
            messagem = "preencha o nome do produto"
        } else if tfValue.text == nil {
            messagem = "preencha o valor do produto"
        }
        alert(messagem)
        
        return nil
    }
}

extension ShopRegistrationViewController {
    func setup() {
        // TODO: setup view, image
    } 
}
