//
//  getPhotoViewModel.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 26.10.2022.
//

import Foundation

class PhotoViewModel {
    //        let url = URL(string: "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)")
    private let key = "BJonXMr1gOp83I7Nr49bFtNHaaS4C9TzNJ9F0xUb2yQ"
    var photo: [Photo] = []
    
    // MARK: func fetchPhoto
    func fetchPhoto(completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = URL(string: "https://api.unsplash.com/photos/random/?count=100&client_id=\(key)")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.setValue("Client-ID \(key)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                do {
                    let image = try JSONDecoder().decode([Photo].self, from: data)
                    self.photo.append(contentsOf: image)
                    completion(.success(self.photo))
                  //  print(image)
                    
                } catch let error {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    
}
