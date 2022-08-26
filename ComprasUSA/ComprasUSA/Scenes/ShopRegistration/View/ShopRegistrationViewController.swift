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
        
    }
    
    @IBAction func register(_ sender: Any) {
        let product = setProduct()
        print(product)
//        viewModel?.saveProduct(item: product)
    }
    
    // MARK: Properties
    
    var viewModel: ShopRegistrationViewModelProtocol? = ShopRegistrationViewModel()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Cadastrar Produto"
        setup()
    }
    
    func set(viewModel: ShopRegistrationViewModel) {
        self.viewModel = viewModel
    }

    func setProduct() -> Product {
        let product = Product()
        product.name = tfName.text
        product.value = Double(tfValue.text ?? "0") ?? 0.0
//        product.place =
//        product.isCard = switchIsCard.isOn
        
        return product
    }
    
    func stateCompletion(data: Any?) {
        
    }
}

extension ShopRegistrationViewController {
    func setup() {
        tfState.addTarget(self, action: #selector(selectState), for: .touchUpInside)
        
        // fake states
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        let state1 = State(context: managerContext)
        
        state1.name = "America"
        state1.tax = 1.9
        
        let state2 = State(context: managerContext)
        
        state2.name = "Sao paulo"
        state2.tax = 2.5
        
        let state3 = State(context: managerContext)
        
        state3.name = "Bahia"
        state3.tax = 5.0
        
        do {
            try managerContext.save()
            print(">>>>> sucesso ao salvar")
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }

    @objc func selectState() {
        let alert = UIAlertController(title: "Estados", message: "", preferredStyle: .actionSheet)
        
        guard let states = viewModel?.fetchStates() else { return }
    
        if states.isEmpty {
            for state in states {
                let action = UIAlertAction(
                    title: state.name,
                    style: .default)
                { _ in
                    print(">>>> \(state.name)")
                    self.tfState.text = state.name
                    alert.dismiss(animated: true)
                    }
                alert.addAction(action)
            }
        }
        
        self.present(alert, animated: true)
    }
}
