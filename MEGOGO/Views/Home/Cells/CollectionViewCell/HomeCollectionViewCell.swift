//
//  HomeCollectionViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 21.01.2023.
//

import UIKit
import SDWebImage
class HomeCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    @IBOutlet weak var titleMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        imagePoster.layer.cornerRadius = 25

    }
    
    // MARK: - Public Methods
    
     public func setup(with data: Results){
    
         imagePoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data.backdrop_path ?? "")"))
        }
}
