//
//  CurrencyViewCell.swift
//  Currency
//
//  Created by Denis on 10/04/2018.
//  Copyright © 2018 Denis. All rights reserved.
//

import UIKit

class CurrencyViewCell: UITableViewCell {

    @IBOutlet weak var currencyName: UILabel!
    
    @IBOutlet weak var currencyPrice: UILabel!
    
    @IBOutlet weak var currecnyAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
