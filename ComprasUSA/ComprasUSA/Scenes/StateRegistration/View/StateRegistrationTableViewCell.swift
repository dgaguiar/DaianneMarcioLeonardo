//
//  StateRegistrationTableViewCell.swift
//  ComprasUSA
//
//  Created by User on 30/08/22.
//

import UIKit

class StateRegistrationTableViewCell: UITableViewCell {
    
    let lbStateName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 17)
        return lb
    }()
    
    let lbIOF: UILabel = {
        let lb = UILabel()
        lb.tintColor = .gray
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        lbIOF.translatesAutoresizingMaskIntoConstraints = false
        lbStateName.translatesAutoresizingMaskIntoConstraints = false
        
        let stackHOne = UIStackView()
        stackHOne.translatesAutoresizingMaskIntoConstraints = false
        stackHOne.axis = .horizontal
        
        stackHOne.addArrangedSubview(lbStateName)
        stackHOne.addArrangedSubview(lbIOF)
        
        contentView.addSubview(stackHOne)
        
        NSLayoutConstraint.activate([
            stackHOne.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackHOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            stackHOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            stackHOne.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        
        self.layoutIfNeeded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(state: String, iofValue: String) {
        lbStateName.text = state
        lbIOF.text = "\(iofValue) %"
    }
}

