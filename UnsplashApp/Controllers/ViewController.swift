//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 26.10.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var photos =  [Photo]()
    private var photoViewModel = PhotoViewModel()
    
    @IBOutlet weak var homeCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        photoViewModel.fetchPhoto { result in
            switch result {
            case .success(let data):
                self.photos = data
                DispatchQueue.main.async {
                    self.homeCV.reloadData()
                }
            case .failure(let err):
                print("error")
                break
            }
        }
        self.homeCV.dataSource = self
        self.homeCV.delegate = self
        
    }
    
}
extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(photo: photo)
        return cell
        
    }
    
    
    
}
