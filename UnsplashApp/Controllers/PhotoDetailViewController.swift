//
//  PhotoDetailViewController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 31.10.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var photo: Photo?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let detailImage = URL(string: (photo?.urls.full)!)
            imageDetail.kf.setImage(with: detailImage)
            imageDetail.layer.cornerRadius = 10
            let profile = URL(string: (photo?.user.profile_image.large)!)
            profileImage.kf.setImage(with: profile)
            profileImage.layer.cornerRadius = profileImage.frame.height / 2
            
            self.nameLabel.text = photo?.user.name
            self.likesLabel.text = String("\(photo?.likes.formatted()) likes")
            self.dateLabel.text = photo?.created_at
        }
    
    }

