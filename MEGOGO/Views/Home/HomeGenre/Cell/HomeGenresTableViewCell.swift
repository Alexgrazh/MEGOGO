//
//  HomeGenresTableViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 24.01.2023.
//

import UIKit

class HomeGenresTableViewCell: UITableViewCell {

    //MARK: - IBOutlet

    @IBOutlet weak var genreText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
