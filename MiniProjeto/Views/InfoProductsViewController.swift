//
//  InfoProductsViewController.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 16/12/20.
//

import UIKit

class InfoProductsViewController: UIViewController {
    
    var product: Product?{
        didSet{
            productDescriptionLabel.text = product?.descricao
            productionNameLabel.text = product?.descricao
            productPrice.text = product?.valorVenda
            productImage.loadImageUsingCache(withUrl: product?.galeriaProduto ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    lazy var productionNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.numberOfLines = 3
        lbl.translatesAutoresizingMaskIntoConstraints = false
   
        return lbl
    }()
    
    lazy var productDescriptionLabel : UILabel = {

        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
        
    }()
    
    lazy var productPrice : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "00,0"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var productView:UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    lazy var productImage : UIImageView = {
        
        let imgView = UIImageView(image: #imageLiteral(resourceName: "img_bg_login"))
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
        
    }()
    

    
    func setupConstraints(){
        
        self.view.addSubview(productView)
        productView.addSubview(productImage)
        productView.addSubview(productDescriptionLabel)
        productView.addSubview(productPrice)
        
        
        self.productView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.productView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.productView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.productView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.productImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.productImage.bottomAnchor.constraint(equalTo: self.productDescriptionLabel.topAnchor).isActive = true
        self.productImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.productImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.productImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        self.productImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        self.productDescriptionLabel.topAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: 16).isActive = true
        self.productDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:16).isActive = true
        self.productDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        
        self.productPrice.topAnchor.constraint(equalTo: self.productDescriptionLabel.bottomAnchor).isActive = true
        self.productPrice.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.productPrice.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
}

