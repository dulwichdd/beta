//
//  myCell.swift
//  beta
//
//  Created by CHRIS WARNER on 02/12/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    @IBOutlet var thumb: UIImageView!
    @IBOutlet var lblcrop: UILabel!

    @IBOutlet var lblspacing: UILabel!
    @IBOutlet var lblnoofrows: UILabel!

    @IBOutlet var lblsoiltype: UILabel!
    @IBOutlet var lbldate: UILabel!
    @IBOutlet var lblharvest: UILabel!
    @IBOutlet var lbldepth: UILabel!
    @IBOutlet var lblvariety: UILabel!
    @IBOutlet var lblref: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
