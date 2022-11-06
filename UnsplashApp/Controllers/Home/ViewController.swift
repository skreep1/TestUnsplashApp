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
    private var searchViewModel = SearchViewModel()
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil) // remove text "back" in navigation
        featchPhoto()
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
    }
}

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.layer.cornerRadius = 10
        let photo = photos[indexPath.row]
        cell.setup(photo: photo)
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
        let indexPath = self.homeCollectionView.indexPath(for: cell) {
        let vc = segue.destination as! PhotoDetailViewController
        vc.photo = photos[indexPath.row]
            
        }
    }
    // MARK: Search Photo
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.fetchPhoto(searchTerm: searchText) { result in
            switch result {
            case .success(let data):
                self.photos = data
                DispatchQueue.main.async {
                    self.homeCollectionView.reloadData()
                    print(result)
                }
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    // MARK: 
    private func featchPhoto() {
        photoViewModel.fetchPhoto { result in
            switch result {
            case .success(let data):
                self.photos = data
                DispatchQueue.main.async {
                    self.homeCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
