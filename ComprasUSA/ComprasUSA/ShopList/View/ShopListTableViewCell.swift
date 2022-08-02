//
//  ShopListTableViewCell.swift
//  ComprasUSA
//
//  Created by User on 02/08/22.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbProductName: UILabel!
    @IBOutlet weak var lbDolarValue: UILabel!
    @IBOutlet weak var lbRealValue: UILabel!
    @IBOutlet weak var lbPayment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
