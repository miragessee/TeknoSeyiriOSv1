//
//  PopUpTableViewCell.swift
//  TeknoSeyir
//
//  Created by Admin on 26/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class PopUpTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
