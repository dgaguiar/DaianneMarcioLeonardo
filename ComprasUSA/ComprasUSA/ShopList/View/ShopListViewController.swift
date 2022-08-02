//
//  ShopListViewController.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import UIKit

protocol ShopListViewControllerProtocol: AnyObject {
    
}

class ShopListViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var viewModel: ShopListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    private func setup() {
        tableview.register(ShopTableViewCell.self, forCellReuseIdentifier: "ShopTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getProductsList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "ShopTableViewCell") as? ShopTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ShopListViewController: ShopListViewControllerProtocol {
    
}
