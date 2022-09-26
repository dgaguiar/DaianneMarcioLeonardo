//
//  ShopListTableViewCell.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {
    
    let lbProductName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    let lbStateName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .light)
        lb.textColor = .gray
        return lb
    }()
    
    let lbDolarValue: UILabel = {
        let lb = UILabel()
        lb.textColor = .systemTeal
        return lb
    }()
    
    let lbRealValue: UILabel = {
        let lb = UILabel()
        lb.textColor = .orange
        return lb
    }()
    
    let lbPaymentType: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return lb
    }()
    
    let imgProduct: UIImageView = {
        let img = UIImageView(image: UIImage(named: "playstore"))
        img.contentMode = .scaleAspectFit
        img.widthAnchor.constraint(equalToConstant: 60).isActive = true
        img.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return img
    }()
    
    let viewVFour: UIView = {
       let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return view
    }()

    let viewHFour: UIView = {
       let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        lbDolarValue.translatesAutoresizingMaskIntoConstraints = false
        lbProductName.translatesAutoresizingMaskIntoConstraints = false
        lbRealValue.translatesAutoresizingMaskIntoConstraints = false
        lbPaymentType.translatesAutoresizingMaskIntoConstraints = false
        
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.spacing = 0
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        let imageStack = UIStackView()
        imageStack.axis = .vertical
        imageStack.addArrangedSubview(viewVFour)
        imageStack.addArrangedSubview(imgProduct)
        imageStack.addArrangedSubview(viewVFour)
        
        mainStack.addArrangedSubview(imageStack)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 2

        let stackHTitle = UIStackView()
        stackHTitle.translatesAutoresizingMaskIntoConstraints = false
        stackHTitle.axis = .horizontal

        stackHTitle.addArrangedSubview(lbProductName)
        stackHTitle.addArrangedSubview(UIView())
        
        let stackHDolarValue = UIStackView()
        stackHDolarValue.translatesAutoresizingMaskIntoConstraints = false
        stackHDolarValue.axis = .horizontal
        stackHDolarValue.addArrangedSubview(lbDolarValue)
        stackHDolarValue.addArrangedSubview(UIView())
        
        let stackHRealValue = UIStackView()
        stackHRealValue.translatesAutoresizingMaskIntoConstraints = false
        stackHRealValue.axis = .horizontal
        
        stackHRealValue.addArrangedSubview(lbRealValue)
        stackHRealValue.addArrangedSubview(UIView())
        
        let stackHThree = UIStackView()
        stackHThree.translatesAutoresizingMaskIntoConstraints = false
        stackHThree.axis = .horizontal
        
        stackHThree.addArrangedSubview(lbStateName)
        stackHThree.addArrangedSubview(UIView())
        
        vStack.addArrangedSubview(stackHTitle)
        vStack.addArrangedSubview(stackHDolarValue)
        vStack.addArrangedSubview(stackHRealValue)
        vStack.addArrangedSubview(lbPaymentType)
        vStack.addArrangedSubview(stackHThree)

        mainStack.addArrangedSubview(viewHFour)
        mainStack.addArrangedSubview(vStack)
        contentView.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        self.layoutIfNeeded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(title: String, subtile: String, dolarValue: String, realValue: String, state: String, image: String) {
        lbProductName.text = title
        lbPaymentType.text = "compra feita com \(subtile)"
        lbDolarValue.text = "valor gasto em dólar \(dolarValue)"
        lbRealValue.text = "valor gasto em real \(realValue)"
        lbStateName.text = state
        imgProduct.image = image.convertBase64StringToImage()
    }
}
