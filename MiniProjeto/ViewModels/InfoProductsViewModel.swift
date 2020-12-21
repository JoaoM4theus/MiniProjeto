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
            self.delegate?.setupConstraints()
        }
    }
    
//    func configElementos(){
//
//    }
//
    func configPrice() -> String{
        return product?.valorVenda ?? "R$ 0,00"
    }
    
    
    
}

