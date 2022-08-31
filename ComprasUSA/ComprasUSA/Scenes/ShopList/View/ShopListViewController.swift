//
//  ShopListViewController.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import UIKit
import CoreData

protocol ShopListViewControllerProtocol: AnyObject {
    func reloadList()
}

class ShopListViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func cleanList(_ sender: Any) {
        self.viewModel.cleanProducts {
            self.tableview.reloadData()
        }
    }
    
    var products: [ShopListModel] = []
    var viewModel: ShopListViewModelProtocol = ShopListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getdata()
    }
    
    private func getdata() {
        self.products = self.viewModel.getProductsList()
        tableview.reloadData()
    }
    
    private func setup() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShopListTableViewCell(style: .default, reuseIdentifier: nil)
        let isCard = products[indexPath.row].isCardPayment ? "Cartao" : "Dinheiro"
        cell.set(title: products[indexPath.row].name,
                 subtile: isCard,
                 dolarValue: String(products[indexPath.row].dolValue),
                 realValue: String(products[indexPath.row].realValue),
                 state: products[indexPath.row].place)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ShopListViewController: ShopListViewControllerProtocol {
    func reloadList() {
        tableview.reloadData()
    }
}
