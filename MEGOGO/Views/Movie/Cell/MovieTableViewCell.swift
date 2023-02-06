//
//  MovieTableViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 26.01.2023.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

   
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageMove: UIImageView!
    @IBOutlet weak var nameMove: UILabel!
    @IBOutlet weak var overviewMove: UILabel!
    @IBOutlet weak var contantView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contantView.layer.cornerRadius = 20
    }

    
    public func setup(with data: Results){
        imageMove.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300\(data.poster_path ?? "")"))
        nameMove.text = data.title
        overviewMove.text = data.overview
       }

}
