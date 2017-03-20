//
//  TableFoodCellTableViewCell.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-15.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//

import UIKit

class TableFoodCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfFood: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
