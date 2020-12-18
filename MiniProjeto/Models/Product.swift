//
//  Products.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import Foundation
import UIKit

class Product {
    //    var productImage: UIImage
    
    //    var productDesc: String
    
    var valorVenda: String?
    var valorMinimo: String?
    var id: Int?
    var codigo: String?
    var valorTotalBruto: String?
    var promocional: String?
    var grupoId: Int?
    var multiploVenda: String?
    var percentualProteina: String?
    var subGrupoId: String?
    var unidade: String?
    var tipoIdade: String?
    var galeriaProduto: String?
    var tipoAlimento: String?
    var valorMaximo: String?
    var tipoProduto: String?
    var descricao: String?
    var estoque: String?
    var tipoPorte: String?
    var informacoesTecnicas: String?
    var codigoGrande: String?
    var valorTabelaPreco: String?
    var productImg: UIImage?
    
    init(args: Dictionary<String, Any>? ){
        self.valorVenda = args?["valor_venda"] as? String
        self.valorMinimo = args?["valor_minimo"] as? String
        self.id = args?["id"] as? Int
        self.codigo = args?["codigo"] as? String
        self.valorTotalBruto = args?["valor_total_bruto"] as? String
        self.promocional = args?["promocional"] as? String
        self.grupoId = args?["grupo_id"] as? Int
        self.multiploVenda = args?["multiplo_venda"] as? String
        self.percentualProteina = args?["percentual_proteina"] as? String
        self.subGrupoId = args?["subgrupo_id"] as? String
        self.unidade = args?["unidade"] as? String
        self.tipoIdade = args?["tipo_idade"] as? String
        self.galeriaProduto = args?["galeria_produto"] as? String 
        self.valorMaximo = args?["valor_maximo"] as? String
        self.descricao = args?["descricao"] as? String
        self.estoque = args?["estoque"] as? String
        self.informacoesTecnicas = args?["informacoes_tecnicas"] as? String
        self.codigoGrande = args?["codigo_grande"] as? String
        self.valorTabelaPreco = args?["valor_tabela_preco"] as? String
        
        //        loadProductImage()
        
    }
    //    func loadProductImage(){
    //        if let productImageString = self.galeriaProduto,
    //           let productImageURL = URL(string: productImageString){
    //
    //            ConnectionSessionManager.downloadImage(from: productImageURL) { (image, error) in
    //                if error == nil && image != nil {
    //                    self.productImg = image
    //                } else {
    //                    self.productImg = #imageLiteral(resourceName: "img_logo_reduzida")
    //                }
    //            }
    //        }
    //    }
    
    


}
