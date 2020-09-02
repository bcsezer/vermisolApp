//
//  belgelerTableViewCell.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 2.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class belgelerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var belgeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
