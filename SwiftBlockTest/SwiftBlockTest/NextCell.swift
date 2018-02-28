//
//  NextCell.swift
//  SwiftBlockTest
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class NextCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func set(name: String, desc: String, price: String){
        nameLabel.text = name
        descLabel.text = desc
        priceLabel.text = price
    }

}
