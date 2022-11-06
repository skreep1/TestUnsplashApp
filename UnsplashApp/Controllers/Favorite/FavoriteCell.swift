//
//  FavoriteCell.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 01.11.2022.
//

import UIKit
import Kingfisher

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var favoritePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteProfilePhoto: UIImageView!
    
    func setupFavoriteCell(favorite: Favorite) {
        self.nameLabel.text = favorite.name
        let url = URL(string: favorite.image)
        favoritePhoto.kf.setImage(with: url)
        let urlProfile = URL(string: favorite.imageProfile)
        favoriteProfilePhoto.kf.setImage(with: urlProfile)
        favoriteProfilePhoto.layer.cornerRadius = favoriteProfilePhoto.frame.height / 2
    }
}

