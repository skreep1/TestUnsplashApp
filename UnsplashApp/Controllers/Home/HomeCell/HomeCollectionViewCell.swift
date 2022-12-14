//
//  HomeCollectionViewCell.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 26.10.2022.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    // MARK: Cell for HomeViewController
    func setup(photo: Photo) {
        let url = URL(string: photo.urls.thumb)
        image.kf.setImage(with: url)
    }
}
