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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        lbDolarValue.translatesAutoresizingMaskIntoConstraints = false
        lbProductName.translatesAutoresizingMaskIntoConstraints = false
        lbRealValue.translatesAutoresizingMaskIntoConstraints = false
        lbPaymentType.translatesAutoresizingMaskIntoConstraints = false
        
        let stackHOne = UIStackView()
        stackHOne.translatesAutoresizingMaskIntoConstraints = false
        stackHOne.axis = .horizontal
        
        stackHOne.addArrangedSubview(lbProductName)
        stackHOne.addArrangedSubview(lbDolarValue)
        
        let stackHTwo = UIStackView()
        stackHTwo.translatesAutoresizingMaskIntoConstraints = false
        stackHTwo.axis = .horizontal
        
        stackHTwo.addArrangedSubview(lbPaymentType)
        stackHTwo.addArrangedSubview(lbRealValue)
        
        let stackHThree = UIStackView()
        stackHThree.translatesAutoresizingMaskIntoConstraints = false
        stackHThree.axis = .horizontal
        
        stackHThree.addArrangedSubview(lbStateName)
        stackHThree.addArrangedSubview(UIView())
        
        contentView.addSubview(stackHOne)
        contentView.addSubview(stackHThree)
        contentView.addSubview(stackHTwo)
        
        NSLayoutConstraint.activate([
            stackHOne.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackHOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackHOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackHThree.topAnchor.constraint(equalTo: stackHOne.bottomAnchor, constant: 4),
            stackHThree.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackHThree.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackHTwo.topAnchor.constraint(equalTo: stackHThree.bottomAnchor, constant: 8),
            stackHTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackHTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackHTwo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        
        self.layoutIfNeeded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(title: String, subtile: String, dolarValue: String, realValue: String, state: String) {
        lbProductName.text = title
        lbPaymentType.text = subtile
        lbDolarValue.text = "U$ \(dolarValue)"
        lbRealValue.text = "R$ \(realValue)"
        lbStateName.text = state
    }
}
