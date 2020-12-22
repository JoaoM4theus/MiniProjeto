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
    
    
    func configPrice() -> String {
        return product?.valorVenda ?? "R$ 0,00"
    }
    
    func configName() -> String {
        return product?.descricao ?? "Nome invalido"
    }
    
    func configImage(completion: @escaping(_ image: UIImage) -> ()){

        if let productImageURL = product?.galeriaProduto{
            productImageURL.loadImageUsingCache(urlString: productImageURL) { (image) in
                completion(image)
            }
        }

    }
}

