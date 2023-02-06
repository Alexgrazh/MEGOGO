//
//  MovieCollectionViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 24.01.2023.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var contantView: UIView!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        contantView.layer.cornerRadius = 20
    }
    public func setup(with data: Results){
   
        movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data.poster_path ?? "")"))
       }
}
