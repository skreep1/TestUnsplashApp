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
        photoInfoView()
    }
    // MARK: func load profile image in DetailView.
    private func profileImageLoad() {
        let profile = URL(string: (photo?.user.profile_image.large)!)
        profileImage.kf.setImage(with: profile)
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
    // MARK: func load image in DetailView
    private func photoLoad() {
        let detailImage = URL(string: (photo?.urls.full)!)
        imageDetail.kf.setImage(with: detailImage)
        imageDetail.layer.cornerRadius = 10
    }
    // MARK: Information photo in Detail
    private func photoInfoView() {
        self.nameLabel.text = photo?.user.name
        guard let likes = photo?.likes.formatted() else { return }
        likesLabel.text = "\(likes) likes"
        guard let datePublish = photo?.created_at else {return}
        dateLabel.text = "Published on \(date.getFormattedDate(format: datePublish))"
        
    }
    // MARK: func share image
    private func shareImage() {
        let image: [AnyObject] = [self.imageDetail.image!]
        let share = UIActivityViewController(activityItems: image as [AnyObject], applicationActivities: nil)
        self.present(share, animated: true, completion: nil)
    }

    
    // MARK: func save to Realm data
    private func save() {
        let favorite = Favorite()
        favorite.name = nameLabel.text!
        guard let img = photo?.urls.full else {return}
        favorite.image = "\(img)"
        guard let profileImage = photo?.user.profile_image.large else {return}
        favorite.imageProfile = "\(profileImage)"
        favorite.id = "\(favorite.id)"
        try! realm.write {
            realm.add([favorite])
            print("write \(favorite)")
        }
    }
    // MARK: func alert before save
    private func showSaveAlert() {
        let alertController = UIAlertController(title: "Congratulations!", message:
                                                    "You have successfully added a photo to Favorite", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
private let date = Date()
private let formatDate = date.getFormattedDate(format: "MMM d, yyyy")

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        dateformat.dateStyle = .long
        dateformat.locale = Locale(identifier: "en_us")
        return dateformat.string(from: self)
    }
}

