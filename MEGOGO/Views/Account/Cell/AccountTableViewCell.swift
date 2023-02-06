//
//  AccountTableViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 05.02.2023.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
     @IBOutlet weak var lableText: UILabel!
    
   let id = "AccountTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
