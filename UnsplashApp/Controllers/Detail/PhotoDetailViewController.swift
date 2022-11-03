//
//  PhotoDetailViewController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 31.10.2022.
//

import UIKit
import RealmSwift
import Kingfisher

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteAddImage: UIImageView!
    @IBAction func shareButtonAction(_ sender: Any) {
        shareImage()
        
    }
  
    @IBAction func favoriteButtonSave(_ sender: Any) {
        save()
        showSaveAlert()
    }
    
    private let realm = try! Realm()
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageLoad()
        photoLoad()
        infoTextView()
        
        
    }
    
    private func profileImageLoad() {
        let profile = URL(string: (photo?.user.profile_image.large)!)
        profileImage.kf.setImage(with: profile)
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
    private func photoLoad() {
        let detailImage = URL(string: (photo?.urls.full)!)
        imageDetail.kf.setImage(with: detailImage)
        imageDetail.layer.cornerRadius = 10
    }
    private func infoTextView() {
        self.nameLabel.text = photo?.user.name
        guard let likes = photo?.likes.formatted() else { return }
        likesLabel.text = "\(likes) likes"
        self.dateLabel.text = photo?.created_at
    }
    private func shareImage() {
        let image: [AnyObject] = [self.imageDetail.image!]
        let share = UIActivityViewController(activityItems: image as [AnyObject], applicationActivities: nil)
        self.present(share, animated: true, completion: nil)
    }
    
    private func save() {
        let favorite = Favorite()
        favorite.name = nameLabel.text!
        try! realm.write {
            realm.add([favorite])
            print("write \(favorite)")
 
        }
    }
    private func showSaveAlert() {
        let alertController = UIAlertController(title: "Congratulations!", message:
                                                    "You have successfully added a photo to Favorite", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))

           self.present(alertController, animated: true, completion: nil)
    }
    
    
}

