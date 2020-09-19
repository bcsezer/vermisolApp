//
//  profileTableViewCell.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 19.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileCellTitle: UILabel!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.95 // get 80% width here
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func changeWitdh(){
          layer.frame.size.width = UIScreen.main.bounds.width * 0.8
    }


}
