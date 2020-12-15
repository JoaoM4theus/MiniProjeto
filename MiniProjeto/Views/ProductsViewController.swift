//
//  ProductsViewController.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import UIKit

class ProductsViewController: UIViewController {

    lazy var viewModel: ProductsViewModel = {
       let obj = ProductsViewModel()
        obj.delegate = self
        return obj
    }()
    
    var products = [Product](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.tableView.delegate = self
        self.tableView.dataSource = self
        viewModel.getProducts()
        
    }
    
    lazy var tableView: UITableView = {
        
        let obj = UITableView()
        obj.delegate = self
        obj.dataSource = self
        
        return obj
    }()
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ProductsViewController: ProductViewModelDelegate{
    func finishFetchProduct(products: [Product]) {
        self.products.append(contentsOf: products)
    }
}
