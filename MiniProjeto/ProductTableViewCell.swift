import UIKit

protocol ProductTableViewCellDelegate: class {
    func buttonPressed(product: Product)
}


class ProductTableViewCell : UITableViewCell {
    
    static let CELL_IDENTIFIER = "cellId"
    static let CELL_NAME = "ProductTableViewCell"
    
    weak var delegate: ProductTableViewCellDelegate?{
        didSet {
//            print("ProductTableViewCellDelegate inicializado...")
        }
    }
    
    
    var product: Product? {
        didSet{
            if product?.productImg != nil {
                self.reloadInputViews()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .red
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.text = "PRODUTO"
        return lbl
    }()
    
    
    lazy var productDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.text = "DESCRICAO"
        return lbl
    }()
    
    lazy var productPrice : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "00,0"
        label.textColor = .black
        return label
        
    }()
    
    
    lazy var productImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "img_logo_reduzida"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        if let product = self.product{
            self.delegate?.buttonPressed(product: product)

        }
        print("ProductTableViewCell")
        
    }
    
    
    func setupConstraints() {
        addSubview(cellView)
        
        cellView.addSubview(productImage)
        cellView.addSubview(productNameLabel)
        cellView.addSubview(productDescriptionLabel)
        cellView.addSubview(productPrice)
        cellView.addSubview(button)
         
        cellView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: -12, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: productNameLabel.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -16, width: self.frame.width * 0.3, height: 200, enableInsets: false)
        
        
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: productDescriptionLabel.topAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: -16, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: productPrice.topAnchor, right: button.leftAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: -16, paddingRight: 16, width: 0, height: 100, enableInsets: false)
        productDescriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        productPrice.anchor(top: productDescriptionLabel.bottomAnchor, left: productDescriptionLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -16, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        button.anchor(top: nil, left: productDescriptionLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -16, width: 60, height: 40, enableInsets: false)
        
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        
        
        
    }
    
    
}
