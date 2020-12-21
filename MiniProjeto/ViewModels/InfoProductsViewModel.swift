//
//  InfoProductsViewModel.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 18/12/20.
//

import Foundation
import UIKit

protocol InfoProductViewModelDelegate {
    func setupCons()
}

class InfoProductsViewModel{
    
    var delegate: InfoProductViewModelDelegate?
    
    init(product: Product) {
        self.product = product
    }
    
    
    var product: Product? {
        didSet {
            self.delegate?.setupCons()
        }
    }
    
//    func configElementos(){
//
//    }
//
    func configPrice() -> String {
        return product?.valorVenda ?? "R$ 0,00"
    }
    
    func configName() -> String {
        return product?.descricao ?? "Nome invalido"
    }
    
    func configImage() -> UIImage{
       // return product?.galeriaProduto
        if let productImageURL = product?.galeriaProduto{
            return productImageURL.loadImageUsingCache(withUrl: productImageURL)
        }
        return #imageLiteral(resourceName: "ic_carrinho")
//        return product?.galeriaProduto?.loadImageUsingCache(withUrl: product?.galeriaProduto ?? ""
    }
}

