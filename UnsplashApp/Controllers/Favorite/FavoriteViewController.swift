//
//  FavoriteViewController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 01.11.2022.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController {
    private var item: Results<Favorite>!
    private let realm = try! Realm()
    @IBAction func favoriteButton(_ sender: Any) {
        showDeleteAlert()
    }
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.favoriteCollectionView.dataSource = self
        self.favoriteCollectionView.delegate = self
        
        item = realm.objects(Favorite.self)
        favoriteCollectionView.reloadData()
        
    }
    
    
}
extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
        let item = item[indexPath.row]
        cell.nameLabel.text = item.name
        
        return cell
    }
    
    private func delete() {
        let delete = item[0]
        try! realm.write {
            realm.delete(delete)
            favoriteCollectionView.reloadData()
            print("delete \(delete)")
        }
    }
    private func showDeleteAlert() {
        var deleteAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)

        let ok = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.delete()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Tap Cancel")
        }
        deleteAlert.addAction(ok)
        deleteAlert.addAction(cancel)

        self.present(deleteAlert, animated: true, completion: nil)
    }
}
