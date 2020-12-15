//
//  ProductsViewModel.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import Foundation

protocol ProductViewModelDelegate: class {
    func finishFetchProduct(products: [Product])
}

class ProductsViewModel {
    
    weak var delegate: ProductViewModelDelegate?

    
    func getProducts(offset: Int = 0){
        let url = "https://softbuilder.com.br/dev-supervisor/api/appplus/request"
        let args = ["empresa": 1800, "tag": "produto", "offset": offset] as [String : Any]
        
        ConnectionSessionManager.invoke(url: url, withArgs: args, httpMethod: .post) { [weak self] (data, error) in
            guard let erro = error else {
                if let json = data as? Dictionary<String, Any>, let response = json["response"] as? Dictionary<String, Any>,
                   let products = response["produto"] as? [[String:Any]]{
                    //print(products)
//                    self?.products?.append(contentsOf: products.map{Product(args: $0)})
                    
                    self?.delegate?.finishFetchProduct(products: products.map{Product(args: $0)})
//                    print(self?.products?!)
                }
                return
                
                
            }
        }
    }
}

//po let _data = data as? [String : Any];
