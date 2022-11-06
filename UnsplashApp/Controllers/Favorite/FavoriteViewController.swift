//
//  FavoriteViewController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 01.11.2022.
//

import UIKit
import RealmSwift
import Kingfisher

class FavoriteViewController: UIViewController {
    private var item: Results<Favorite>!
    private let realm = try! Realm()
    var favorite: Favorite?
    @IBAction func favoriteButton(_ sender: Any) {
        showDeleteAlert()
    }
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoriteCollectionView.dataSource = self
        self.favoriteCollectionView.delegate = self
        self.favoriteCollectionView.reloadData()
        self.item = self.realm.objects(Favorite.self)
        
    }
}
extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
        let items = item[indexPath.row]
        cell.setupFavoriteCell(favorite: items)
        cell.favoritePhoto.layer.cornerRadius = 10
        return cell
    }
    // MARK: func delete in realm and Favorite
    private func delete() {
        let delete = item[0]
        try! realm.write {
            realm.delete(delete)
            favoriteCollectionView.reloadData()
            print("delete \(delete)")
        }
    }
    // MARK: alert before delete in favorite photo
    private func showDeleteAlert() {
        let deleteAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        let done = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.delete()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Tap Cancel")
        }
        deleteAlert.addAction(done)
        deleteAlert.addAction(cancel)
        
        self.present(deleteAlert, animated: true, completion: nil)
    }
}
