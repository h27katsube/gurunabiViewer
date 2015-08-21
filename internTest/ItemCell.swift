//
//  itemSell.swift
//  internTest
//
//  Created by intern on 2015/08/18.
//  Copyright (c) 2015年 intern. All rights reserved.
//

import UIKit

import SDWebImage

class ItemCell: UITableViewCell {

    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var opentimeLabel: UILabel!
    
    var item: ItemJSON? {
        didSet {
            nameLabel.text = item?.title
            addressLabel.text = item?.content
            opentimeLabel.text = item?.opentime
            if let imageURL = item?.largeImage {
                storeImageView.sd_setImageWithURL(imageURL)
            } else {
                storeImageView.image = nil
            }
        }
    }
}

extension Int {
    var decimalFormat: String? {
        get {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.groupingSeparator = ","
            formatter.groupingSize = 3
            
            return formatter.stringFromNumber(NSNumber(integer: self))
        }
    }
}