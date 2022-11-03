//
//  FavoriteCell.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 01.11.2022.
//

import UIKit
import Kingfisher

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    func setupFavoriteCell(photo: Photo) {
        self.nameLabel.text = photo.user.name
        let url = URL(string: photo.urls.full)
        image.kf.setImage(with: url)
    }
}
