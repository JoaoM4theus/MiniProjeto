//
//  InfoProductsViewModel.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 18/12/20.
//

import Foundation
import UIKit

protocol InfoProductsViewModelDelegate {
    func finishFetchProduct()
    func setupCellDelegate(cell: UIView)
}

class InfoProductsViewModel{
    weak var delegate: InfoProductsViewModelDelegate?
    
    
    var products: Product?
//        didSet {
//            self.delegate?.finishFetchProduct()
//            products?.productImg
//            products?.descricao
//            products?.valorVenda
//        }
    
    
    
    func getProducts(){
        
    }
    
    
    
}

