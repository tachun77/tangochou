//
//  ListTableViewCell.swift
//  tangochou2
//
//  Created by 福島達也 on 2016/06/09.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var englishLabel : UILabel!
    @IBOutlet var japaneseLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
