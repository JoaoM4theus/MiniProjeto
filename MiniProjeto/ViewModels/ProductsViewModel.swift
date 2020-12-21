//
//  ProductsViewModel.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import Foundation
import UIKit


protocol ProductViewModelDelegate: class {
    func finishFetchProduct()
    func setupCellDelegate(cell: UITableViewCell)
}

class ProductsViewModel {
    
    weak var delegate: ProductViewModelDelegate?
    
    var productImg: UIImage?
    var products: [Product]? = [] {
        didSet {
            self.delegate?.finishFetchProduct()
        }
    }
    
    
    func getProducts(offset: Int = 0){
        let url = "https://softbuilder.com.br/dev-supervisor/api/appplus/request"
        let args = ["empresa": 1800, "tag": "produto", "offset": offset] as [String : Any]
        
        ConnectionSessionManager.invoke(url: url, withArgs: args, httpMethod: .post) { [weak self] (data, error) in
            guard let erro = error else {
                if let json = data as? Dictionary<String, Any>, let response = json["response"] as? Dictionary<String, Any>,
                   let products = response["produto"] as? [[String:Any]]{
                    
                    self?.products = products.map{ Product(args: $0) }
//                    self?.delegate?.finishFetchProduct(products: products.map{Product(args: $0)})
                    
                }
                return
            }
            
        }
        
        
    }
    
        func downloadImage(imageURL: String, completion: @escaping(_ image: UIImage) -> ()) {

            guard let productImageURL = URL(string: imageURL) else {
                return completion(#imageLiteral(resourceName: "img_bg_login"))
            }
            
            ConnectionSessionManager.downloadImage(from: productImageURL) { (image, error) in
                if let currentImage = image {
                    completion( currentImage )
                } else {
                    completion(#imageLiteral(resourceName: "img_logo_reduzida"))
                }
            }
        }
    
    func configCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.CELL_IDENTIFIER, for: indexPath) as? ProductTableViewCell{
            
            self.delegate?.setupCellDelegate(cell: cell)
            
            cell.contentView.isUserInteractionEnabled = false;
            cell.productNameLabel.text = products?[indexPath.row].descricao
            cell.productDescriptionLabel.text = products?[indexPath.row].descricao
            cell.productPrice.text = products?[indexPath.row].valorVenda
            downloadImage(imageURL: products?[indexPath.row].galeriaProduto ?? ""){image in
                cell.productImage.image = image
            }
            cell.product = products?[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

