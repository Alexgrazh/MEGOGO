//
//  OnbordingCollectionViewCell.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 06.02.2023.
//

import UIKit

class OnbordingCollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "OnbordingCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contantLabelTitle: UIView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var dicriptionLabel: UILabel!
    
    override  func awakeFromNib() {
        super .awakeFromNib()
        configureLayer()
    }
    
    func setup(with slades: OnbordingSlide){
        titleLabel.text = slades.title
        posterImage.image = slades.image
        dicriptionLabel.text = slades.discription
    }
    
    func configureLayer(){
        posterImage.layer.cornerRadius = 15
        contantLabelTitle.layer.cornerRadius = 10
    }
}
