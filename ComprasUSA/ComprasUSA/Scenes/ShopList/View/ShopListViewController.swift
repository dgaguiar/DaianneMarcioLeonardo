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
    
    var products: [NSManagedObject] = []
    
    var viewModel: ShopListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem?.target = #selector(goToreg)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        // MARK: Fetch no Core Data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managerContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")
        
        do {
            products = try managerContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
    
    func relationship() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        // Created State
        let state = State(context: managerContext)
        state.name = "Sao Paulo"
        
        // Create Products
        let product = Product(context: managerContext)
        product.name = "Mac book"
//        product.place = state
        
        state.addToShop(product)
        
        // save context
        
        do {
            try managerContext.save()
        } catch let error as NSError {
            print("Erro retornar os produtos : \(error)")
        }
    }
    
    // MARK: Salvar no Core Data
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Product", in: managerContext)!
        
        let product = NSManagedObject(entity: entity, insertInto: managerContext)
        product.setValue(name, forKey: "name")
            
        do {
            try managerContext.save()
            products.append(product)
        } catch let error as NSError {
            print("Erro ao salvar o novo produto : \(error)")
        }
    }
    
    private func setup() {
        tableview.register(ShopListTableViewCell.self, forCellReuseIdentifier: "ShopTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getProductsList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "ShopTableViewCell") as? ShopListTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ShopListViewController: ShopListViewControllerProtocol {
    func reloadList() {
        tableview.reloadData()
    }
}
