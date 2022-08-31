//
//  TotalShopListViewController.swift
//  ComprasUSA
//
//  Created by User on 30/08/22.
//

import UIKit

class TotalShopListViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    var viewModel = TotalShopListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setup() {
        let values = viewModel.getValue()
        lbDolar.text = String(values.dolar)
        lbReal.text = String(values.real)
    }
}
