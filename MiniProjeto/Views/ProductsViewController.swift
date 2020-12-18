//
//  ProductsViewController.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import UIKit

class ProductsViewController: UIViewController {
    
    let cellId = "cellId"
    let tableViewCellName = "ProductTableViewCell"
    
    lazy var viewModel: ProductsViewModel = {
        
        let obj = ProductsViewModel()
        obj.delegate = self
        return obj
        
    }()
    
    //    var products = [Product](){
    //        didSet{
    //            DispatchQueue.main.async {
    //                self.tableView.reloadData()
    //            }
    //        }
    //    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: cellId)
        viewModel.getProducts()
        setupConstraints()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    lazy var tableView: UITableView = {
        
        let obj = UITableView()
        obj.delegate = self
        obj.dataSource = self
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
        
    }()
    
    func setupConstraints(){
        
        self.view.addSubview(tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.configCell(tableView: tableView, indexPath: indexPath)
    }
}

extension ProductsViewController: ProductViewModelDelegate{
    func finishFetchProduct() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func setupCellDelegate(cell: UITableViewCell) {
        if let cell = cell as? ProductTableViewCell{
            cell.delegate = self
        }
    }
}

extension ProductsViewController: ProductTableViewCellDelegate {
    func buttonPressed(product: Product) {
        let vc = InfoProductsViewController()
        let ab = InfoProductsViewModel()
        ab.products = product
//        vc.product = product
        present(vc, animated: true, completion: nil)
        
    }
}
